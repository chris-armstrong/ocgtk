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
    match fallback with
    | Some f when not (String.equal (String.trim f) "") ->
        Some (String.trim f, true)
    | _ -> None

(* OCaml lexes string literals inside comments, and the lexer's escape rules
   do not match prose: an even number of double quotes can still leave a
   string open (e.g. a GIR shell example with backslash-quoted words). So every
   double quote in an emitted comment becomes a typographic one, opening or
   closing by its left neighbour. Nothing in a comment can then open a string. *)
let neutralise_quotes s =
  let buf = Buffer.create (String.length s + 8) in
  String.iteri
    (fun i c ->
      if not (Char.equal c '"') then Buffer.add_char buf c
      else
        let opening =
          i = 0
          ||
          match s.[i - 1] with
          | ' ' | '\n' | '\t' | '(' | '[' -> true
          | _ -> false
        in
        Buffer.add_string buf (if opening then "\u{201C}" else "\u{201D}"))
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
    (fun b -> "(** " ^ neutralise_quotes (Utils.sanitize_doc b) ^ " *)")
    body
