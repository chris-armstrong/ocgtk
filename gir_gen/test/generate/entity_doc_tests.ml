(* Unit tests for the docs of a class's modules, class type and class
   (gir_gen/lib/generate/entity_doc.ml), and for where the layer 2 signature
   generator puts them. The texts are odoc markup, compared as strings; the
   placement is checked on the parsed signature. *)

open Gir_gen_lib.Generate

let no_links namespace = Doc_resolve.no_links ~namespace

let text = function
  | Some (Doc_emit.Comment c) -> c
  | Some (Doc_emit.Attribute a) -> "<attribute>" ^ a
  | None -> "<none>"

let check_text msg expected doc =
  Alcotest.(check string) msg expected (text doc)

let test_l2_module_with_class_doc () =
  check_text "class doc, then the navigation paragraph"
    "(** A button.\n\n\
     Its methods, signals and properties are on {!class-type-button_t}. Its \
     constructors are under {!section-constructors}. The functions it is built \
     on are in {!Ocgtk.Raw.Button}. *)"
    (Entity_doc.l2_module ~refs:(no_links "Gtk") ~class_name:"Button"
       ~class_doc:(Some "A button."))

(* The first paragraph is also the synopsis on the parent's page, where
   [class-type-button_t] does not resolve. *)
let test_l2_module_without_class_doc_starts_with_synopsis () =
  check_text "a sentence of its own first, then the navigation paragraph"
    "(** Bindings for [Button].\n\n\
     Its methods, signals and properties are on {!class-type-button_t}. Its \
     constructors are under {!section-constructors}. The functions it is built \
     on are in {!Ocgtk.Raw.Button}. *)"
    (Entity_doc.l2_module ~refs:(no_links "Gtk") ~class_name:"Button"
       ~class_doc:None)

let long_doc = "A button.\n\nIt can hold a child."

let test_l2_module_synopsis_is_first_paragraph () =
  check_text "first paragraph, then the navigation with the description link"
    "(** A button.\n\n\
     Its methods, signals and properties are on {!class-type-button_t}. Its \
     full description is under {!section-description}. Its constructors are \
     under {!section-constructors}. The functions it is built on are in \
     {!Ocgtk.Raw.Button}. *)"
    (Entity_doc.l2_module ~refs:(no_links "Gtk") ~class_name:"Button"
       ~class_doc:(Some long_doc))

(* A code block split at its blank line would leave markup open. *)
let test_l2_module_block_first_paragraph_falls_back () =
  let doc =
    Entity_doc.l2_module ~refs:(no_links "Gtk") ~class_name:"Button"
      ~class_doc:(Some "```c\nint x;\n\nint y;\n```\n\nA button.")
  in
  Alcotest.(check bool)
    ("the fallback sentence: " ^ text doc)
    true
    (Helpers.string_contains (text doc) "(** Bindings for [Button].\n\n")

let test_description_with_long_doc () =
  check_text "heading, then the whole class doc"
    "(** {1:description Description}\n\nA button.\n\nIt can hold a child. *)"
    (Entity_doc.description ~refs:(no_links "Gtk") ~class_name:"Button"
       ~class_doc:(Some long_doc))

let test_description_omitted_when_synopsis_is_all () =
  check_text "nothing beyond the synopsis" "<none>"
    (Entity_doc.description ~refs:(no_links "Gtk") ~class_name:"Button"
       ~class_doc:(Some "A button."));
  check_text "no class doc" "<none>"
    (Entity_doc.description ~refs:(no_links "Gtk") ~class_name:"Button"
       ~class_doc:None)

let test_class_type_with_class_doc () =
  check_text "the bold line, then the class doc"
    "(** {b The methods, signals and properties of a [Button].}\n\nA button. *)"
    (Entity_doc.class_type ~refs:(no_links "Gtk") ~class_name:"Button"
       ~inheritance:Entity_doc.no_inheritance ~class_doc:(Some "A button."))

let test_class_type_without_class_doc () =
  check_text "the bold line alone"
    "(** {b The methods, signals and properties of a [Button].} *)"
    (Entity_doc.class_type ~refs:(no_links "Gtk") ~class_name:"Button"
       ~inheritance:Entity_doc.no_inheritance ~class_doc:None)

