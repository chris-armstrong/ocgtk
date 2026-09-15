(* GIR <doc> markdown -> odoc markup translation.

   Two pure stages joined by a flat AST; see the .mli for the design and
   for the decisions recorded for this phase (fallback collection, render
   context handling, comment-hazard pass, corpus-derived grammar notes).

   The parse grammar is implemented as:

   - a block scanner over the doc's lines (headings, fences, admonitions,
     pictures, quotes, lists, tables, horizontal rules, paragraphs),
   - an inline scanner over each paragraph/item/heading text (code spans,
     emphasis, links, fragments, legacy sigils, param refs, images).

   Both scanners also collect the parse-time fallback events; the renderer
   collects the render-time ones. *)

type sym_kind =
  | Class
  | Iface
  | Enum
  | Flags
  | Struct
  | Alias
  | Callback
  | Const
  | Ctor
  | Func
  | Method
  | Property
  | Signal
  | Vfunc
  | Error
  | Id
  | Type_kind
[@@deriving eq]

type inline =
  | Text of string
  | Code of string
  | Bold of inline list
  | Italic of inline list
  | Link of { text : inline list; url : string }
  | Page_ref of { text : inline list; path : string; anchor : string option }
  | Sym_ref of {
      kind : sym_kind option;
      endpoint : string;
      anchor : string option;
    }
  | Param_ref of string
  | Ref of string
[@@deriving eq]

type block =
  | Para of inline list
  | Heading of int * inline list
  | List of bool * inline list list
  | Code_block of string
[@@deriving eq]

type t = { blocks : block list }

