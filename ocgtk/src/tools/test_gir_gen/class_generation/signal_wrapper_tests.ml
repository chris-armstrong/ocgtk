(* Layer 2: Signal class generation unit tests.
   Migrated from integration/signals_tests.ml (Phase 2.2).
   Calls generate_signal_class in-process; no gir_gen.exe subprocess. *)

(* ========================================================================= *)
(* Test setup                                                                 *)
(* ========================================================================= *)

let signals_gir_content =
  Helpers.wrap_namespace
    {|
    <class name="Button" c:type="GtkButton" parent="Widget">
      <constructor name="new" c:identifier="gtk_button_new"/>
      <glib:signal name="clicked" when="first">
        <return-value transfer-ownership="none"><type name="none" c:type="void"/></return-value>
        <parameters/>
      </glib:signal>
      <glib:signal name="activate" when="last">
        <return-value transfer-ownership="none"><type name="none" c:type="void"/></return-value>
        <parameters/>
      </glib:signal>
    </class>
|}

let parse_button () =
  let gir_file =
    Pipeline_tmp.write_file ~test_name:"signal_wrapper" ~filename:"button.gir"
      signals_gir_content
  in
  let ( repository,
        namespace,
        classes,
        interfaces,
        gtk_enums,
        gtk_bitfields,
        gtk_records ) =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file gir_file []
  in
  let button =
    List.find
      (fun (c : Gir_gen_lib.Types.gir_class) -> c.class_name = "Button")
      classes
  in
  let parent_chain = match button.parent with Some p -> [ p ] | None -> [] in
  let ctx : Gir_gen_lib.Types.generation_context =
    {
      repository;
      namespace;
      classes;
      interfaces;
      enums = gtk_enums;
      bitfields = gtk_bitfields;
      records = gtk_records;
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = Gir_gen_lib.Types.StringMap.empty;
    }
  in
  (button, parent_chain, ctx)

let generate_code () =
  let button, parent_chain, ctx = parse_button () in
  Gir_gen_lib.Generate.Signal_gen.generate_signal_class ~ctx
    ~class_name:button.class_name ~signals:button.signals ~parent_chain

(* ========================================================================= *)
(* Test cases                                                                 *)
(* ========================================================================= *)

let test_signal_parsing () =
  let button, _, _ = parse_button () in
  Helpers.assert_true "Button should have 2 parsed signals"
    (List.length button.signals = 2)

let test_signal_class_generated () =
  let code = generate_code () in
  let ast = Ml_ast_helpers.parse_implementation code in
  Helpers.assert_some "Expected class 'button_signals' in generated code"
    (Ml_ast_helpers.find_class_declaration ast "button_signals")

let test_signal_methods_generated () =
  let code = generate_code () in
  let ast = Ml_ast_helpers.parse_implementation code in
  Helpers.expect_some "Expected class 'button_signals'"
    (Ml_ast_helpers.find_class_declaration ast "button_signals")
  @@ fun cls ->
  Helpers.assert_some "Expected method 'on_clicked' in button_signals"
    (Ml_ast_helpers.find_method_in_class cls.pci_expr "on_clicked");
  Helpers.assert_some "Expected method 'on_activate' in button_signals"
    (Ml_ast_helpers.find_method_in_class cls.pci_expr "on_activate")

let test_signal_uses_connect_simple () =
  let code = generate_code () in
  let ast = Ml_ast_helpers.parse_implementation code in
  Helpers.expect_some "Expected class 'button_signals'"
    (Ml_ast_helpers.find_class_declaration ast "button_signals")
  @@ fun cls ->
  let methods = Ml_ast_helpers.find_all_methods_in_class cls.pci_expr in
  let any_uses_connect_simple =
    List.exists
      (fun method_name ->
        match Ml_ast_helpers.find_method_in_class cls.pci_expr method_name with
        | None -> false
        | Some cf -> (
            match Ml_ast_helpers.get_method_body cf with
            | None -> false
            | Some body ->
                Ml_ast_helpers.method_body_calls_function body "Gobject.Signal"
                  "connect_simple"))
      methods
  in
  if not any_uses_connect_simple then
    Alcotest.fail
      "Expected signal methods to call Gobject.Signal.connect_simple"

(* ========================================================================= *)
(* Test suite                                                                 *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Signal parsing (Button has 2 signals)" `Quick
      test_signal_parsing;
    Alcotest.test_case "Signal class generated" `Quick
      test_signal_class_generated;
    Alcotest.test_case "Signal methods (on_clicked, on_activate)" `Quick
      test_signal_methods_generated;
    Alcotest.test_case "Signal methods call connect_simple" `Quick
      test_signal_uses_connect_simple;
  ]
