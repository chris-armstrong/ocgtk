(* Doc_emit — see doc_emit.mli for the contract. *)

(* Prose for an item: the translated [doc] when it says something, otherwise
   the [fallback]. Returns the prose and whether it came from the fallback,
   because the two render [@since] differently (see [item_doc]). *)
let prose_of ~context ~doc ~fallback =
  let translated =
    Option.fold ~none:""
      ~some:(fun raw -> String.trim (Doc_translate.translate context raw))
      doc
  in
  if not (String.equal translated "") then Some (translated, false)
  else
    Option.bind fallback (fun f ->
        let trimmed = String.trim f in
        if String.equal trimmed "" then None else Some (trimmed, true))

type t = Comment of string | Attribute of string

(* OCaml lexes string literals and quoted strings (a brace, an optional
   identifier, then a pipe) inside comments, and the lexer's escape rules do
   not match prose. So a body that could open one of these is carried as an
   [ocaml.doc] attribute payload instead, where it is an ordinary string
   literal. *)
let needs_attribute body =
  let n = String.length body in
  let rec quoted_opener i =
    if i >= n then false
    else if body.[i] = '|' then true
    else
      match body.[i] with
      | 'a' .. 'z' | '_' -> quoted_opener (i + 1)
      | _ -> false
  in
  let rec scan i =
    if i >= n then false
    else
      match body.[i] with
      | '"' -> true
      | '{' when quoted_opener (i + 1) -> true
      | _ -> scan (i + 1)
  in
  scan 0

(* The body as the contents of an OCaml string literal. *)
let string_literal_body s =
  let buf = Buffer.create (String.length s + 8) in
  String.iter
    (function
      | '"' -> Buffer.add_string buf "\\\""
      | '\\' -> Buffer.add_string buf "\\\\"
      | c -> Buffer.add_char buf c)
    s;
  Buffer.contents buf

let item_doc ~indent ?since ?fallback ~context doc =
  let body =
    match (prose_of ~context ~doc ~fallback, since) with
    | Some (prose, false), Some v ->
        Some (prose ^ "\n" ^ indent ^ "    @since " ^ v)
    | Some (prose, true), Some v -> Some (prose ^ " @since " ^ v)
    | Some (prose, _), None -> Some prose
    | None, Some v -> Some ("@since " ^ v)
    | None, None -> None
  in
  Option.map
    (fun b ->
      let b = Utils.sanitize_doc b in
      if needs_attribute b then Attribute b else Comment ("(** " ^ b ^ " *)"))
    body

let before_item = function
  | Some (Comment c) -> c ^ "\n"
  | Some (Attribute _) | None -> ""

(* The blank line keeps the next item's comment from also reading as this
   item's trailing doc, which ocamlformat rejects as ambiguous (warning 50). *)
let after_item = function
  | Some (Attribute a) -> "[@@ocaml.doc \"" ^ string_literal_body a ^ "\"]\n\n"
  | Some (Comment _) | None -> ""

let member_suffix = function
  | Some (Comment c) -> " " ^ c
  | Some (Attribute a) -> " [@ocaml.doc \"" ^ string_literal_body a ^ "\"]"
  | None -> ""

let floating = function
  | Comment c -> c
  | Attribute a -> "[@@@ocaml.text \"" ^ string_literal_body a ^ "\"]"