(* [ppx_deriving.eq] derives a function named [equal] (not [equal_t]) for a
   type named [t], which is confusing next to the module's own [equal_t]
   convention; provide [equal_t] by hand so the round-trip tests have the
   module's own structural equality. *)
let equal_t (a : t) (b : t) : bool = List.equal equal_block a.blocks b.blocks

type context = Entity | Member

type fallback =
  | Inline_code_unbalanced of string
  | Code_block_verbatim of string
  | Code_block_stripped of string
  | Sym_ref_degraded of string
  | Page_ref_degraded of string
  | Link_degraded of string
  | Admonition_stripped of string
  | Table_stripped
  | Picture_stripped of string option
  | Image_stripped of string
  | Quote_stripped
[@@deriving eq]

(* --------------------------------------------------------------------- *)
(* Character helpers                                                       *)
(* --------------------------------------------------------------------- *)

let is_upper c = c >= 'A' && c <= 'Z'
let is_lower c = c >= 'a' && c <= 'z'
let is_digit c = c >= '0' && c <= '9'
let is_letter c = is_upper c || is_lower c
let is_ident_char c = is_letter c || is_digit c || c = '_'

(** [starts_with s pos prefix] — [true] iff [s] has [prefix] at [pos]. *)
let starts_with s pos prefix =
  let n = String.length prefix in
  pos + n <= String.length s
  &&
  let rec go i = i >= n || (String.get s (pos + i) = String.get prefix i && go (i + 1)) in
  go 0

(** [contains_sub s sub] — substring containment. *)
let contains_sub s sub =
  let n = String.length s in
  let m = String.length sub in
  let rec find i = i + m <= n && (starts_with s i sub || find (i + 1)) in
  find 0

let contains_char s c =
  let n = String.length s in
  let rec go i = i < n && (String.get s i = c || go (i + 1)) in
  go 0

let is_blank_line line = String.equal (String.trim line) ""

let strip_trailing_newline s =
  let n = String.length s in
  if n > 0 && s.[n - 1] = '\n' then String.sub s 0 (n - 1) else s

(** [read_while f s pos] — first index at or after [pos] where [f] fails. *)
let read_while f s pos =
  let n = String.length s in
  let rec go i = if i < n && f s.[i] then go (i + 1) else i in
  go pos

(** Split an endpoint at the first [#]; the part after it is the anchor. *)
let split_anchor endpoint =
  match String.index_opt endpoint '#' with
  | Some i ->
      (String.sub endpoint 0 i, Some (String.sub endpoint (i + 1) (String.length endpoint - i - 1)))
  | None -> (endpoint, None)

(** Strip surrounding backticks from a backtick-wrapped endpoint. *)
let strip_endpoint_backticks endpoint =
  let n = String.length endpoint in
  if n >= 2 && endpoint.[0] = '`' && endpoint.[n - 1] = '`' then
    String.sub endpoint 1 (n - 2)
  else endpoint

(* --------------------------------------------------------------------- *)
(* Fragment keyword -> kind                                                *)
(* --------------------------------------------------------------------- *)

let sym_kind_of_keyword kw =
  match kw with
  | "class" -> Some Class
  | "iface" -> Some Iface
  | "enum" -> Some Enum
  | "flags" -> Some Flags
  | "struct" -> Some Struct
  | "alias" -> Some Alias
  | "callback" -> Some Callback
  | "const" -> Some Const
  | "ctor" -> Some Ctor
  | "func" -> Some Func
  | "method" -> Some Method
  | "property" -> Some Property
  | "signal" -> Some Signal
  | "vfunc" -> Some Vfunc
  | "error" -> Some Error
  | "id" -> Some Id
  | "type" -> Some Type_kind
  | _ -> None

(* --------------------------------------------------------------------- *)
(* Inline scanner                                                          *)
(* --------------------------------------------------------------------- *)

type token =
  | T_char of char
  | T_nodes of inline list

let backtick_run s pos =
  let n = String.length s in
  let rec go i = if i < n && s.[i] = '`' then go (i + 1) else i - pos in
  go pos

(* A backtick-delimited code span. The closing run must be at least as long
   as the opening run. An unmatched opener is left as literal text (a
   one-sided backtick must not swallow the rest of the paragraph). *)
let code_span s pos =
  let k = backtick_run s pos in
  let n = String.length s in
  let rec find_close i =
    if i + k > n then None
    else if backtick_run s i >= k then Some i
    else find_close (i + 1)
  in
  match find_close (pos + k) with
  | Some j ->
      let content = String.sub s (pos + k) (j - (pos + k)) in
      let close_run = backtick_run s j in
      Some (T_nodes [ Code content ], j + Int.min k close_run, [])
  | None -> None

(* [*]/[**] emphasis. The opener must have a non-empty, space-free content
   and a matching closer; a lone or space-bounded star is literal text. *)
let rec emphasis s pos =
  let n = String.length s in
  if pos >= n || s.[pos] <> '*' then None
  else if pos + 1 >= n then Some (T_char '*', pos + 1, [])
  else if s.[pos + 1] = '*' then (
    (* bold: find a closing [**] *)
    let rec find_bold j =
      if j + 1 >= n then None
      else if s.[j] = '*' && s.[j + 1] = '*' then Some j
      else find_bold (j + 1)
    in
    match find_bold (pos + 2) with
    | Some j ->
        let content = String.sub s (pos + 2) (j - pos - 2) in
        let trimmed = String.trim content in
        if String.equal trimmed "" || not (String.equal trimmed content) then
          Some (T_char '*', pos + 1, [])
        else
          let ins, fbs = parse_inline content in
          Some (T_nodes [ Bold ins ], j + 2, fbs)
    | None -> Some (T_char '*', pos + 1, []))
  else if pos > 0 && s.[pos - 1] = '*' then Some (T_char '*', pos + 1, [])
  else (
    (* italic: a closing single star, not adjacent to another star *)
    let rec find_italic j =
      if j >= n then None
      else
        let after_is_star = j + 1 < n && s.[j + 1] = '*' in
        let before_is_star = j > pos + 1 && s.[j - 1] = '*' in
        if s.[j] = '*' && not after_is_star && not before_is_star then Some j
        else find_italic (j + 1)
    in
    match find_italic (pos + 1) with
    | Some j ->
        let content = String.sub s (pos + 1) (j - pos - 1) in
        let trimmed = String.trim content in
        if String.equal trimmed "" || not (String.equal trimmed content) then
          Some (T_char '*', pos + 1, [])
        else
          let ins, fbs = parse_inline content in
          Some (T_nodes [ Italic ins ], j + 1, fbs)
    | None -> Some (T_char '*', pos + 1, []))

(* A gi-docgen [keyword@endpoint] fragment. Only known fragment keywords
   count as references (unknown [foo@bar] bracket text falls through to the
   link check and then to literal text). The whole keyword@endpoint may be
   backtick-wrapped ([`method@Foo`]) — the backticks are allowed and
   stripped per the linking grammar; a trailing [#anchor] may be
   appended. *)
and fragment s pos =
  let n = String.length s in
  let backticked = pos + 1 < n && s.[pos + 1] = '`' in
  let start = if backticked then pos + 2 else pos + 1 in
  let kw_end = read_while is_lower s start in
  if kw_end > start && kw_end < n && s.[kw_end] = '@' then (
    match sym_kind_of_keyword (String.sub s start (kw_end - start)) with
    | None -> None
    | kind ->
        let rec find_close i =
          if i >= n || s.[i] = '\n' then None
          else if s.[i] = ']' then Some i
          else find_close (i + 1)
        in
        (match find_close (kw_end + 1) with
        | Some close ->
            let raw = String.sub s (kw_end + 1) (close - kw_end - 1) in
            let raw =
              if backticked && String.length raw > 0 && raw.[String.length raw - 1] = '`' then
                String.sub raw 0 (String.length raw - 1)
              else raw
            in
            let endpoint, anchor = split_anchor (strip_endpoint_backticks raw) in
            Some (T_nodes [ Sym_ref { kind; endpoint; anchor } ], close + 1, [])
        | None -> None))
  else None

(* A markdown [text](url) link. The url is classified at parse time into
   [Link] (https), [Page_ref] (relative .html page link or bare #anchor) or
   a degraded bare-text link. *)
and link s pos =
  let n = String.length s in
  let rec find_bracket i =
    if i >= n || s.[i] = '\n' then None
    else if s.[i] = ']' then Some i
    else find_bracket (i + 1)
  in
  match find_bracket (pos + 1) with
  | Some bracket when bracket + 1 < n && s.[bracket + 1] = '(' ->
      let rec find_paren i =
        if i >= n then None
        else if s.[i] = ')' then Some i
        else find_paren (i + 1)
      in
      (match find_paren (bracket + 2) with
      | Some paren ->
          let text_raw = String.sub s (pos + 1) (bracket - pos - 1) in
          let url = String.sub s (bracket + 2) (paren - bracket - 2) in
          let text, fbs = parse_inline text_raw in
          let next = paren + 1 in
          if starts_with url 0 "https://" then
            Some (T_nodes [ Link { text; url } ], next, fbs)
          else if starts_with url 0 "http://" then
            Some (T_nodes text, next, Link_degraded url :: fbs)
          else if starts_with url 0 "#" || contains_sub url ".html" then
            let path, anchor = split_anchor url in
            Some (T_nodes [ Page_ref { text; path; anchor } ], next, fbs)
          else Some (T_nodes text, next, Link_degraded url :: fbs)
      | None -> None)
  | _ -> None

(* A markdown [![alt](src)] image or a bare [<img ... alt="...">] element:
   the alt text is kept as plain prose and the construct is counted. *)
and image s pos =
  let n = String.length s in
  if pos + 1 >= n || s.[pos] <> '!' || s.[pos + 1] <> '[' then None
  else
    let rec find_bracket i =
      if i >= n || s.[i] = '\n' then None
      else if s.[i] = ']' then Some i
      else find_bracket (i + 1)
    in
    match find_bracket (pos + 2) with
    | Some bracket when bracket + 1 < n && s.[bracket + 1] = '(' ->
        let rec find_paren i =
          if i >= n then None
          else if s.[i] = ')' then Some i
          else find_paren (i + 1)
        in
        (match find_paren (bracket + 2) with
        | Some paren ->
            let alt = String.sub s (pos + 2) (bracket - pos - 2) in
            Some (T_nodes [ Text alt ], paren + 1, [ Image_stripped alt ])
        | None -> None)
    | _ -> None

and extract_alt tag =
  let n = String.length tag in
  let rec find_eq i =
    if i + 4 >= n then None
    else if tag.[i] = 'a' && tag.[i + 1] = 'l' && tag.[i + 2] = 't' && tag.[i + 3] = '='
    then Some (i + 4)
    else find_eq (i + 1)
  in
  match find_eq 0 with
  | None -> ""
  | Some q when q < n && (tag.[q] = '"' || tag.[q] = '\'') ->
      let rec find_close j =
        if j >= n then None
        else if tag.[j] = tag.[q] then Some j
        else find_close (j + 1)
      in
      (match find_close (q + 1) with
      | Some close -> String.sub tag (q + 1) (close - q - 1)
      | None -> "")
  | Some _ -> ""

and img_tag s pos =
  let n = String.length s in
  if not (starts_with s pos "<img") then None
  else
    let rec find_close i =
      if i >= n then None
      else if s.[i] = '>' then Some i
      else find_close (i + 1)
    in
    (match find_close (pos + 4) with
    | Some close ->
        let tag = String.sub s pos (close - pos + 1) in
        let alt = extract_alt tag in
        Some (T_nodes [ Text alt ], close + 1, [ Image_stripped alt ])
    | None -> None)

and is_escapeable c =
  c = '`' || c = '*' || c = '_' || c = '{' || c = '}' || c = '['
  || c = ']' || c = '(' || c = ')' || c = '#' || c = '+' || c = '-'
  || c = '.' || c = '!' || c = '|' || c = '>' || c = '<' || c = '~'
  || c = '@' || c = '\\'

and backslash_escape s pos =
  if s.[pos] <> '\\' then None
  else if pos + 1 < String.length s && is_escapeable s.[pos + 1] then
    Some (T_char s.[pos + 1], pos + 2, [])
  else Some (T_char '\\', pos + 1, [])

(* A legacy gtk-doc [@param] reference. The name must start lowercase, must
   not be preceded by an identifier character, and must not run into a
   [.]+letter (the email / namespace guard). *)
and param_ref s pos =
  let n = String.length s in
  if s.[pos] <> '@' || (pos > 0 && is_ident_char s.[pos - 1]) then None
  else if pos + 1 >= n || not (is_lower s.[pos + 1]) then None
  else
    let id_end = read_while is_ident_char s (pos + 1) in
    let email_like =
      id_end + 1 < n && s.[id_end] = '.'
      && id_end + 2 < n && is_letter s.[id_end + 1]
    in
    if email_like then None
    else
      let name = String.sub s (pos + 1) (id_end - pos - 1) in
      Some (T_nodes [ Param_ref name ], id_end, [])

(* A legacy gtk-doc [#Type...] sigil. Guards (GIR plan §3.5): [#] not
   preceded by [/], then an uppercase identifier with no space. [#Type:p]
   and [#Type::s] suffixes stay on the endpoint. *)
and hash_sigil s pos =
  let n = String.length s in
  if s.[pos] <> '#' || (pos > 0 && s.[pos - 1] = '/') then None
  else if pos + 1 >= n || not (is_upper s.[pos + 1]) then None
  else
    let id_end = read_while is_ident_char s (pos + 1) in
    let name = String.sub s (pos + 1) (id_end - pos - 1) in
    let extension =
      if id_end < n && s.[id_end] = ':' then
        let sep = if id_end + 1 < n && s.[id_end + 1] = ':' then 2 else 1 in
        let after = id_end + sep in
        if after < n && is_ident_char s.[after] then
          let e2 = read_while is_ident_char s after in
          Some (String.sub s id_end (e2 - id_end))
        else None
      else None
    in
    let endpoint, next =
      match extension with
      | Some e -> (name ^ e, id_end + String.length e)
      | None -> (name, id_end)
    in
    Some (T_nodes [ Sym_ref { kind = None; endpoint; anchor = None } ], next, [])

(* A legacy gtk-doc [%CONSTANT] sigil: [%] followed by an uppercase
   identifier with no space. *)
and percent_sigil s pos =
  let n = String.length s in
  if s.[pos] <> '%' then None
  else if pos + 1 >= n || not (is_upper s.[pos + 1]) then None
  else
    let id_end = read_while is_ident_char s (pos + 1) in
    let endpoint = String.sub s (pos + 1) (id_end - pos - 1) in
    Some (T_nodes [ Sym_ref { kind = None; endpoint; anchor = None } ], id_end, [])

and scan_token s pos =
  let n = String.length s in
  if pos >= n || pos < 0 then None
  else
    let c = s.[pos] in
    if c = '\\' then backslash_escape s pos
    else if c = '`' then code_span s pos
    else if c = '<' && starts_with s pos "<img" then img_tag s pos
    else if c = '!' && pos + 1 < n && s.[pos + 1] = '[' then image s pos
    else if c = '[' then (
      match fragment s pos with
      | Some tok -> Some tok
      | None -> link s pos)
    else if c = '*' then emphasis s pos
    else if c = '@' then param_ref s pos
    else if c = '#' then hash_sigil s pos
    else if c = '%' then percent_sigil s pos
    else None

and parse_inline s : inline list * fallback list =
  let text_buf = Buffer.create 32 in
  let flush acc =
    if Buffer.length text_buf = 0 then acc
    else
      let t = Text (Buffer.contents text_buf) in
      Buffer.clear text_buf;
      t :: acc
  in
  let rec go pos acc fbs =
    if pos >= String.length s then (List.rev (flush acc), List.rev fbs)
    else
      match scan_token s pos with
      | None ->
          Buffer.add_char text_buf s.[pos];
          go (pos + 1) acc fbs
      | Some (T_char c, next, _extra) ->
          Buffer.add_char text_buf c;
          go next acc fbs
      | Some (T_nodes nodes, next, extra) ->
          let acc = flush acc in
          let acc = List.fold_right (fun nd a -> nd :: a) nodes acc in
          go next acc (List.rev_append extra fbs)
  in
  go 0 [] []

(* --------------------------------------------------------------------- *)
(* Block scanner                                                           *)
(* --------------------------------------------------------------------- *)

(** [array_slice lines lo hi] — inclusive index range as a list. *)
let array_slice lines lo hi =
  let rec go k acc = if k > hi then List.rev acc else go (k + 1) (lines.(k) :: acc) in
  go lo []

let read_heading_level line =
  let n = String.length line in
  let rec count i = if i < n && line.[i] = '#' then count (i + 1) else i in
  let k = count 0 in
  if k >= 1 && k <= 6 && (k >= n || line.[k] = ' ') then
    Some (k, String.trim (String.sub line k (n - k)))
  else None

type marker_kind = M_bullet | M_ordered

let marker_ordered = function M_ordered -> true | M_bullet -> false

let list_marker line =
  let n = String.length line in
  if n >= 2 && line.[0] = '-' && line.[1] = ' ' then Some M_bullet
  else if n >= 2 && line.[0] = '*' && line.[1] = ' ' then Some M_bullet
  else
    let d = read_while is_digit line 0 in
    if d > 0 && d + 1 < n && line.[d] = '.' && line.[d + 1] = ' ' then Some M_ordered
    else None

(** The text of a marker line, minus its leading marker. *)
let item_text kind line =
  match kind with
  | M_bullet -> String.sub line 2 (String.length line - 2)
  | M_ordered ->
      let d = read_while is_digit line 0 in
      String.sub line (d + 2) (String.length line - d - 2)

(* A list block: consecutive marker lines of the same kind, with indented
   non-marker lines folded into the preceding item (markdown continuation).
   A nested, indented marker line becomes a flat sibling item (the flat AST
   has no list nesting; deterministic and round-trip stable). *)
let list_block kind lines i =
  let n = Array.length lines in
  let finish cur fbs =
    let text = String.concat "\n" (List.rev cur) in
    let ins, extra = parse_inline text in
    (ins, List.rev_append extra fbs)
  in
  let rec go j items fbs cur =
    if j >= n || is_blank_line lines.(j) then
      let ins, fbs = finish cur fbs in
      (List (marker_ordered kind, List.rev (ins :: items)), j, fbs)
    else
      let raw = lines.(j) in
      let line = String.trim raw in
      match list_marker line with
      | Some k ->
          if Bool.equal (marker_ordered k) (marker_ordered kind) then
            let ins, fbs = finish cur fbs in
            go (j + 1) (ins :: items) fbs [ item_text kind line ]
          else
            let ins, fbs = finish cur fbs in
            (List (marker_ordered kind, List.rev (ins :: items)), j, fbs)
      | None ->
          let indented =
            String.length raw > 0 && (raw.[0] = ' ' || raw.[0] = '\t')
          in
          if indented then go (j + 1) items fbs (line :: cur)
          else
            let ins, fbs = finish cur fbs in
            (List (marker_ordered kind, List.rev (ins :: items)), j, fbs)
  in
  go (i + 1) [] [] [ item_text kind (String.trim lines.(i)) ]

(* Triple- and double-backtick fences. A line is a fence opener when its
   trimmed form starts with at least two backticks and a later line starts
   with an at-least-as-long backtick run. *)
let backtick_fence lines i =
  let line = String.trim lines.(i) in
  let k = read_while (fun c -> c = '`') line 0 in
  if k < 2 then None
  else
    let n = Array.length lines in
    let rec find_close j =
      if j >= n then None
      else
        let t = String.trim lines.(j) in
        let run = read_while (fun c -> c = '`') t 0 in
        if run >= k then Some j else find_close (j + 1)
    in
    (match find_close (i + 1) with
    | Some j ->
        let content = String.concat "\n" (array_slice lines (i + 1) (j - 1)) in
        Some (Code_block (strip_trailing_newline content), j + 1)
    | None -> None)

(* The gi-docgen pipe fence [|[...]|], optionally with a leading
   [<!-- language="X" -->] line. *)
let pipe_fence lines i =
  let line = String.trim lines.(i) in
  if not (starts_with line 0 "|[") then None
  else
    let n = Array.length lines in
    let rec find_close j =
      if j >= n then None
      else
        let t = String.trim lines.(j) in
        if starts_with t 0 "]|" then Some j else find_close (j + 1)
    in
    (match find_close (i + 1) with
    | Some j ->
        let raw_content = String.concat "\n" (array_slice lines (i + 1) (j - 1)) in
        let content =
          match String.split_on_char '\n' raw_content with
          | first :: rest when starts_with (String.trim first) 0 "<!-- language=" ->
              String.concat "\n" rest
          | _ -> raw_content
        in
        Some (Code_block (strip_trailing_newline content), j + 1)
    | None -> None)

let fence_block lines i =
  match backtick_fence lines i with
  | Some r -> Some r
  | None -> pipe_fence lines i

let is_hr_line line =
  let n = String.length line in
  n >= 3
  &&
  match line.[0] with
  | '-' | '*' | '_' ->
      let rec all i = i >= n || (line.[i] = line.[0] && all (i + 1)) in
      all 1
  | _ -> false

(* An admonition: [::: type] line, indented content until the next blank
   line. Stripped to a plain paragraph; the type is recorded. *)
let admonition_block lines i =
  let line = String.trim lines.(i) in
  if not (starts_with line 0 ":::") then None
  else
    let typ = String.trim (String.sub line 3 (String.length line - 3)) in
    let n = Array.length lines in
    let rec gather j acc =
      if j >= n then (List.rev acc, j)
      else if is_blank_line lines.(j) then (List.rev acc, j)
      else gather (j + 1) (String.trim lines.(j) :: acc)
    in
    let content_lines, next = gather (i + 1) [] in
    let text = String.concat "\n" content_lines in
    if String.equal text "" then Some (None, next, [ Admonition_stripped typ ])
    else
      let ins, fbs = parse_inline text in
      Some (Some (Para ins), next, Admonition_stripped typ :: fbs)

(* A [<picture>] block: stripped to the first [<img alt>] text (plain
   prose); counted. *)
let picture_block lines i =
  if not (contains_sub lines.(i) "<picture>") then None
  else
    let n = Array.length lines in
    let rec find_end j =
      if j >= n then None
      else if contains_sub lines.(j) "</picture>" then Some j
      else find_end (j + 1)
    in
    (match find_end (i + 1) with
    | Some j ->
        let region = String.concat "\n" (array_slice lines i j) in
        let alt = extract_alt region in
        let block =
          if String.equal alt "" then None else Some (Para [ Text alt ])
        in
        let alt_opt = if String.equal alt "" then None else Some alt in
        Some (block, j + 1, [ Picture_stripped alt_opt ])
    | None -> None)

(* A [> quote]: markers stripped, content kept as plain prose; counted. *)
let quote_block lines i =
  let line = String.trim lines.(i) in
  if not (starts_with line 0 "> ") then None
  else
    let first = String.trim (String.sub line 2 (String.length line - 2)) in
    let n = Array.length lines in
    let rec gather j acc =
      if j >= n then (List.rev acc, j)
      else
        let t = String.trim lines.(j) in
        if starts_with t 0 "> " then
          gather (j + 1) (String.trim (String.sub t 2 (String.length t - 2)) :: acc)
        else (List.rev acc, j)
    in
    let content, next = gather (i + 1) [ first ] in
    let content = List.filter (fun x -> not (String.equal x "")) content in
    let text = String.concat "\n" content in
    if String.equal text "" then Some (None, next, [ Quote_stripped ])
    else
      let ins, fbs = parse_inline text in
      Some (Some (Para ins), next, Quote_stripped :: fbs)

(* A markdown table: consecutive lines starting with [|]; dropped entirely
   (cell text is not prose); counted. *)
let table_block lines i =
  let line = String.trim lines.(i) in
  if String.length line = 0 || line.[0] <> '|' || starts_with line 0 "|[" then None
  else
    let n = Array.length lines in
    let rec go j =
      if j >= n then j
      else
        let t = String.trim lines.(j) in
        if String.length t > 0 && t.[0] = '|' && not (starts_with t 0 "|[") then
          go (j + 1)
        else j
    in
    Some (go (i + 1), Table_stripped)

type step =
  | S_para
  | S_blank
  | S_block of block option * int * fallback list

let heading_detector lines i =
  match read_heading_level (String.trim lines.(i)) with
  | None -> None
  | Some (lvl, text) ->
      let ins, fbs = parse_inline text in
      Some (S_block (Some (Heading (lvl, ins)), 1, fbs))

let fence_detector lines i =
  match fence_block lines i with
  | Some (blk, next) -> Some (S_block (Some blk, next - i, []))
  | None -> None

let admonition_detector lines i =
  match admonition_block lines i with
  | Some (blk, next, fbs) -> Some (S_block (blk, next - i, fbs))
  | None -> None

let picture_detector lines i =
  match picture_block lines i with
  | Some (blk, next, fbs) -> Some (S_block (blk, next - i, fbs))
  | None -> None

let quote_detector lines i =
  match quote_block lines i with
  | Some (blk, next, fbs) -> Some (S_block (blk, next - i, fbs))
  | None -> None

let list_detector lines i =
  match list_marker (String.trim lines.(i)) with
  | None -> None
  | Some kind ->
      let blk, next, fbs = list_block kind lines i in
      Some (S_block (Some blk, next - i, fbs))

let table_detector lines i =
  match table_block lines i with
  | Some (next, fb) -> Some (S_block (None, next - i, [ fb ]))
  | None -> None

let hr_detector lines i =
  if is_hr_line (String.trim lines.(i)) then Some S_blank else None

let detectors =
  [
    heading_detector;
    fence_detector;
    admonition_detector;
    picture_detector;
    quote_detector;
    list_detector;
    table_detector;
    hr_detector;
  ]

let rec first_some fns lines i =
  match fns with
  | [] -> S_para
  | f :: rest -> (
      match f lines i with
      | Some step -> step
      | None -> first_some rest lines i)

let classify_line lines i =
  let line = String.trim lines.(i) in
  if is_blank_line line then S_blank else first_some detectors lines i

let parse_blocks (text : string) : block list * fallback list =
  let lines = Array.of_list (String.split_on_char '\n' text) in
  let n = Array.length lines in
  let flush_para paras blocks fbs =
    match paras with
    | [] -> (blocks, fbs)
    | _ ->
        let para_text = String.concat "\n" (List.rev paras) in
        let ins, extra = parse_inline para_text in
        (Para ins :: blocks, List.rev_append extra fbs)
  in
  let rec go i paras blocks fbs =
    if i >= n then flush_para paras blocks fbs
    else
      match classify_line lines i with
      | S_para ->
          go (i + 1) (String.trim lines.(i) :: paras) blocks fbs
      | S_blank ->
          let blocks, fbs = flush_para paras blocks fbs in
          go (i + 1) [] blocks fbs
      | S_block (blk, consumed, extra) ->
          let blocks, fbs = flush_para paras blocks fbs in
          let blocks = match blk with Some b -> b :: blocks | None -> blocks in
          let fbs = List.rev_append extra fbs in
          go (i + consumed) [] blocks fbs
  in
  let blocks, fbs = go 0 [] [] [] in
  (List.rev blocks, fbs)

(* --------------------------------------------------------------------- *)
(* Render                                                                  *)
(* --------------------------------------------------------------------- *)

(* odoc-special escaping in prose contexts: \{ \} \[ \@ (plan invariant 2).
   A stray ] is left bare: odoc treats it as literal text (at worst a
   benign warning, never a misparse), and code spans manage their own ]
   via the balance fallback. *)
let escape_prose buf s =
  let n = String.length s in
  let rec go i =
    if i >= n then ()
    else
      match s.[i] with
      | '{' | '}' | '[' | '@' ->
          Buffer.add_char buf '\\';
          Buffer.add_char buf s.[i];
          go (i + 1)
      | _ ->
          Buffer.add_char buf s.[i];
          go (i + 1)
  in
  go 0

let rec render_inline ins buf fbs =
  List.fold_left
    (fun fbs' inl ->
      match inl with
      | Text s ->
          escape_prose buf s;
          fbs'
      | Code s ->
          if contains_char s ']' then (
            (* balance fallback (plan invariant 3): escaped plain prose *)
            escape_prose buf s;
            Inline_code_unbalanced s :: fbs')
          else (
            Buffer.add_char buf '[';
            Buffer.add_string buf s;
            Buffer.add_char buf ']';
            fbs')
      | Bold inner ->
          Buffer.add_string buf "{b ";
          let f = render_inline inner buf fbs' in
          Buffer.add_char buf '}';
          f
      | Italic inner ->
          Buffer.add_string buf "{i ";
          let f = render_inline inner buf fbs' in
          Buffer.add_char buf '}';
          f
      | Link { text; url } ->
          Buffer.add_string buf "{{:";
          Buffer.add_string buf url;
          Buffer.add_char buf '}';
          let f = render_inline text buf fbs' in
          Buffer.add_char buf '}';
          f
      | Page_ref { text; path; anchor = _ } ->
          (* v1: degraded to bare text (upstream-URL leg is a pure rewrite) *)
          let f = render_inline text buf fbs' in
          Page_ref_degraded path :: f
      | Sym_ref { endpoint; kind = _; anchor = _ } ->
          (* v1: degraded to a code span (the §7 resolver leg is a pure
             rewrite to [Ref]) *)
          Buffer.add_char buf '[';
          Buffer.add_string buf endpoint;
          Buffer.add_char buf ']';
          Sym_ref_degraded endpoint :: fbs'
      | Param_ref name ->
          (* always a code span: a bare @ would start an odoc tag *)
          Buffer.add_char buf '[';
          Buffer.add_string buf name;
          Buffer.add_char buf ']';
          fbs'
      | Ref path ->
          Buffer.add_string buf "{!";
          Buffer.add_string buf path;
          Buffer.add_char buf '}';
          fbs')
    fbs ins

(* The comment-hazard pass (plan invariant 1): insert a backslash between
   the two characters of a star-paren / paren-star sequence, over the whole
   final output — inside code spans and verbatim blocks included. *)
let neutralise_comment_hazards s =
  let buf = Buffer.create (String.length s + 8) in
  let n = String.length s in
  let rec go i =
    if i >= n then ()
    else
      let pair =
        i + 1 < n && ((s.[i] = '*' && s.[i + 1] = ')') || (s.[i] = '(' && s.[i + 1] = '*'))
      in
      if pair then (
        Buffer.add_char buf s.[i];
        Buffer.add_char buf '\\';
        Buffer.add_char buf s.[i + 1];
        go (i + 2))
      else (
        Buffer.add_char buf s.[i];
        go (i + 1))
  in
  go 0;
  Buffer.contents buf

let render_with_fallbacks ctx (t : t) : string * fallback list =
  (* Entity heading normalisation: the doc's shallowest markdown level maps
     to {1}, deeper levels keep their offsets, capped at {5}. *)
  let shallowest =
    List.fold_left
      (fun acc blk -> match blk with Heading (l, _) -> Int.min acc l | _ -> acc)
      7 t.blocks
  in
  let shift = shallowest - 1 in
  let render_block blk : string * fallback list =
    let buf = Buffer.create 64 in
    let fbs =
      match blk with
      | Para ins -> render_inline ins buf []
      | Heading (lvl, ins) -> (
          match ctx with
          | Entity ->
              let level = Int.min (lvl - shift) 5 in
              Buffer.add_char buf '{';
              Buffer.add_string buf (string_of_int level);
              Buffer.add_char buf ' ';
              let f = render_inline ins buf [] in
              Buffer.add_char buf '}';
              f
          | Member ->
              Buffer.add_string buf "{b ";
              let f = render_inline ins buf [] in
              Buffer.add_char buf '}';
              f)
      | List (ordered, items) ->
          let prefix = if ordered then "+ " else "- " in
          let fbs =
            List.fold_left
              (fun fbs item ->
                Buffer.add_string buf prefix;
                let f = render_inline item buf fbs in
                Buffer.add_char buf '\n';
                f)
              [] items
          in
          let len = Buffer.length buf in
          if len > 0 && Buffer.nth buf (len - 1) = '\n' then
            Buffer.truncate buf (len - 1);
          fbs
      | Code_block content ->
          if contains_sub content "]}" then (
            if contains_sub content "v}" then
              (* neither {[ ... ]} nor {v ... v} can carry this content *)
              Code_block_stripped content :: []
            else (
              Buffer.add_string buf "{v\n";
              Buffer.add_string buf content;
              Buffer.add_string buf "\nv}";
              Code_block_verbatim content :: []))
          else (
            if String.equal content "" then Buffer.add_string buf "{[]}"
            else (
              Buffer.add_string buf "{[\n";
              Buffer.add_string buf content;
              Buffer.add_string buf "\n]}");
            [])
    in
    (Buffer.contents buf, fbs)
  in
  let rendered, fbs =
    List.fold_left
      (fun (acc, fbs) blk ->
        let s, blk_fbs = render_block blk in
        (s :: acc, List.rev_append blk_fbs fbs))
      ([], []) t.blocks
  in
  let output =
    List.rev rendered |> List.filter (fun s -> not (String.equal s ""))
    |> String.concat "\n\n"
  in
  (neutralise_comment_hazards output, fbs)

(* --------------------------------------------------------------------- *)
(* Public API                                                              *)
(* --------------------------------------------------------------------- *)

let parse_with_fallbacks _ctx s =
  let blocks, fbs = parse_blocks (String.trim s) in
  ({ blocks }, fbs)

let parse ctx s = fst (parse_with_fallbacks ctx s)

let render_as ctx t = fst (render_with_fallbacks ctx t)

(* [render] is the [Entity] policy: module comments are the canonical
   attachment point in the emission inventory. *)
let render t = render_as Entity t

let translate_with_fallbacks ctx s =
  let t, parse_fbs = parse_with_fallbacks ctx s in
  let out, render_fbs = render_with_fallbacks ctx t in
  (out, parse_fbs @ render_fbs)

let translate ctx s = fst (translate_with_fallbacks ctx s)
