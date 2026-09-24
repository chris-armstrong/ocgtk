(* GIR <doc> markdown -> Doc_ast parser; see the .mli for the design.

   Implemented as:

   - a block scanner over the doc's lines (headings, fences, admonitions,
     pictures, quotes, lists, tables, horizontal rules, paragraphs),
   - an inline scanner over each paragraph/item/heading text (code spans,
     emphasis, links, fragments, legacy sigils, param refs, images).

   Both scanners collect the parse-time fallback events. *)

open Doc_ast

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
  let rec go i =
    i >= n || (String.get s (pos + i) = String.get prefix i && go (i + 1))
  in
  go 0

(** [contains_sub s sub] — substring containment. *)
let contains_sub s sub =
  let n = String.length s in
  let m = String.length sub in
  let rec find i = i + m <= n && (starts_with s i sub || find (i + 1)) in
  find 0

let is_blank_line line = String.equal (String.trim line) ""

let strip_trailing_newline s =
  let n = String.length s in
  if n > 0 && s.[n - 1] = '\n' then String.sub s 0 (n - 1) else s

(** [read_while f s pos] — first index at or after [pos] where [f] fails. *)
let read_while f s pos =
  let n = String.length s in
  let rec go i = if i < n && f s.[i] then go (i + 1) else i in
  go pos

