(* Signal parsing and generation tests *)

open Helpers

let signals_gir = wrap_namespace {|
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

let test_signal_parsing_and_generation () =
  let test_gir = "/tmp/test_signal_gen.gir" in
  create_gir_file test_gir signals_gir;
  let ( repository,
        namespace,
        classes,
        interfaces,
        gtk_enums,
        gtk_bitfields,
        gtk_records ) =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file test_gir []
  in
  let button =
    List.find
      (fun (c : Gir_gen_lib.Types.gir_class) -> c.class_name = "Button")
      classes
  in
  assert_true "Button signals should be parsed" (List.length button.signals = 2);
  let parent_chain = match button.parent with Some p -> [ p ] | None -> [] in
  let ctx_initial : Gir_gen_lib.Types.generation_context =
    {
      repository;
      namespace;
      classes;
      interfaces;
      enums = gtk_enums;
      bitfields = gtk_bitfields;
      records = gtk_records;
      external_enums = [];
      external_bitfields = [];
      hierarchy_map = Hashtbl.create 0;
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
    }
  in
  let hierarchy_map =
    Gir_gen_lib.Hierarchy_detection.build_hierarchy_map ctx_initial
  in
  let ctx = { ctx_initial with hierarchy_map } in
  let code =
    Gir_gen_lib.Generate.Signal_gen.generate_signal_class ~ctx
      ~class_name:button.class_name ~signals:button.signals ~parent_chain
  in
  assert_contains "Should generate signal class" code "class button_signals";
  assert_contains "Should generate clicked method" code "method on_clicked";
  assert_contains "Should generate activate method" code "method on_activate";
  assert_contains "Should connect via connect_simple" code
    "Gobject.Signal.connect_simple"

let tests =
  [
    Alcotest.test_case "Signal parsing and generation (Step 2)" `Quick
      test_signal_parsing_and_generation;
  ]
