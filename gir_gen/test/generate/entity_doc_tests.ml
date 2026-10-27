(* Unit tests for the docs of a class's modules, class type and class
   (gir_gen/lib/generate/entity_doc.ml), and for where the layer 2 signature
   generator puts them. The texts are odoc markup, compared as strings; the
   placement is checked on the parsed signature. *)

open Gir_gen_lib.Generate

let text = function
  | Some (Doc_emit.Comment c) -> c
  | Some (Doc_emit.Attribute a) -> "<attribute>" ^ a
  | None -> "<none>"

let check_text msg expected doc =
  Alcotest.(check string) msg expected (text doc)

let test_l2_module_with_class_doc () =
  check_text "class doc, then the navigation paragraph"
    "(** A button.\n\n\
     Its methods, signals and properties are on {!class-type-button_t}. The \
     functions it is built on are in {!Ocgtk.Raw.Button}. *)"
    (Entity_doc.l2_module ~namespace:"Gtk" ~class_name:"Button"
       ~c_type:"GtkButton" ~class_doc:(Some "A button."))

(* The first paragraph is also the synopsis on the parent's page, where
   [class-type-button_t] does not resolve. *)
let test_l2_module_without_class_doc_starts_with_synopsis () =
  check_text "a sentence of its own first"
    "(** Bindings for [GtkButton].\n\n\
     Its methods, signals and properties are on {!class-type-button_t}. The \
     functions it is built on are in {!Ocgtk.Raw.Button}. *)"
    (Entity_doc.l2_module ~namespace:"Gtk" ~class_name:"Button"
       ~c_type:"GtkButton" ~class_doc:None)

let test_l1_module_points_to_layer2 () =
  check_text "class doc, then the layer 2 module"
    "(** A button.\n\nThe class built on this module is in {!Ocgtk.Button}. *)"
    (Entity_doc.l1_module ~namespace:"Gtk" ~class_name:"Button"
       ~c_type:"GtkButton" ~class_doc:(Some "A button."))

let test_combined_module_links_members_sorted () =
  check_text "members sorted, at layer 2"
    "(** The classes of {!Ocgtk.Widget_paintable}, {!Ocgtk.Window}, defined \
     together because they refer to each other. Each has a module of its own \
     that re-exports it; use that module rather than this one. *)"
    (Entity_doc.combined_module ~namespace:"Gtk" ~layer:Entity_doc.Layer2
       ~class_names:[ "Window"; "WidgetPaintable" ])

let signature ?(methods = []) ~class_doc () =
  Class_gen.generate_class_signature
    ~ctx:(Helpers.create_test_context ())
    ~class_doc ~class_name:"Button" ~c_type:"GtkButton"
    ~parent_chain:[ "Widget" ] ~methods ~properties:[] ~signals:[]
    ~constructors:[] ~entity_kind:Filtering.Class
  |> Ml_ast_helpers.parse_interface

let check_has msg ~sub doc =
  match doc with
  | Some text ->
      Alcotest.(check bool)
        (msg ^ ": " ^ text)
        true
        (Helpers.string_contains text sub)
  | None -> Alcotest.fail (msg ^ ": no doc")

let test_signature_carries_docs () =
  let ast = signature ~class_doc:(Some "A button.") () in
  check_has "module preamble" ~sub:"A button."
    (Ml_ast_helpers.module_preamble ast);
  check_has "class type" ~sub:"The methods, signals and properties of a"
    (Helpers.expect_some "class type button_t"
       (Ml_ast_helpers.find_class_type_declaration ast "button_t") (fun ct ->
         Ml_ast_helpers.doc_of_attributes ct.pci_attributes))

let test_signature_carries_method_docs () =
  let clicked =
    Type_factory.make_gir_method ~method_name:"clicked"
      ~c_identifier:"gtk_button_clicked" ~return_type:Type_factory.void_type
      ~doc:"Emits the clicked signal." ()
  in
  let ast = signature ~methods:[ clicked ] ~class_doc:None () in
  let method_doc =
    Helpers.expect_some "class type button_t"
      (Ml_ast_helpers.find_class_type_declaration ast "button_t") (fun ct ->
        Helpers.expect_some "method clicked"
          (Ml_ast_helpers.find_method_in_class_type ct.pci_expr "clicked")
          (fun field -> Ml_ast_helpers.doc_of_attributes field.pctf_attributes))
  in
  Alcotest.(check (option string))
    "the method's translated doc" (Some " Emits the clicked signal. ")
    method_doc

let tests =
  [
    ( "layer 2 module doc with a class doc",
      `Quick,
      test_l2_module_with_class_doc );
    ( "layer 2 module doc without a class doc starts with a synopsis",
      `Quick,
      test_l2_module_without_class_doc_starts_with_synopsis );
    ( "layer 1 module doc points to layer 2",
      `Quick,
      test_l1_module_points_to_layer2 );
    ( "combined module doc links its members, sorted",
      `Quick,
      test_combined_module_links_members_sorted );
    ( "layer 2 signature carries the module, class type docs",
      `Quick,
      test_signature_carries_docs );
    ( "layer 2 signature carries method docs",
      `Quick,
      test_signature_carries_method_docs );
  ]
