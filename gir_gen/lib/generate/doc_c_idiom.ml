(* C idioms with a fixed OCaml reading; see the .mli. *)

open Doc_ast

let c_lit_of_name = function
  | "TRUE" -> Some True
  | "FALSE" -> Some False
  | "NULL" -> Some Null
  | _ -> None

type c_prim_reading = Ocaml_type of string | Pointer

(* Only plain C identifiers can follow a [#] sigil; the table's other keys
   ("const gchar*", "GObject.Object", ...) are not primitive names. *)
let is_plain_c_name name =
  String.length name > 0
  && Doc_str.is_lower name.[0]
  && String.for_all Doc_str.is_ident_char name

let ocaml_of_c_prim = function
  | "gpointer" | "gconstpointer" -> Some Pointer
  | name when is_plain_c_name name ->
      List.find_map
        (fun (key, (m : Types.type_mapping)) ->
          if String.equal key name then Some (Ocaml_type m.ocaml_type) else None)
        Type_mappings.type_mappings
  | _ -> None

(* ------------------------------------------------------------------ *)
(* Null phrases                                                         *)
(* ------------------------------------------------------------------ *)

let terminated_suffixes = [ "-terminated"; " terminated" ]

let error_phrases =
  [
    " on error";
    " if an error occurred";
    " if an error occurs";
    " if there was an error";
    " in case of an error";
    " in case of error";
    " if error";
  ]

(* [prefix] at the start of [s], ending at a word boundary. *)
let starts_with_word ~prefix s =
  let n = String.length prefix in
  Doc_str.starts_with s 0 prefix
  && (String.length s = n || not (Doc_str.is_ident_char s.[n]))

let drop_prefix ~prefix s =
  let n = String.length prefix in
  String.sub s n (String.length s - n)

(* Adjacent [Text] nodes are merged, so a folded "null" joins the prose
   around it as one node, as parsing that prose would produce. *)
let push_text s acc =
  match acc with
  | _ when String.equal s "" -> acc
  | Text prev :: rest -> Text (prev ^ s) :: rest
  | _ -> Text s :: acc

let attach_null_phrases ins =
  let rec go acc = function
    | [] -> List.rev acc
    | C_lit Null :: Text s :: rest -> (
        let find_prefix prefixes =
          List.find_opt (fun prefix -> starts_with_word ~prefix s) prefixes
        in
        match (find_prefix terminated_suffixes, find_prefix error_phrases) with
        | Some _, _ -> go (push_text ("null" ^ s) acc) rest
        | None, Some phrase ->
            let acc = C_lit (Null_on_error phrase) :: acc in
            go (push_text (drop_prefix ~prefix:phrase s) acc) rest
        | None, None -> go (Text s :: C_lit Null :: acc) rest)
    | Text s :: rest -> go (push_text s acc) rest
    | inl :: rest -> go (inl :: acc) rest
  in
  go [] ins

(* ------------------------------------------------------------------ *)
(* Ownership sentences                                                  *)
(* ------------------------------------------------------------------ *)

(* The allowlist: one place, matched case-insensitively against a
   sentence's plain text. The first matching pattern names the event.

   Each pattern is an instruction to free a value, not a mention of a free
   function: a sentence that only names one ("all operations except
   g_object_ref() and g_object_unref() are invalid", "using g_realloc() and
   g_free() for memory allocation") says something an OCaml reader needs. *)
let ownership_patterns =
  List.map
    (fun (name, pattern) ->
      (name, Re.Perl.compile_pat ~opts:[ `Caseless ] pattern))
    [
      ( "free ... with g_*",
        {|\b(free|freed|freeing|release|released|delete|deleted)\b[^.;:]{0,60}?\b(with|using|by|through) (calling )?g_\w+|}
      );
      ("use g_*free/unref", {|\b(use|call) g_\w*(free|unref)\w*\b|});
      ("unref ... with", {|\bunref(f?ed)?\b[^.;:]{0,30}?\b(with|using)\b|});
    ]

let rec plain_text ins = String.concat "" (List.map inline_text ins)

and inline_text = function
  | Text s | Code s | Param_ref s | Ref s | C_prim s -> s
  | Bold ins | Italic ins -> plain_text ins
  | Link { text; _ } | Page_ref { text; _ } -> plain_text text
  | Sym_ref { endpoint; _ } -> endpoint
  | C_lit _ -> ""

let is_space c = match c with ' ' | '\n' | '\t' | '\r' -> true | _ -> false

let skip_spaces s from =
  let n = String.length s in
  let rec go i = if i < n && is_space s.[i] then go (i + 1) else i in
  go from

(* A sentence ends after [.], [!] or [?] (and a closing parenthesis), at
   whitespace that runs to the end of the text node or to an uppercase
   letter. The uppercase guard keeps "e.g. foo" in one sentence. Returns the
   index just past the sentence, where its trailing whitespace starts. *)
let sentence_end s from =
  let n = String.length s in
  let rec go i =
    if i >= n then None
    else
      match s.[i] with
      | '.' | '!' | '?' ->
          let after =
            if i + 1 < n && Char.equal s.[i + 1] ')' then i + 2 else i + 1
          in
          let next = skip_spaces s after in
          if
            after < n
            && is_space s.[after]
            && (next >= n || Doc_str.is_upper s.[next])
          then Some after
          else go (i + 1)
      | _ -> go (i + 1)
  in
  go from

(* Splits a paragraph's inlines into sentences. Each sentence after the
   first starts with the whitespace that separated it from the previous
   one, so dropping a sentence leaves its neighbours spaced as before. *)
let sentences ins =
  let split_text s (current, done_) =
    let rec go from current done_ =
      match sentence_end s from with
      | None ->
          let rest = String.sub s from (String.length s - from) in
          (push_text rest current, done_)
      | Some stop ->
          let piece = String.sub s from (stop - from) in
          let sentence = List.rev (push_text piece current) in
          go stop [] (sentence :: done_)
    in
    go 0 current done_
  in
  let current, done_ =
    List.fold_left
      (fun (current, done_) inl ->
        match inl with
        | Text s -> split_text s (current, done_)
        | inl -> (inl :: current, done_))
      ([], []) ins
  in
  let done_ =
    match current with [] -> done_ | _ -> List.rev current :: done_
  in
  List.rev done_

let matching_pattern sentence =
  let text = plain_text sentence in
  List.find_map
    (fun (name, re) -> if Re.execp re text then Some name else None)
    ownership_patterns

let trim_edges ins =
  let trim_first trim = function
    | Text s :: rest -> ( match trim s with "" -> rest | s -> Text s :: rest)
    | ins -> ins
  in
  ins
  |> trim_first (fun s -> CCString.drop_while is_space s)
  |> List.rev
  |> trim_first (fun s -> CCString.rdrop_while is_space s)
  |> List.rev

(* [None] when every sentence matched; the original inlines when none did. *)
let strip_inlines ins =
  let kept, fbs =
    List.fold_left
      (fun (kept, fbs) sentence ->
        match matching_pattern sentence with
        | Some name -> (kept, Ownership_stripped name :: fbs)
        | None -> (sentence :: kept, fbs))
      ([], []) (sentences ins)
  in
  match fbs with
  | [] -> (Some ins, [])
  | _ ->
      let rebuilt =
        List.fold_left
          (fun acc inl ->
            match inl with Text s -> push_text s acc | inl -> inl :: acc)
          []
          (List.concat (List.rev kept))
        |> List.rev |> trim_edges
      in
      let rebuilt = match rebuilt with [] -> None | ins -> Some ins in
      (rebuilt, List.rev fbs)

let strip_block blk =
  match blk with
  | Para ins ->
      let ins, fbs = strip_inlines ins in
      (Option.map (fun ins -> Para ins) ins, fbs)
  | List (ordered, items) -> (
      let items, fbs =
        List.fold_left
          (fun (items, fbs) item ->
            let item, item_fbs = strip_inlines item in
            (Option.to_list item @ items, fbs @ item_fbs))
          ([], []) items
      in
      match items with
      | [] -> (None, fbs)
      | items -> (Some (List (ordered, List.rev items)), fbs))
  | Heading _ | Code_block _ -> (Some blk, [])

let strip_ownership blocks =
  let blocks, fbs =
    List.fold_left
      (fun (blocks, fbs) blk ->
        let blk, blk_fbs = strip_block blk in
        (Option.to_list blk @ blocks, List.rev_append blk_fbs fbs))
      ([], []) blocks
  in
  (List.rev blocks, List.rev fbs)
