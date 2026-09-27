(* GIR <doc> markdown -> Doc_ast parser; see the .mli for the design.

   Implemented as:

   - a block scanner over the doc's lines (headings, fences, admonitions,
     pictures, quotes, lists, tables, horizontal rules, paragraphs),
   - an inline scanner over each paragraph/item/heading text (code spans,
     emphasis, links, fragments, legacy sigils, param refs, images).

   Both scanners collect the parse-time fallback events. *)

open Doc_ast
open Doc_str

(* --------------------------------------------------------------------- *)
(* Character helpers                                                       *)
(* --------------------------------------------------------------------- *)

(** [read_while f s pos] — first index at or after [pos] where [f] fails. *)
let read_while f s pos =
  let n = String.length s in
  let rec go i = if i < n && f s.[i] then go (i + 1) else i in
  go pos

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
(* Cursor                                                                  *)
(* --------------------------------------------------------------------- *)

(* A cursor over the string being scanned: the position plus the accessors
   ([current]/[peek]/[advance]/[at_prefix]/[find]) that replace direct
   [s.[pos]] / bounds-check indexing through the inline scanner below. The
   block scanner further down keeps its own [lines * int] indexing — a
   coarser, line-at-a-time scan that doesn't share this module's concerns. *)
module Cursor = struct
  type t = { s : string; pos : int }

  let make s pos = { s; pos }
  let pos c = c.pos
  let len c = String.length c.s
  let eof c = c.pos < 0 || c.pos >= String.length c.s
  let current c = if eof c then None else Some c.s.[c.pos]
  let current_exn c = c.s.[c.pos]

  (** [peek c n] — the character [n] places ahead of [c] ([n] may be negative,
      to look behind). *)
  let peek c n =
    let i = c.pos + n in
    if i < 0 || i >= String.length c.s then None else Some c.s.[i]

  let advance c n = { c with pos = c.pos + n }

  (** [has c n] — [true] iff the character [n] places ahead of [c] is in bounds
      (regardless of what it is). *)
  let has c n = peek c n <> None

  (** [is_char c ch] — [true] iff [c] isn't at eof and its current character is
      [ch]. *)
  let is_char c ch = current c = Some ch

  (** [peek_char c n ch] — [true] iff the character [n] places ahead of [c] is
      [ch] (and in bounds). *)
  let peek_char c n ch = peek c n = Some ch

  (** [peek_matches c n pred] — [true] iff the character [n] places ahead of [c]
      is in bounds and satisfies [pred]. *)
  let peek_matches c n pred =
    match peek c n with Some ch -> pred ch | None -> false

  (** [matches c pred] — [peek_matches c 0 pred]. *)
  let matches c pred = peek_matches c 0 pred

  (** [scan_char c ch] — [Some (advance c 1)] iff [c]'s current character is
      [ch], else [None]. The single-character-literal counterpart to
      [at_prefix]. *)
  let scan_char c ch = if is_char c ch then Some (advance c 1) else None

  let at_prefix c prefix = starts_with c.s c.pos prefix
  let skip_while c pred = { c with pos = read_while pred c.s c.pos }

  (** [text_between from until] — the text spanning two cursors over the same
      underlying string, [from] inclusive up to but not including [until]. *)
  let text_between from until = String.sub from.s from.pos (until.pos - from.pos)

  (** [find c ch] — the first [ch] at or after [c], with no bound other than the
      string's end (a closing paren or angle bracket may legitimately follow a
      newline). *)
  let find c ch =
    String.index_from_opt c.s c.pos ch
    |> Option.map (fun i -> { c with pos = i })

  (** As [find], but [None] if a newline comes first. Every inline delimiter
      search that must not run past a line (the closing bracket in [fragment],
      [link] and [image]) uses this. *)
  let find_before_newline c ch =
    match (find c ch, find c '\n') with
    | None, _ -> None
    | Some found, Some nl when nl.pos < found.pos -> None
    | Some found, _ -> Some found

  (** [paren_link_span c] — the closing-bracket and closing-paren cursors of a
      markdown [text](url)-shaped construct, searching for the closing bracket
      from [c]. Shared by [link] and [image], which differ only in what they
      build from the span. *)
  let paren_link_span c =
    Option.bind (find_before_newline c ']') (fun bracket ->
        if peek_char bracket 1 '(' then
          find (advance bracket 2) ')'
          |> Option.map (fun paren -> (bracket, paren))
        else None)
end

