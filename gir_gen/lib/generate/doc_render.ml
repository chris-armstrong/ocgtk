(* Doc_ast -> odoc markup renderer; see the .mli for the design. *)

open Doc_ast
open Doc_str

(* odoc-special escaping in prose contexts: \{ \} \[ \] \@.
   A bare ] in prose is not literal text to odoc: it closes a code span it
   never opened, which warns ("Unpaired end of code"). So it is escaped
   like its opening partner. Code spans manage their own ] via the balance
   fallback and do not go through here. *)
let escape_prose buf s =
  String.iter
    (fun c ->
      (match c with
      | '{' | '}' | '[' | ']' | '@' -> Buffer.add_char buf '\\'
      | _ -> ());
      Buffer.add_char buf c)
    s

(** [emit_code_span buf content] — the [[content]] odoc code span, shared by
    every inline node that degrades or renders to one ([Code]'s balanced case,
    [Sym_ref], [Param_ref]). *)
let emit_code_span buf content =
  Buffer.add_char buf '[';
  Buffer.add_string buf content;
  Buffer.add_char buf ']'

(* A null return "on error" from a throwing item is its [Error] result: the
   bindings return [(_, GError.t) result] and never a null value for it. *)
let render_c_lit ~ret_shape buf lit =
  match (lit, ret_shape) with
  | True, _ -> emit_code_span buf "true"
  | False, _ -> emit_code_span buf "false"
  | Null, _ -> emit_code_span buf "None"
  | Null_on_error _, Throws ->
      Buffer.add_string buf "an ";
      emit_code_span buf "Error";
      Buffer.add_string buf " result"
  | Null_on_error phrase, Plain ->
      emit_code_span buf "None";
      escape_prose buf phrase

(* [parse] only builds [C_prim] for names with a reading; one without is
   degraded like any other unresolved sigil. *)
let render_c_prim buf name fbs =
  match Doc_c_idiom.ocaml_of_c_prim name with
  | Some (Ocaml_type ty) ->
      emit_code_span buf ty;
      fbs
  | Some Pointer ->
      escape_prose buf "pointer";
      fbs
  | None ->
      emit_code_span buf name;
      Sym_ref_degraded name :: fbs

let rec render_inline ~ret_shape ins buf fbs =
  List.fold_left
    (fun fbs' inl ->
      match inl with
      | Text s ->
          escape_prose buf s;
          fbs'
      | Code s ->
          if String.contains s ']' then (
            (* unbalanced code: fall back to escaped plain prose *)
            escape_prose buf s;
            Inline_code_unbalanced s :: fbs')
          else (
            emit_code_span buf s;
            fbs')
      | Bold inner -> wrap ~ret_shape buf "{b " "}" inner fbs'
      | Italic inner -> wrap ~ret_shape buf "{i " "}" inner fbs'
      | Link { text; url } ->
          wrap ~ret_shape buf ("{{:" ^ url ^ "}") "}" text fbs'
      | Page_ref { text; path; anchor = _ } ->
          (* degraded to bare text *)
          let f = render_inline ~ret_shape text buf fbs' in
          Page_ref_degraded path :: f
      | Sym_ref { endpoint; kind = _; anchor = _ } ->
          (* degraded to a code span *)
          emit_code_span buf endpoint;
          Sym_ref_degraded endpoint :: fbs'
      | Param_ref name ->
          (* always a code span: a bare @ would start an odoc tag *)
          emit_code_span buf name;
          fbs'
      | Ref path ->
          Buffer.add_string buf "{!";
          Buffer.add_string buf path;
          Buffer.add_char buf '}';
          fbs'
      | C_lit lit ->
          render_c_lit ~ret_shape buf lit;
          fbs'
      | C_prim name -> render_c_prim buf name fbs')
    fbs ins

(* [prefix ... suffix], with [inner] rendered (recursively) in between —
   shared by every "markup wrapped around nested inline content" case:
   [Bold], [Italic] and [Link] here, and the heading policy in
   [render_with_fallbacks] below. *)
and wrap ~ret_shape buf prefix suffix inner fbs =
  Buffer.add_string buf prefix;
  let f = render_inline ~ret_shape inner buf fbs in
  Buffer.add_string buf suffix;
  f

(* The comment-hazard pass: insert a backslash between
   the two characters of a star-paren / paren-star sequence, over the whole
   final output — inside code spans and verbatim blocks included. *)
let neutralise_comment_hazards s =
  let buf = Buffer.create (String.length s + 8) in
  let n = String.length s in
  let rec go i =
    if i >= n then ()
    else
      let pair =
        i + 1 < n
        && ((Char.equal s.[i] '*' && Char.equal s.[i + 1] ')')
           || (Char.equal s.[i] '(' && Char.equal s.[i + 1] '*'))
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

(* Writes [content] as the code-block form that cannot end early: plain
   [{[ ... ]}] when it has no []}], verbatim [{v ... v}] when it does, and
   stripped to a fallback when it contains both. *)
let render_code_block buf content : fallback list =
  match (contains_sub content "]}", contains_sub content "v}") with
  | false, _ ->
      if String.equal content "" then Buffer.add_string buf "{[]}"
      else (
        Buffer.add_string buf "{[\n";
        Buffer.add_string buf content;
        Buffer.add_string buf "\n]}");
      []
  | true, false ->
      Buffer.add_string buf "{v\n";
      Buffer.add_string buf content;
      Buffer.add_string buf "\nv}";
      [ Code_block_verbatim content ]
  | true, true -> [ Code_block_stripped content ]

let render_with_fallbacks ?(ret_shape = Plain) ctx (t : t) :
    string * fallback list =
  (* Entity heading normalisation: the doc's shallowest markdown level maps
     to {1}, deeper levels keep their offsets, capped at {5}. *)
  let shallowest =
    List.fold_left
      (fun acc blk ->
        match blk with
        | Heading (l, _) -> Int.min acc l
        | Para _ | List _ | Code_block _ -> acc)
      7 t.blocks
  in
  let shift = shallowest - 1 in
  let render_block blk : string * fallback list =
    let buf = Buffer.create 64 in
    let fbs =
      match blk with
      | Para ins -> render_inline ~ret_shape ins buf []
      | Heading (lvl, ins) -> (
          match ctx with
          | Entity ->
              let level = Int.min (lvl - shift) 5 in
              wrap ~ret_shape buf (Printf.sprintf "{%d " level) "}" ins []
          | Member -> wrap ~ret_shape buf "{b " "}" ins [])
      | List (ordered, items) ->
          let prefix = if ordered then "+ " else "- " in
          let fbs =
            List.fold_left
              (fun fbs item ->
                Buffer.add_string buf prefix;
                let f = render_inline ~ret_shape item buf fbs in
                Buffer.add_char buf '\n';
                f)
              [] items
          in
          let len = Buffer.length buf in
          if len > 0 && Char.equal (Buffer.nth buf (len - 1)) '\n' then
            Buffer.truncate buf (len - 1);
          fbs
      | Code_block content -> render_code_block buf content
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
    List.rev rendered
    |> List.filter (fun s -> not (String.equal s ""))
    |> String.concat "\n\n"
  in
  (neutralise_comment_hazards output, fbs)

let render_as ?ret_shape ctx t = fst (render_with_fallbacks ?ret_shape ctx t)

(* [render] is the [Entity] policy: module comments are the canonical
   attachment point in the emission inventory. *)
let render t = render_as Entity t
