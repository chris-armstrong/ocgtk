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
       ~has_constructors:false ~class_doc:(Some "A button."))

(* The first paragraph is also the synopsis on the parent's page, where
   [class-type-button_t] does not resolve. *)
let test_l2_module_without_class_doc_starts_with_synopsis () =
  check_text "a sentence of its own first, then the constructors link"
    "(** Bindings for [Button].\n\n\
     Its methods, signals and properties are on {!class-type-button_t}. Its \
     constructors are under {!section-constructors}. The functions it is built \
     on are in {!Ocgtk.Raw.Button}. *)"
    (Entity_doc.l2_module ~namespace:"Gtk" ~class_name:"Button"
       ~has_constructors:true ~class_doc:None)

let ctor ?ctor_doc () =
  Type_factory.make_gir_constructor ~ctor_name:"new_with_label"
    ~c_identifier:"gtk_button_new_with_label" ?ctor_doc ()

let test_constructor_fallback_links_upstream () =
  check_text "C function linked to its gi-docgen page"
    "(** Create a new [Button]. Wraps \
     {{:https://docs.gtk.org/gtk4/ctor.Button.new_with_label.html}[gtk_button_new_with_label]}. \
     *)"
    (Entity_doc.constructor ~namespace:"Gtk" ~class_name:"Button" (ctor ()))

let test_constructor_fallback_without_upstream_site () =
  check_text "C function, not linked"
    "(** Create a new [Button]. Wraps [gtk_button_new_with_label]. *)"
    (Entity_doc.constructor ~namespace:"cairo" ~class_name:"Button" (ctor ()))

let test_constructor_gir_doc_wins () =
  check_text "translated GIR doc" "(** Creates a labelled button. *)"
    (Entity_doc.constructor ~namespace:"Gtk" ~class_name:"Button"
       (ctor ~ctor_doc:"Creates a labelled button." ()))

let label_property ?prop_doc () =
  Type_factory.make_gir_property ~prop_name:"label"
    ~prop_type:(Type_factory.make_gir_type ~name:"utf8" ~c_type:"gchar*" ())
    ~readable:true ~writable:true ?prop_doc ()

let test_property_gir_doc_on_both_accessors () =
  let prop = label_property ~prop_doc:"Text of the label." () in
  check_text "getter" "(** Text of the label. *)"
    (Entity_doc.property ~accessor:Entity_doc.Getter prop);
  check_text "setter" "(** Text of the label. *)"
    (Entity_doc.property ~accessor:Entity_doc.Setter prop)

let test_property_fallback () =
  let prop = label_property () in
  check_text "getter" "(** Get property: label *)"
    (Entity_doc.property ~accessor:Entity_doc.Getter prop);
  check_text "setter" "(** Set property: label *)"
    (Entity_doc.property ~accessor:Entity_doc.Setter prop)

let test_l1_module_points_to_layer2 () =
  check_text "class doc, then the layer 2 module"
    "(** A button.\n\nThe class built on this module is in {!Ocgtk.Button}. *)"
    (Entity_doc.l1_module ~namespace:"Gtk" ~class_name:"Button"
       ~class_doc:(Some "A button."))

let test_class_links_layer1_type () =
  check_text "the layer 1 type it wraps"
    "(** Wraps a raw handle of {!Ocgtk.Raw.Button.t}. *)"
    (Entity_doc.class_ ~namespace:"Gtk" ~class_name:"Button")

let test_combined_module_links_members_sorted () =
  check_text "members sorted, at layer 2"
    "(** The classes of {!Ocgtk.Widget_paintable}, {!Ocgtk.Window}, defined \
     together because they refer to each other. Each has a module of its own \
     that re-exports it; use that module rather than this one. *)"
    (Entity_doc.combined_module ~namespace:"Gtk" ~layer:Entity_doc.Layer2
       ~class_names:[ "Window"; "WidgetPaintable" ])

let signature ?(methods = []) ?(properties = []) ~class_doc () =
  Class_gen.generate_class_signature
    ~ctx:(Helpers.create_test_context ())
    ~class_doc ~class_name:"Button" ~c_type:"GtkButton"
    ~parent_chain:[ "Widget" ] ~methods ~properties ~signals:[] ~constructors:[]
    ~entity_kind:Filtering.Class
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

let class_type_method_doc ast name =
  Helpers.expect_some "class type button_t"
    (Ml_ast_helpers.find_class_type_declaration ast "button_t") (fun ct ->
      Helpers.expect_some ("method " ^ name)
        (Ml_ast_helpers.find_method_in_class_type ct.pci_expr name)
        (fun field -> Ml_ast_helpers.doc_of_attributes field.pctf_attributes))

let test_signature_carries_property_docs () =
  let ast =
    signature
      ~properties:[ label_property ~prop_doc:"Text of the label." () ]
      ~class_doc:None ()
  in
  Alcotest.(check (option string))
    "getter" (Some " Text of the label. ")
    (class_type_method_doc ast "label");
  Alcotest.(check (option string))
    "setter" (Some " Text of the label. ")
    (class_type_method_doc ast "set_label")

let tests =
  [
    ( "layer 2 module doc with a class doc",
      `Quick,
      test_l2_module_with_class_doc );
    ( "layer 2 module doc without a class doc starts with a synopsis",
      `Quick,
      test_l2_module_without_class_doc_starts_with_synopsis );
    ( "constructor fallback links the gi-docgen page",
      `Quick,
      test_constructor_fallback_links_upstream );
    ( "constructor fallback without a gi-docgen site",
      `Quick,
      test_constructor_fallback_without_upstream_site );
    ("constructor GIR doc wins", `Quick, test_constructor_gir_doc_wins);
    ( "property GIR doc on both accessors",
      `Quick,
      test_property_gir_doc_on_both_accessors );
    ("property fallback", `Quick, test_property_fallback);
    ( "layer 2 signature carries property docs",
      `Quick,
      test_signature_carries_property_docs );
    ( "layer 1 module doc points to layer 2",
      `Quick,
      test_l1_module_points_to_layer2 );
    ("class doc links the layer 1 type", `Quick, test_class_links_layer1_type);
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