let bound namespace name = Entity_doc.Bound { namespace; name }

let test_class_type_inheritance_block () =
  check_text "the block between the bold line and the class doc"
    "(** {b The methods, signals and properties of a [Button].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Actionable.class-type-actionable_t}Ocgtk.Actionable}\n\
     - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}\n\n\
     A button. *)"
    (Entity_doc.class_type ~refs:(no_links "Gtk") ~class_name:"Button"
       ~inheritance:
         {
           Entity_doc.parent = Some (bound "Gtk" "Widget");
           implements = [ bound "Gtk" "Actionable"; bound "Gio" "ListModel" ];
           requires = [];
         }
       ~class_doc:(Some "A button."))

let test_class_type_unbound_ancestor_is_code () =
  check_text "an ancestor without a layer 2 class is named, not linked"
    "(** {b The methods, signals and properties of a [Button].}\n\n\
     Inherits from: [GObject.InitiallyUnowned] *)"
    (Entity_doc.class_type ~refs:(no_links "Gtk") ~class_name:"Button"
       ~inheritance:
         {
           Entity_doc.no_inheritance with
           parent = Some (Entity_doc.Unbound "GObject.InitiallyUnowned");
         }
       ~class_doc:None)

let test_interface_requires () =
  check_text "an interface lists its prerequisites"
    "(** {b The methods, signals and properties of a [Actionable].}\n\n\
     Requires:\n\
     - {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget} *)"
    (Entity_doc.class_type ~refs:(no_links "Gtk") ~class_name:"Actionable"
       ~inheritance:
         { Entity_doc.no_inheritance with requires = [ bound "Gtk" "Widget" ] }
       ~class_doc:None)

let ctor ?ctor_doc () =
  Type_factory.make_gir_constructor ~ctor_name:"new_with_label"
    ~c_identifier:"gtk_button_new_with_label" ?ctor_doc ()

let test_constructor_fallback_links_upstream () =
  check_text "C function linked to its gi-docgen page"
    "(** Create a new [Button]. Wraps \
     {{:https://docs.gtk.org/gtk4/ctor.Button.new_with_label.html}[gtk_button_new_with_label]}. \
     *)"
    (Entity_doc.constructor ~refs:(no_links "Gtk") ~class_name:"Button"
       (ctor ()))

let test_constructor_fallback_without_upstream_site () =
  check_text "C function, not linked"
    "(** Create a new [Button]. Wraps [gtk_button_new_with_label]. *)"
    (Entity_doc.constructor ~refs:(no_links "cairo") ~class_name:"Button"
       (ctor ()))

let test_constructor_gir_doc_wins () =
  check_text "translated GIR doc" "(** Creates a labelled button. *)"
    (Entity_doc.constructor ~refs:(no_links "Gtk") ~class_name:"Button"
       (ctor ~ctor_doc:"Creates a labelled button." ()))

let test_constructor_null_on_error_throwing () =
  check_text "a throwing constructor's error is its Error result"
    "(** Reads the settings. Returns them, or an [Error] result. *)"
    (Entity_doc.constructor ~refs:(no_links "Gtk") ~class_name:"Button"
       (Type_factory.make_gir_constructor ~ctor_name:"new_from_file"
          ~c_identifier:"gtk_button_new_from_file" ~throws:true
          ~ctor_doc:"Reads the settings. Returns them, or %NULL on error." ()))

let test_constructor_null_on_error_plain () =
  check_text "a non-throwing constructor keeps the null"
    "(** Returns them, or [None] on error. *)"
    (Entity_doc.constructor ~refs:(no_links "Gtk") ~class_name:"Button"
       (ctor ~ctor_doc:"Returns them, or %NULL on error." ()))

let label_property ?prop_doc () =
  Type_factory.make_gir_property ~prop_name:"label"
    ~prop_type:(Type_factory.make_gir_type ~name:"utf8" ~c_type:"gchar*" ())
    ~readable:true ~writable:true ?prop_doc ()