(* --------------------------------------------------------------------- *)
(* Inline scanner                                                          *)
(* --------------------------------------------------------------------- *)

type token = T_char of char | T_nodes of inline list

let backtick_run c =
  let rec go c n =
    if Cursor.is_char c '`' then go (Cursor.advance c 1) (n + 1) else n
  in
  go c 0

(* A backtick-delimited code span. The closing run must be at least as long
   as the opening run. An unmatched opener is left as literal text (a
   one-sided backtick must not swallow the rest of the paragraph). *)
let code_span c =
  let k = backtick_run c in
  let rec find_close cj =
    if Cursor.pos cj + k > Cursor.len cj then None
    else if backtick_run cj >= k then Some cj
    else find_close (Cursor.advance cj 1)
  in
  match find_close (Cursor.advance c k) with
  | Some cj ->
      let content = Cursor.text_between (Cursor.advance c k) cj in
      let close_run = backtick_run cj in
      Some
        (T_nodes [ Code content ], Cursor.advance cj (Int.min k close_run), [])
  | None -> None

(* [*]/[**] emphasis. The opener must have a non-empty, space-free content
   and a matching closer; a lone or space-bounded star is literal text. *)
let rec emphasis c =
  if not (Cursor.is_char c '*') then None
  else if not (Cursor.has c 1) then Some (T_char '*', Cursor.advance c 1, [])
  else if Cursor.peek_char c 1 '*' then
    (* bold: find a closing [**] *)
    let rec find_bold cj =
      if not (Cursor.has cj 1) then None
      else if Cursor.peek_char cj 0 '*' && Cursor.peek_char cj 1 '*' then
        Some cj
      else find_bold (Cursor.advance cj 1)
    in
    Some
      (match find_bold (Cursor.advance c 2) with
      | Some cj ->
          close_emphasis c ~start:(Cursor.advance c 2) ~delim_len:2
            ~wrap:(fun ins -> Bold ins)
            cj
      | None -> (T_char '*', Cursor.advance c 1, []))
  else if Cursor.peek_char c (-1) '*' then
    Some (T_char '*', Cursor.advance c 1, [])
  else
    (* italic: a closing single star, not adjacent to another star *)
    let rec find_italic cj =
      if Cursor.eof cj then None
      else if Cursor.is_char cj '*' then
        let after_is_star = Cursor.peek_char cj 1 '*' in
        let before_is_star =
          Cursor.pos cj > Cursor.pos c + 1 && Cursor.peek_char cj (-1) '*'
        in
        if (not after_is_star) && not before_is_star then Some cj
        else find_italic (Cursor.advance cj 1)
      else find_italic (Cursor.advance cj 1)
    in
    Some
      (match find_italic (Cursor.advance c 1) with
      | Some cj ->
          close_emphasis c ~start:(Cursor.advance c 1) ~delim_len:1
            ~wrap:(fun ins -> Italic ins)
            cj
      | None -> (T_char '*', Cursor.advance c 1, []))

(* The bold/italic closer, once the matching delimiter run has been found at
   [cj]: reject an empty or space-padded run (a lone/space-bounded delimiter
   is literal text), else parse the content and wrap it with [wrap]. Shared
   by [emphasis]'s bold and italic branches, which differ only in where the
   content starts, how long the delimiter is, and the constructor. *)
and close_emphasis c ~start ~delim_len ~wrap cj =
  let content = Cursor.text_between start cj in
  let trimmed = String.trim content in
  if String.equal trimmed "" || not (String.equal trimmed content) then
    (T_char '*', Cursor.advance c 1, [])
  else
    let ins, fbs = parse_inline content in
    (T_nodes [ wrap ins ], Cursor.advance cj delim_len, fbs)

