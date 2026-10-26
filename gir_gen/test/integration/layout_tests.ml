(* Integration tests for the per-namespace library layout: where gir_gen.exe
   writes each library's files, that earlier runs' leftovers are removed, and
   that each member of a cycle has its own layer 1 module. *)

open Helpers

let widget_gir =
  wrap_namespace
    {|
    <class name="Widget" c:type="GtkWidget" parent="GObject.InitiallyUnowned">
      <method name="show" c:identifier="gtk_widget_show">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
    </class>
    <enumeration name="Orientation" c:type="GtkOrientation">
      <member name="horizontal" value="0" c:identifier="GTK_ORIENTATION_HORIZONTAL"/>
    </enumeration>
|}

let write_file path content =
  let oc = open_out path in
  output_string oc content;
  close_out oc

let rec mkdir_p dir =
  if not (Sys.file_exists dir) then begin
    mkdir_p (Filename.dirname dir);
    Unix.mkdir dir 0o755
  end

(* A package directory holding a stale file in each generated directory (as
   an earlier run would leave for a renamed type) and a hand-written core
   module. *)
let package_with_leftovers () =
  let output_dir = Filename.temp_file "test_layout" "" in
  Sys.remove output_dir;
  let core_dir = Filename.concat output_dir "raw/core" in
  mkdir_p core_dir;
  write_file (Filename.concat core_dir "gtk_extra_core.ml") "let x = 1\n";
  let stale =
    [
      Filename.concat (raw_generated_dir output_dir) "ml_old_gen.c";
      Filename.concat (main_generated_dir output_dir) "gWidget.ml";
      Filename.concat (enums_generated_dir output_dir) "gtk_enums.ml";
    ]
  in
  List.iter
    (fun path ->
      mkdir_p (Filename.dirname path);
      write_file path "")
    stale;
  (output_dir, stale)

let with_generated_package f =
  let gir_file = Filename.temp_file "test_layout" ".gir" in
  let output_dir, stale = package_with_leftovers () in
  Fun.protect
    ~finally:(fun () ->
      remove_tree gir_file;
      remove_tree output_dir)
    (fun () ->
      create_gir_file gir_file widget_gir;
      ignore (run_gir_gen gir_file output_dir);
      f ~output_dir ~stale)

let assert_files_exist dir names =
  List.iter
    (fun name ->
      let path = Filename.concat dir name in
      assert_true (Fmt.str "%s should exist" path) (file_exists path))
    names

let test_each_library_in_its_directory () =
  with_generated_package @@ fun ~output_dir ~stale:_ ->
  assert_files_exist
    (raw_generated_dir output_dir)
    [ "widget.ml"; "widget.mli"; "ml_widget_gen.c"; "gtk_decls.h"; "dune.inc" ];
  assert_files_exist
    (enums_generated_dir output_dir)
    [ "ocgtk_enums.ml"; "ocgtk_enums.mli"; "dune" ];
  assert_files_exist
    (main_generated_dir output_dir)
    [ "widget.ml"; "widget.mli"; "raw.ml"; "enums.ml"; "dune" ]

let test_no_namespace_or_wrapper_module () =
  with_generated_package @@ fun ~output_dir ~stale:_ ->
  List.iter
    (fun name ->
      let path = Filename.concat (main_generated_dir output_dir) name in
      assert_true (Fmt.str "%s should not exist" path) (not (file_exists path)))
    [ "Gtk.ml"; "Gtk.mli"; "ocgtk_gtk.ml"; "gWidget.mli" ]

let test_stale_files_removed () =
  with_generated_package @@ fun ~output_dir:_ ~stale ->
  List.iter
    (fun path ->
      assert_true (Fmt.str "%s should be removed" path) (not (file_exists path)))
    stale

let test_core_kept_and_aliased () =
  with_generated_package @@ fun ~output_dir ~stale:_ ->
  assert_true "raw/core is not a generated directory"
    (file_exists (Filename.concat output_dir "raw/core/gtk_extra_core.ml"));
  let ast =
    Ml_ast_helpers.parse_implementation
      (read_file (Filename.concat (main_generated_dir output_dir) "raw.ml"))
  in
  Alcotest.(check (list (pair string string)))
    "raw.ml aliases"
    [
      ("Widget", "Ocgtk_raw.Widget");
      ("Gtk_extra_core", "Ocgtk_raw.Gtk_extra_core");
    ]
    (Ml_ast_helpers.module_aliases ast)

(* Alpha and Beta name each other, so they form one combined module *)
let cycle_gir =
  wrap_namespace
    {|
    <class name="Alpha" c:type="GtkAlpha" parent="GObject.Object">
      <method name="get_beta" c:identifier="gtk_alpha_get_beta">
        <return-value transfer-ownership="none"><type name="Beta" c:type="GtkBeta*"/></return-value>
      </method>
    </class>
    <class name="Beta" c:type="GtkBeta" parent="GObject.Object">
      <method name="get_alpha" c:identifier="gtk_beta_get_alpha">
        <return-value transfer-ownership="none"><type name="Alpha" c:type="GtkAlpha*"/></return-value>
      </method>
    </class>
|}

let test_cycle_members_have_shims () =
  let gir_file = Filename.temp_file "test_layout_cycle" ".gir" in
  let output_dir = Filename.temp_file "test_layout_cycle" "" in
  Sys.remove output_dir;
  Unix.mkdir output_dir 0o755;
  Fun.protect ~finally:(fun () ->
      remove_tree gir_file;
      remove_tree output_dir)
  @@ fun () ->
  create_gir_file gir_file cycle_gir;
  ignore (run_gir_gen gir_file output_dir);
  let raw_dir = raw_generated_dir output_dir in
  assert_files_exist raw_dir
    [ "alpha_and__beta.ml"; "alpha.ml"; "alpha.mli"; "beta.ml"; "beta.mli" ];
  Alcotest.(check (list string))
    "alpha.ml includes the member of the combined module"
    [ "Alpha_and__beta.Alpha" ]
    (Ml_ast_helpers.included_modules
       (Ml_ast_helpers.parse_implementation
          (read_file (Filename.concat raw_dir "alpha.ml"))));
  Alcotest.(check (list (pair string string)))
    "raw.ml aliases the shims"
    [ ("Alpha", "Ocgtk_raw.Alpha"); ("Beta", "Ocgtk_raw.Beta") ]
    (Ml_ast_helpers.module_aliases
       (Ml_ast_helpers.parse_implementation
          (read_file (Filename.concat (main_generated_dir output_dir) "raw.ml"))))

let tests =
  [
    ( "each library's files in its own directory",
      `Quick,
      test_each_library_in_its_directory );
    ( "no <Ns>.ml, ocgtk_<ns>.ml or G-prefixed module",
      `Quick,
      test_no_namespace_or_wrapper_module );
    ( "files left by an earlier run are removed",
      `Quick,
      test_stale_files_removed );
    ( "raw/core is kept and re-exported by raw.ml",
      `Quick,
      test_core_kept_and_aliased );
    ( "each member of a cycle has its own layer 1 module",
      `Quick,
      test_cycle_members_have_shims );
  ]