let test_property_gir_doc_on_both_accessors () =
  let prop = label_property ~prop_doc:"Text of the label." () in
  check_text "getter" "(** Text of the label. *)"
    (Entity_doc.property ~refs:(no_links "Gtk") ~accessor:Entity_doc.Getter prop);
  check_text "setter" "(** Text of the label. *)"
    (Entity_doc.property ~refs:(no_links "Gtk") ~accessor:Entity_doc.Setter prop)

let test_property_fallback () =
  let prop = label_property () in
  check_text "getter" "(** Get property: label *)"
    (Entity_doc.property ~refs:(no_links "Gtk") ~accessor:Entity_doc.Getter prop);
  check_text "setter" "(** Set property: label *)"
    (Entity_doc.property ~refs:(no_links "Gtk") ~accessor:Entity_doc.Setter prop)

let test_l1_module_points_to_layer2 () =
  check_text "class doc, then the layer 2 module"
    "(** A button.\n\nThe class built on this module is in {!Ocgtk.Button}. *)"
    (Entity_doc.l1_module ~refs:(no_links "Gtk") ~class_name:"Button"
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

let signature ?(ctx = Helpers.create_test_context ()) ?(methods = [])
    ?(properties = []) ?(signals = []) ?(entity_kind = Filtering.Class)
    ~class_doc () =
  Class_gen.generate_class_signature ~ctx ~class_doc ~class_name:"Button"
    ~c_type:"GtkButton" ~parent_chain:[ "Widget" ] ~methods ~properties ~signals
    ~constructors:[] ~entity_kind
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
  let class_type_doc =
    Helpers.expect_some "class type button_t"
      (Ml_ast_helpers.find_class_type_declaration ast "button_t") (fun ct ->
        Ml_ast_helpers.doc_of_attributes ct.pci_attributes)
  in
  check_has "class type" ~sub:"The methods, signals and properties of a"
    class_type_doc;
  check_has "class type repeats the class doc" ~sub:"A button." class_type_doc

(* The preamble stays short so the class type and class come before the long
   description. Checked on the text, since the order of floating docs and items
   is the point. *)
let test_signature_layout_order () =
  let text =
    Class_gen.generate_class_signature
      ~ctx:(Helpers.create_test_context ())
      ~class_doc:(Some long_doc) ~class_name:"Button" ~c_type:"GtkButton"
      ~parent_chain:[ "Widget" ] ~methods:[] ~properties:[] ~signals:[]
      ~constructors:[] ~entity_kind:Filtering.Class
  in
  let position sub =
    match Re.Str.search_forward (Re.Str.regexp_string sub) text 0 with
    | i -> i
    | exception Not_found -> Alcotest.fail ("missing " ^ sub ^ " in:\n" ^ text)
  in
  let positions =
    List.map position
      [
        "(** A button.";
        "{1:class Class}";
        "class type button_t";
        "class button :";
        "{1:description Description}";
      ]
  in
  Alcotest.(check (list int))
    "synopsis, Class heading, class type, class, description" positions
    (List.sort compare positions)

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

let section_headings ast =
  Helpers.expect_some "class type button_t"
    (Ml_ast_helpers.find_class_type_declaration ast "button_t") (fun ct ->
      Ml_ast_helpers.class_type_floating_docs ct.pci_expr)

let check_sections msg expected ast =
  Alcotest.(check (list string)) msg expected (section_headings ast)

let clicked_method ?introspectable () =
  Type_factory.make_gir_method ~method_name:"clicked"
    ~c_identifier:"gtk_button_clicked" ~return_type:Type_factory.void_type
    ?introspectable ()

let test_sections_follow_emitted_members () =
  check_sections "a section per kind of member, in body order"
    [
      " {2:signals Signals} ";
      " {2:methods Methods} ";
      " {2:properties Properties} ";
      " {2:conversions Conversions} ";
    ]
    (signature
       ~signals:[ Type_factory.make_void_signal ~signal_name:"activate" () ]
       ~methods:[ clicked_method () ]
       ~properties:[ label_property () ]
       ~class_doc:None ())

let test_empty_sections_left_out () =
  check_sections "no members but the conversion"
    [ " {2:conversions Conversions} " ]
    (signature ~class_doc:None ())

let test_filtered_methods_leave_no_section () =
  check_sections "a method that is not bound"
    [ " {2:conversions Conversions} " ]
    (signature
       ~methods:[ clicked_method ~introspectable:false () ]
       ~class_doc:None ())

let check_no_constructors_line msg ~line ast =
  let docs = Ml_ast_helpers.floating_docs ast in
  let rec after_heading = function
    | " {1:constructors Constructors} " :: next :: _ -> Some next
    | _ :: rest -> after_heading rest
    | [] -> None
  in
  Alcotest.(check (option string))
    msg
    (Some (" " ^ line ^ " "))
    (after_heading docs)

let test_no_constructors_returned_only () =
  check_no_constructors_line "a class with no constructor"
    ~line:
      "This class is not instantiated directly - it is used as a return value \
       by methods on other classes."
    (signature ~class_doc:None ())

let test_no_constructors_abstract () =
  let base = Helpers.create_test_context () in
  let ctx =
    {
      base with
      Gir_gen_lib.Types.classes =
        Type_factory.make_gir_class ~class_name:"Button" ~c_type:"GtkButton"
          ~abstract:true ()
        :: base.classes;
    }
  in
  check_no_constructors_line "an abstract class"
    ~line:
      "This is an abstract class that can't be instantiated directly. Refer to \
       its subclasses for a concrete implementation."
    (signature ~ctx ~class_doc:None ())

let test_no_constructors_interface () =
  check_no_constructors_line "an interface"
    ~line:
      "This is an interface which can't be instantiated directly, but which \
       may be returned from a method or function."
    (signature ~entity_kind:Filtering.Interface ~class_doc:None ())

let tests =
  [
    ( "layer 2 module doc with a class doc",
      `Quick,
      test_l2_module_with_class_doc );
    ( "layer 2 module doc without a class doc starts with a synopsis",
      `Quick,
      test_l2_module_without_class_doc_starts_with_synopsis );
    ( "layer 2 module synopsis is the first paragraph",
      `Quick,
      test_l2_module_synopsis_is_first_paragraph );
    ( "layer 2 module synopsis falls back after a block",
      `Quick,
      test_l2_module_block_first_paragraph_falls_back );
    ("description with a long doc", `Quick, test_description_with_long_doc);
    ( "description omitted when the synopsis is all",
      `Quick,
      test_description_omitted_when_synopsis_is_all );
    ("layer 2 signature layout order", `Quick, test_signature_layout_order);
    ("class type doc with a class doc", `Quick, test_class_type_with_class_doc);
    ( "class type doc without a class doc",
      `Quick,
      test_class_type_without_class_doc );
    ( "constructor fallback links the gi-docgen page",
      `Quick,
      test_constructor_fallback_links_upstream );
    ( "constructor fallback without a gi-docgen site",
      `Quick,
      test_constructor_fallback_without_upstream_site );
    ("constructor GIR doc wins", `Quick, test_constructor_gir_doc_wins);
    ( "constructor null on error, throwing",
      `Quick,
      test_constructor_null_on_error_throwing );
    ( "constructor null on error, plain",
      `Quick,
      test_constructor_null_on_error_plain );
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
    ( "class type doc carries the inheritance block",
      `Quick,
      test_class_type_inheritance_block );
    ( "an unbound ancestor is code, not a link",
      `Quick,
      test_class_type_unbound_ancestor_is_code );
    ( "an interface's class type doc lists what it requires",
      `Quick,
      test_interface_requires );
    ( "no constructors: the line for a class returned by others",
      `Quick,
      test_no_constructors_returned_only );
    ( "no constructors: the abstract class line",
      `Quick,
      test_no_constructors_abstract );
    ( "no constructors: the interface line",
      `Quick,
      test_no_constructors_interface );
    ( "class type sections follow the emitted members",
      `Quick,
      test_sections_follow_emitted_members );
    ( "empty class type sections are left out",
      `Quick,
      test_empty_sections_left_out );
    ( "filtered methods leave no Methods section",
      `Quick,
      test_filtered_methods_leave_no_section );
  ]
