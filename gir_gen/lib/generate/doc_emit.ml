(* Doc_emit — see doc_emit.mli for the contract. *)

(* Prose for an item: the translated [doc] when it says something, otherwise
   the [fallback]. Returns the prose and whether it came from the fallback,
   because the two render [@since] differently (see [item_doc]). *)
let prose_of ~context doc fallback =
  let translated =
    match doc with
    | None -> ""
    | Some raw -> String.trim (Doc_translate.translate context raw)
  in
  if not (String.equal translated "") then Some (translated, false)
  else
    match fallback with
    | Some f when not (String.equal (String.trim f) "") ->
        Some (String.trim f, true)
    | _ -> None

let item_doc ~indent ?since ?fallback ~context doc =
  let body =
    match (prose_of ~context doc fallback, since) with
    | Some (prose, false), Some v ->
        Some (prose ^ "\n" ^ indent ^ "    @since " ^ v)
    | Some (prose, true), Some v -> Some (prose ^ " @since " ^ v)
    | Some (prose, _), None -> Some prose
    | None, Some v -> Some ("@since " ^ v)
    | None, None -> None
  in
  Option.map (fun b -> "(** " ^ Utils.sanitize_doc b ^ " *)") body