(* A gi-docgen [keyword@endpoint] fragment. Only known fragment keywords
   count as references (unknown [foo@bar] bracket text falls through to the
   link check and then to literal text). The whole keyword@endpoint may be
   backtick-wrapped ([`method@Foo`]) — the backticks are allowed and
   stripped per the linking grammar; a trailing [#anchor] may be
   appended. *)
and fragment c =
  let backticked = Cursor.peek_char c 1 '`' in
  let start = Cursor.advance c (if backticked then 2 else 1) in
  let kw_end = Cursor.skip_while start is_lower in
  if Cursor.pos kw_end > Cursor.pos start && Cursor.is_char kw_end '@' then
    match sym_kind_of_keyword (Cursor.text_between start kw_end) with
    | None -> None
    | Some _ as kind ->
        Cursor.find_before_newline (Cursor.advance kw_end 1) ']'
        |> Option.map (fun close ->
            let raw = Cursor.text_between (Cursor.advance kw_end 1) close in
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
            ( T_nodes [ Sym_ref { kind; endpoint; anchor } ],
              Cursor.advance close 1,
              [] ))
  else None

(* A markdown [text](url) link. The url is classified at parse time into
   [Link] (https), [Page_ref] (relative .html page link or bare #anchor) or
   a degraded bare-text link. *)
and link_token c bracket paren =
  let text_raw = Cursor.text_between (Cursor.advance c 1) bracket in
  let url = Cursor.text_between (Cursor.advance bracket 2) paren in
  let text, fbs = parse_inline text_raw in
  let next = Cursor.advance paren 1 in
  if starts_with url 0 "https://" then
    (T_nodes [ Link { text; url } ], next, fbs)
  else if starts_with url 0 "http://" then
    (T_nodes text, next, Link_degraded url :: fbs)
  else if starts_with url 0 "#" || contains_sub url ".html" then
    let path, anchor = split_anchor url in
    (T_nodes [ Page_ref { text; path; anchor } ], next, fbs)
  else (T_nodes text, next, Link_degraded url :: fbs)

and link c =
  Cursor.paren_link_span (Cursor.advance c 1)
  |> Option.map (fun (bracket, paren) -> link_token c bracket paren)

(* A markdown [![alt](src)] image or a bare [<img ... alt="...">] element:
   the alt text is kept as plain prose and the construct is counted. *)
and image c =
  match Cursor.scan_char c '!' with
  | Some after when Cursor.is_char after '[' ->
      let start = Cursor.advance after 1 in
      Cursor.paren_link_span start
      |> Option.map (fun (bracket, paren) ->
          let alt = Cursor.text_between start bracket in
          (T_nodes [ Text alt ], Cursor.advance paren 1, [ Image_stripped alt ]))
  | _ -> None

and extract_alt tag =
  let rec find_eq c =
    if not (Cursor.has c 4) then None
    else if
      Cursor.is_char c 'a' && Cursor.peek_char c 1 'l'
      && Cursor.peek_char c 2 't' && Cursor.peek_char c 3 '='
    then Some (Cursor.advance c 4)
    else find_eq (Cursor.advance c 1)
  in
  let quote_pos =
    Option.bind
      (find_eq (Cursor.make tag 0))
      (fun q ->
        if Cursor.matches q (function '"' | '\'' -> true | _ -> false) then
          Some q
        else None)
  in
  Option.bind quote_pos (fun q ->
      Cursor.find (Cursor.advance q 1) (Cursor.current_exn q)
      |> Option.map (fun close ->
          Cursor.text_between (Cursor.advance q 1) close))
  |> Option.value ~default:""

and img_tag c =
  if not (Cursor.at_prefix c "<img") then None
  else
    Cursor.find (Cursor.advance c 4) '>'
    |> Option.map (fun close ->
        let tag = Cursor.text_between c (Cursor.advance close 1) in
        let alt = extract_alt tag in
        (T_nodes [ Text alt ], Cursor.advance close 1, [ Image_stripped alt ]))

and backslash_escape c =
  match Cursor.scan_char c '\\' with
  | None -> None
  | Some after ->
      if Cursor.matches after is_escapeable then
        Some (T_char (Cursor.current_exn after), Cursor.advance after 1, [])
      else Some (T_char '\\', after, [])

(* A legacy gtk-doc [@param] reference. The name must start lowercase, must
   not be preceded by an identifier character, and must not run into a
   [.]+letter (the email / namespace guard). *)
and param_ref c =
  let preceded_by_ident = Cursor.peek_matches c (-1) is_ident_char in
  if preceded_by_ident then None
  else
    match Cursor.scan_char c '@' with
    | None -> None
    | Some start ->
        if not (Cursor.matches start is_lower) then None
        else
          let id_end = Cursor.skip_while start is_ident_char in
          let email_like =
            Cursor.is_char id_end '.' && Cursor.peek_matches id_end 1 is_letter
          in
          if email_like then None
          else
            let name = Cursor.text_between start id_end in
            Some (T_nodes [ Param_ref name ], id_end, [])

(* A legacy gtk-doc [#Type...] sigil. Guards (GIR plan §3.5): [#] not
   preceded by [/], then an uppercase identifier with no space. [#Type:p]
   and [#Type::s] suffixes stay on the endpoint. *)
and hash_sigil c =
  if Cursor.peek_char c (-1) '/' then None
  else
    match Cursor.scan_char c '#' with
    | None -> None
    | Some start ->
        if not (Cursor.matches start is_upper) then None
        else
          let id_end = Cursor.skip_while start is_ident_char in
          let name = Cursor.text_between start id_end in
          let extension =
            if Cursor.is_char id_end ':' then
              let sep = if Cursor.peek_char id_end 1 ':' then 2 else 1 in
              let after = Cursor.advance id_end sep in
              if Cursor.matches after is_ident_char then
                Some
                  (Cursor.text_between id_end
                     (Cursor.skip_while after is_ident_char))
              else None
            else None
          in
          let endpoint, next =
            match extension with
            | Some e -> (name ^ e, Cursor.advance id_end (String.length e))
            | None -> (name, id_end)
          in
          Some
            ( T_nodes [ Sym_ref { kind = None; endpoint; anchor = None } ],
              next,
              [] )

(* A legacy gtk-doc [%CONSTANT] sigil: [%] followed by an uppercase
   identifier with no space. *)
and percent_sigil c =
  match Cursor.scan_char c '%' with
  | None -> None
  | Some start ->
      if not (Cursor.matches start is_upper) then None
      else
        let id_end = Cursor.skip_while start is_ident_char in
        let endpoint = Cursor.text_between start id_end in
        Some
          ( T_nodes [ Sym_ref { kind = None; endpoint; anchor = None } ],
            id_end,
            [] )

and scan_token c =
  match Cursor.current c with
  | None -> None
  | Some ch ->
      if ch = '\\' then backslash_escape c
      else if ch = '`' then code_span c
      else if ch = '<' && Cursor.at_prefix c "<img" then img_tag c
      else if ch = '!' && Cursor.peek_char c 1 '[' then image c
      else if ch = '[' then
        match fragment c with Some tok -> Some tok | None -> link c
      else if ch = '*' then emphasis c
      else if ch = '@' then param_ref c
      else if ch = '#' then hash_sigil c
      else if ch = '%' then percent_sigil c
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
  let rec go c acc fbs =
    if Cursor.eof c then (List.rev (flush acc), List.rev fbs)
    else
      match scan_token c with
      | None ->
          Buffer.add_char text_buf (Cursor.current_exn c);
          go (Cursor.advance c 1) acc fbs
      | Some (T_char ch, next, _extra) ->
          Buffer.add_char text_buf ch;
          go next acc fbs
      | Some (T_nodes nodes, next, extra) ->
          let acc = flush acc in
          let acc = List.fold_right (fun nd a -> nd :: a) nodes acc in
          go next acc (List.rev_append extra fbs)
  in
  go (Cursor.make s 0) [] []

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
    find_line lines (i + 1) closes_fence
    |> Option.map (fun j ->
        let content = String.concat "\n" (array_slice lines (i + 1) (j - 1)) in
        (Code_block (strip_trailing_newline content), j + 1))

(* The gi-docgen pipe fence [|[...]|], optionally with a leading
   [<!-- language="X" -->] line. *)
let pipe_fence lines i =
  let line = String.trim lines.(i) in
  if not (starts_with line 0 "|[") then None
  else
    find_line lines (i + 1) (fun line -> starts_with (String.trim line) 0 "]|")
    |> Option.map (fun j ->
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
        (Code_block (strip_trailing_newline content), j + 1))

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
    find_line lines (i + 1) (fun line -> contains_sub line "</picture>")
    |> Option.map (fun j ->
        let region = String.concat "\n" (array_slice lines i j) in
        let alt = extract_alt region in
        let alt_opt = if String.equal alt "" then None else Some alt in
        let block = Option.map (fun a -> Para [ Text a ]) alt_opt in
        (block, j + 1, [ Picture_stripped alt_opt ]))

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
  read_heading_level (String.trim lines.(i))
  |> Option.map (fun (lvl, text) ->
      let ins, fbs = parse_inline text in
      S_block (Some (Heading (lvl, ins)), 1, fbs))

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
  list_marker (String.trim lines.(i))
  |> Option.map (fun kind ->
      let blk, next, fbs = list_block kind lines i in
      S_block (Some blk, next - i, fbs))

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

let first_some fns lines i =
  List.find_map (fun f -> f lines i) fns |> Option.value ~default:S_para

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
