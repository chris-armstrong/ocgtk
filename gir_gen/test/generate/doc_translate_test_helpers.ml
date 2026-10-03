(* Shared assertion helpers for the Doc_translate unit test suites
   (doc_parse_tests.ml, doc_render_tests.ml, doc_translate_tests.ml).

   Rendered output is checked with substring assertions
   (Helpers.string_contains) because it is odoc markup text with no
   in-repo parser — the established convention for generator-output tests
   (see constant_code_tests.ml). AST structure is checked structurally via
   the module's own equal functions. *)

open Gir_gen_lib.Generate.Doc_translate

module E = struct
  let entity s = parse Entity s |> render_as Entity
  let member s = parse Member s |> render_as Member
  let translate s = translate Entity s
  let parse_entity = parse Entity
end

let has msg s sub =
  Alcotest.(check bool) msg true (Helpers.string_contains s sub)

let lacks msg s sub =
  Alcotest.(check bool) msg false (Helpers.string_contains s sub)

let has_fallback msg kind fbs =
  Alcotest.(check bool)
    msg true
    (List.exists
       (fun fb ->
         match (fb, kind) with
         | Inline_code_unbalanced _, `Inline_code_unbalanced
         | Code_block_verbatim _, `Code_block_verbatim
         | Code_block_stripped _, `Code_block_stripped
         | Sym_ref_degraded _, `Sym_ref_degraded
         | Page_ref_degraded _, `Page_ref_degraded
         | Link_degraded _, `Link_degraded
         | Admonition_stripped _, `Admonition_stripped
         | Picture_stripped _, `Picture_stripped
         | Image_stripped _, `Image_stripped
         | Quote_stripped, `Quote_stripped
         | Table_stripped, `Table_stripped ->
             true
         | _ -> false)
       fbs)