(** [find_before_newline s pos c] — index of the first [c] at or after [pos], or
    [None] if a newline comes first (or [c] doesn't appear at all). Every inline
    delimiter search that must not run past a line (the closing bracket in
    [fragment], [link] and [image]) uses this; searches with no such bound (a
    closing paren or angle bracket) just call [String.index_from_opt] directly.
*)
let find_before_newline s pos c =
  match String.index_from_opt s pos c with
  | None -> None
  | Some i -> (
      match String.index_from_opt s pos '\n' with
      | Some j when j < i -> None
      | _ -> Some i)

(** Split an endpoint at the first [#]; the part after it is the anchor. *)
let split_anchor endpoint =
  match String.index_opt endpoint '#' with
  | Some i ->
      ( String.sub endpoint 0 i,
        Some (String.sub endpoint (i + 1) (String.length endpoint - i - 1)) )
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

type token = T_char of char | T_nodes of inline list

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
  else if s.[pos + 1] = '*' then
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
    | None -> Some (T_char '*', pos + 1, [])
  else if pos > 0 && s.[pos - 1] = '*' then Some (T_char '*', pos + 1, [])
  else
    (* italic: a closing single star, not adjacent to another star *)
    let rec find_italic j =
      if j >= n then None
      else
        let after_is_star = j + 1 < n && s.[j + 1] = '*' in
        let before_is_star = j > pos + 1 && s.[j - 1] = '*' in
        if s.[j] = '*' && (not after_is_star) && not before_is_star then Some j
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
    | None -> Some (T_char '*', pos + 1, [])

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
  if kw_end > start && kw_end < n && s.[kw_end] = '@' then
    match sym_kind_of_keyword (String.sub s start (kw_end - start)) with
    | None -> None
    | kind -> (
        match find_before_newline s (kw_end + 1) ']' with
        | Some close ->
            let raw = String.sub s (kw_end + 1) (close - kw_end - 1) in
            let raw =
              if
                backticked
                && String.length raw > 0
                && raw.[String.length raw - 1] = '`'
              then String.sub raw 0 (String.length raw - 1)
              else raw
            in
            let endpoint, anchor =
              split_anchor (strip_endpoint_backticks raw)
            in
            Some (T_nodes [ Sym_ref { kind; endpoint; anchor } ], close + 1, [])
        | None -> None)
  else None

(* A markdown [text](url) link. The url is classified at parse time into
   [Link] (https), [Page_ref] (relative .html page link or bare #anchor) or
   a degraded bare-text link. *)
and link s pos =
  let n = String.length s in
  match find_before_newline s (pos + 1) ']' with
  | Some bracket when bracket + 1 < n && s.[bracket + 1] = '(' -> (
      match String.index_from_opt s (bracket + 2) ')' with
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
    match find_before_newline s (pos + 2) ']' with
    | Some bracket when bracket + 1 < n && s.[bracket + 1] = '(' -> (
        match String.index_from_opt s (bracket + 2) ')' with
        | Some paren ->
            let alt = String.sub s (pos + 2) (bracket - pos - 2) in
            Some (T_nodes [ Text alt ], paren + 1, [ Image_stripped alt ])
        | None -> None)
    | _ -> None

and extract_alt tag =
  let n = String.length tag in
  let rec find_eq i =
    if i + 4 >= n then None
    else if
      tag.[i] = 'a'
      && tag.[i + 1] = 'l'
      && tag.[i + 2] = 't'
      && tag.[i + 3] = '='
    then Some (i + 4)
    else find_eq (i + 1)
  in
  match find_eq 0 with
  | None -> ""
  | Some q when q < n && (tag.[q] = '"' || tag.[q] = '\'') -> (
      match String.index_from_opt tag (q + 1) tag.[q] with
      | Some close -> String.sub tag (q + 1) (close - q - 1)
      | None -> "")
  | Some _ -> ""

and img_tag s pos =
  if not (starts_with s pos "<img") then None
  else
    match String.index_from_opt s (pos + 4) '>' with
    | Some close ->
        let tag = String.sub s pos (close - pos + 1) in
        let alt = extract_alt tag in
        Some (T_nodes [ Text alt ], close + 1, [ Image_stripped alt ])
    | None -> None

and is_escapeable c =
  c = '`' || c = '*' || c = '_' || c = '{' || c = '}' || c = '[' || c = ']'
  || c = '(' || c = ')' || c = '#' || c = '+' || c = '-' || c = '.' || c = '!'
  || c = '|' || c = '>' || c = '<' || c = '~' || c = '@' || c = '\\'

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
      id_end + 1 < n
      && s.[id_end] = '.'
      && id_end + 2 < n
      && is_letter s.[id_end + 1]
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
    Some
      (T_nodes [ Sym_ref { kind = None; endpoint; anchor = None } ], id_end, [])

and scan_token s pos =
  let n = String.length s in
  if pos >= n || pos < 0 then None
  else
    let c = s.[pos] in
    if c = '\\' then backslash_escape s pos
    else if c = '`' then code_span s pos
    else if c = '<' && starts_with s pos "<img" then img_tag s pos
    else if c = '!' && pos + 1 < n && s.[pos + 1] = '[' then image s pos
    else if c = '[' then
      match fragment s pos with Some tok -> Some tok | None -> link s pos
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
  let rec go k acc =
    if k > hi then List.rev acc else go (k + 1) (lines.(k) :: acc)
  in
  go lo []

(** [find_line lines start pred] — index of the first line at or after [start]
    satisfying [pred], or [None] if none does. Every "scan ahead for a
    closing/marker line" search below (fence closers, [</picture>]) is this. *)
let find_line lines start pred =
  let n = Array.length lines in
  let rec go j =
    if j >= n then None else if pred lines.(j) then Some j else go (j + 1)
  in
  go start

(** [line_run lines start pred] — exclusive end index of the maximal run of
    lines from [start] satisfying [pred]: the first index at or after [start]
    that doesn't, or [Array.length lines] if all of them do. *)
let line_run lines start pred =
  let n = Array.length lines in
  let rec go j = if j >= n || not (pred lines.(j)) then j else go (j + 1) in
  go start

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
    if d > 0 && d + 1 < n && line.[d] = '.' && line.[d + 1] = ' ' then
      Some M_ordered
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
  (* end the list here: close out the item under construction and return
     the finished block. Reached whenever the current line doesn't extend
     the list (blank line, a marker of the other kind, or unindented text
     after the item started) — every such exit builds the same node. *)
  let stop j items fbs cur =
    let ins, fbs = finish cur fbs in
    (List (marker_ordered kind, List.rev (ins :: items)), j, fbs)
  in
  let rec go j items fbs cur =
    if j >= n || is_blank_line lines.(j) then stop j items fbs cur
    else
      let raw = lines.(j) in
      let line = String.trim raw in
      match list_marker line with
      | Some k ->
          if Bool.equal (marker_ordered k) (marker_ordered kind) then
            let ins, fbs = finish cur fbs in
            go (j + 1) (ins :: items) fbs [ item_text kind line ]
          else stop j items fbs cur
      | None ->
          let indented =
            String.length raw > 0 && (raw.[0] = ' ' || raw.[0] = '\t')
          in
          if indented then go (j + 1) items fbs (line :: cur)
          else stop j items fbs cur
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
    let closes_fence line =
      read_while (fun c -> c = '`') (String.trim line) 0 >= k
    in
    match find_line lines (i + 1) closes_fence with
    | Some j ->
        let content = String.concat "\n" (array_slice lines (i + 1) (j - 1)) in
        Some (Code_block (strip_trailing_newline content), j + 1)
    | None -> None

(* The gi-docgen pipe fence [|[...]|], optionally with a leading
   [<!-- language="X" -->] line. *)
let pipe_fence lines i =
  let line = String.trim lines.(i) in
  if not (starts_with line 0 "|[") then None
  else
    match
      find_line lines (i + 1) (fun line ->
          starts_with (String.trim line) 0 "]|")
    with
    | Some j ->
        let raw_content =
          String.concat "\n" (array_slice lines (i + 1) (j - 1))
        in
        let content =
          match String.split_on_char '\n' raw_content with
          | first :: rest
            when starts_with (String.trim first) 0 "<!-- language=" ->
              String.concat "\n" rest
          | _ -> raw_content
        in
        Some (Code_block (strip_trailing_newline content), j + 1)
    | None -> None

let fence_block lines i =
  match backtick_fence lines i with
  | Some r -> Some r
  | None -> pipe_fence lines i

(** [stripped_para_block next text fallback] — the block-scanner result shared
    by every construct that strips its markers to plain prose: an empty [text]
    degrades to no block at all (just the [fallback] event), otherwise [text] is
    parsed into a paragraph and [fallback] is added to its own fallback events.
    Used by [admonition_block] and [quote_block]; [picture_block] doesn't fit
    (its content isn't parsed prose). *)
let stripped_para_block next text fallback =
  if String.equal text "" then Some (None, next, [ fallback ])
  else
    let ins, fbs = parse_inline text in
    Some (Some (Para ins), next, fallback :: fbs)

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
    let next = line_run lines (i + 1) (fun line -> not (is_blank_line line)) in
    let content_lines =
      List.map String.trim (array_slice lines (i + 1) (next - 1))
    in
    let text = String.concat "\n" content_lines in
    stripped_para_block next text (Admonition_stripped typ)

(* A [<picture>] block: stripped to the first [<img alt>] text (plain
   prose); counted. *)
let picture_block lines i =
  if not (contains_sub lines.(i) "<picture>") then None
  else
    match
      find_line lines (i + 1) (fun line -> contains_sub line "</picture>")
    with
    | Some j ->
        let region = String.concat "\n" (array_slice lines i j) in
        let alt = extract_alt region in
        let alt_opt = if String.equal alt "" then None else Some alt in
        let block = Option.map (fun a -> Para [ Text a ]) alt_opt in
        Some (block, j + 1, [ Picture_stripped alt_opt ])
    | None -> None

(* A [> quote]: markers stripped, content kept as plain prose; counted. *)
let quote_block lines i =
  let line = String.trim lines.(i) in
  if not (starts_with line 0 "> ") then None
  else
    let first = String.trim (String.sub line 2 (String.length line - 2)) in
    let strip_marker line =
      let t = String.trim line in
      String.trim (String.sub t 2 (String.length t - 2))
    in
    let next =
      line_run lines (i + 1) (fun line -> starts_with (String.trim line) 0 "> ")
    in
    let content =
      first :: List.map strip_marker (array_slice lines (i + 1) (next - 1))
    in
    let content = List.filter (fun x -> not (String.equal x "")) content in
    let text = String.concat "\n" content in
    stripped_para_block next text Quote_stripped

(* A markdown table: consecutive lines starting with [|]; dropped entirely
   (cell text is not prose); counted. *)
let table_block lines i =
  let line = String.trim lines.(i) in
  if String.length line = 0 || line.[0] <> '|' || starts_with line 0 "|[" then
    None
  else
    let is_row line =
      let t = String.trim line in
      String.length t > 0 && t.[0] = '|' && not (starts_with t 0 "|[")
    in
    Some (line_run lines (i + 1) is_row, Table_stripped)

type step = S_para | S_blank | S_block of block option * int * fallback list

let heading_detector lines i =
  match read_heading_level (String.trim lines.(i)) with
  | None -> None
  | Some (lvl, text) ->
      let ins, fbs = parse_inline text in
      Some (S_block (Some (Heading (lvl, ins)), 1, fbs))

let fence_detector lines i =
  Option.map
    (fun (blk, next) -> S_block (Some blk, next - i, []))
    (fence_block lines i)

(* [admonition_block], [picture_block] and [quote_block] all already return
   the (optional block, next line, fallback events) shape [S_block] wants;
   this just relocates [next] to be relative to [i]. *)
let block_detector block_fn lines i =
  Option.map
    (fun (blk, next, fbs) -> S_block (blk, next - i, fbs))
    (block_fn lines i)

let admonition_detector = block_detector admonition_block
let picture_detector = block_detector picture_block
let quote_detector = block_detector quote_block

let list_detector lines i =
  match list_marker (String.trim lines.(i)) with
  | None -> None
  | Some kind ->
      let blk, next, fbs = list_block kind lines i in
      Some (S_block (Some blk, next - i, fbs))

let table_detector lines i =
  Option.map
    (fun (next, fb) -> S_block (None, next - i, [ fb ]))
    (table_block lines i)

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
      match f lines i with Some step -> step | None -> first_some rest lines i)

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
      | S_para -> go (i + 1) (String.trim lines.(i) :: paras) blocks fbs
      | S_blank ->
          let blocks, fbs = flush_para paras blocks fbs in
          go (i + 1) [] blocks fbs
      | S_block (blk, consumed, extra) ->
          let blocks, fbs = flush_para paras blocks fbs in
          let blocks =
            match blk with Some b -> b :: blocks | None -> blocks
          in
          let fbs = List.rev_append extra fbs in
          go (i + consumed) [] blocks fbs
  in
  let blocks, fbs = go 0 [] [] [] in
  (List.rev blocks, fbs)

(* --------------------------------------------------------------------- *)
(* Public API                                                              *)
(* --------------------------------------------------------------------- *)

let parse_with_fallbacks _ctx s =
  let blocks, fbs = parse_blocks (String.trim s) in
  ({ blocks }, fbs)

let parse ctx s = fst (parse_with_fallbacks ctx s)
