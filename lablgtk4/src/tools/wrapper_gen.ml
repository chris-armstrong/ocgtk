(* High-Level Wrapper Class Generator for LablGTK4 Phase 5.2
 *
 * This tool generates template high-level wrapper classes (GButton, GEdit, etc.)
 * from low-level generated bindings. The templates can then be customized by hand.
 *
 * Usage:
 *   wrapper_gen -widget Button -module GButton -output gButton.ml
 *)

open Printf
open StdLabels
open Cmdliner

(* ========================================================================= *)
(* Template Generation *)
(* ========================================================================= *)

let generate_wrapper_template ~widget_name ~module_name ~low_level_module =
  let class_name_lower = String.lowercase_ascii widget_name in
  let buf = Buffer.create 2048 in

  (* Header *)
  bprintf buf "(* High-level wrapper for %s widget *)\n\n" widget_name;
  bprintf buf "open Gtk\n";
  bprintf buf "open GObj\n\n";

  (* Skeleton class *)
  bprintf buf "(** %s widget skeleton *)\n" widget_name;
  bprintf buf "class %s_skel (obj : Gtk.Widget.t) = object\n" class_name_lower;
  bprintf buf "  inherit GObj.widget_impl obj\n\n";

  bprintf buf "  (* TODO: Add property accessors from %s module *)\n" low_level_module;
  bprintf buf "  (* Example:\n";
  bprintf buf "   * method set_label label = %s.set_label obj label\n" low_level_module;
  bprintf buf "   * method label = %s.get_label obj\n" low_level_module;
  bprintf buf "   *)\n\n";

  bprintf buf "  (* TODO: Add signal connections *)\n";
  bprintf buf "  (* Example:\n";
  bprintf buf "   * method connect_clicked ~callback =\n";
  bprintf buf "   *   (* Use g_signal_connect wrapper *)\n";
  bprintf buf "   *   ignore (callback) (* placeholder *)\n";
  bprintf buf "   *)\n";
  bprintf buf "end\n\n";

  (* Main class *)
  bprintf buf "(** %s widget *)\n" widget_name;
  bprintf buf "class %s obj = object\n" class_name_lower;
  bprintf buf "  inherit %s_skel (Gtk.Widget.coerce obj)\n" class_name_lower;
  bprintf buf "end\n\n";

  (* Constructor function *)
  bprintf buf "(** Create a new %s widget *)\n" widget_name;
  bprintf buf "let %s ?(packing : (GObj.widget -> unit) option) ?(show : bool option) () =\n" class_name_lower;
  bprintf buf "  (* TODO: Customize constructor with widget-specific optional arguments *)\n";
  bprintf buf "  (* Example: ?label ?use_underline ?icon_name etc. *)\n";
  bprintf buf "  let widget_obj = %s.new_ () in\n" low_level_module;
  bprintf buf "  let widget = new %s widget_obj in\n" class_name_lower;
  bprintf buf "  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());\n";
  bprintf buf "  (match show with Some true -> widget#show | _ -> ());\n";
  bprintf buf "  widget\n";

  Buffer.contents buf

let generate_wrapper_interface ~widget_name ~module_name ~low_level_module =
  let class_name_lower = String.lowercase_ascii widget_name in
  let buf = Buffer.create 1024 in

  (* Header *)
  bprintf buf "(** High-level wrapper for %s widget *)\n\n" widget_name;

  (* Skeleton class *)
  bprintf buf "(** %s widget skeleton *)\n" widget_name;
  bprintf buf "class %s_skel : Gtk.Widget.t ->\n" class_name_lower;
  bprintf buf "  object\n";
  bprintf buf "    inherit GObj.widget_impl\n";
  bprintf buf "    (* TODO: Add method signatures *)\n";
  bprintf buf "  end\n\n";

  (* Main class *)
  bprintf buf "(** %s widget *)\n" widget_name;
  bprintf buf "class %s : Gtk.Widget.t ->\n" class_name_lower;
  bprintf buf "  object\n";
  bprintf buf "    inherit %s_skel\n" class_name_lower;
  bprintf buf "  end\n\n";

  (* Constructor function *)
  bprintf buf "(** Create a new %s widget *)\n" widget_name;
  bprintf buf "val %s :\n" class_name_lower;
  bprintf buf "  ?packing:(GObj.widget -> unit) option ->\n";
  bprintf buf "  ?show:bool option ->\n";
  bprintf buf "  unit -> %s\n" class_name_lower;

  Buffer.contents buf

(* ========================================================================= *)
(* Batch Generation *)
(* ========================================================================= *)

let widget_categories = [
  ("Buttons", [
    ("Button", "GButton", "Button");
    ("CheckButton", "GButton", "CheckButton");
    ("ToggleButton", "GButton", "ToggleButton");
    ("LinkButton", "GButton", "LinkButton");
    ("MenuButton", "GButton", "MenuButton");
    ("Switch", "GButton", "Switch");
  ]);
  ("Entry", [
    ("Entry", "GEdit", "Entry");
    ("SearchEntry", "GEdit", "SearchEntry");
    ("PasswordEntry", "GEdit", "PasswordEntry");
    ("SpinButton", "GEdit", "SpinButton");
  ]);
  ("Text", [
    ("TextView", "GText", "TextView");
    ("TextBuffer", "GText", "TextBuffer");
  ]);
  ("Range", [
    ("Scale", "GRange", "Scale");
    ("ProgressBar", "GRange", "ProgressBar");
    ("LevelBar", "GRange", "LevelBar");
  ]);
  ("Misc", [
    ("Label", "GMisc", "Label");
    ("Image", "GMisc", "Image");
    ("Separator", "GMisc", "Separator");
    ("Spinner", "GMisc", "Spinner");
  ]);
]

let generate_category_file category widgets output_dir =
  let (_, first_widget) = List.hd widgets in
  let (_, module_name, _) = first_widget in
  let ml_file = Filename.concat output_dir (String.lowercase_ascii module_name ^ ".ml") in
  let mli_file = Filename.concat output_dir (String.lowercase_ascii module_name ^ ".mli") in

  (* Generate .ml file with all widgets in category *)
  let ml_buf = Buffer.create 4096 in
  bprintf ml_buf "(* High-level wrappers for %s widgets *)\n\n" category;
  bprintf ml_buf "open Gtk\n";
  bprintf ml_buf "open GObj\n\n";

  List.iter ~f:(fun (widget_name, _, low_level) ->
    Buffer.add_string ml_buf (generate_wrapper_template
      ~widget_name ~module_name ~low_level_module:low_level);
    bprintf ml_buf "\n";
  ) widgets;

  (* Generate .mli file *)
  let mli_buf = Buffer.create 2048 in
  bprintf mli_buf "(** High-level wrappers for %s widgets *)\n\n" category;

  List.iter ~f:(fun (widget_name, _, low_level) ->
    Buffer.add_string mli_buf (generate_wrapper_interface
      ~widget_name ~module_name ~low_level_module:low_level);
    bprintf mli_buf "\n";
  ) widgets;

  (* Write files *)
  let oc_ml = open_out ml_file in
  Buffer.output_buffer oc_ml ml_buf;
  close_out oc_ml;

  let oc_mli = open_out mli_file in
  Buffer.output_buffer oc_mli mli_buf;
  close_out oc_mli;

  printf "Generated %s\n" ml_file;
  printf "Generated %s\n" mli_file

let generate_all_wrappers output_dir =
  printf "Generating high-level wrapper templates...\n";
  List.iter ~f:(fun (category, widgets) ->
    printf "\n%s:\n" category;
    generate_category_file category widgets output_dir;
  ) widget_categories;
  printf "\n✓ Wrapper generation complete!\n";
  printf "  Note: These are TEMPLATES - customize them for your needs.\n";
  `Ok ()

(* ========================================================================= *)
(* Command-line Interface *)
(* ========================================================================= *)

let output_dir_arg =
  let doc = "Output directory for generated wrapper files" in
  Arg.(required & pos 0 (some dir) None & info [] ~docv:"OUTPUT_DIR" ~doc)

let generate_all_flag =
  let doc = "Generate all predefined wrapper categories" in
  Arg.(value & flag & info ["all"] ~doc)

let wrapper_gen_cmd =
  let doc = "Generate high-level wrapper class templates" in
  let man = [
    `S Manpage.s_description;
    `P "wrapper_gen creates template high-level wrapper classes (GButton, GEdit, etc.) \
        that wrap the low-level generated bindings. These templates should be \
        customized by hand to add widget-specific functionality.";
    `S Manpage.s_examples;
    `P "Generate all wrapper templates:";
    `Pre "  wrapper_gen --all ./output";
    `S Manpage.s_bugs;
    `P "Report bugs to https://github.com/chris-armstrong/lablgtk/issues";
  ] in
  let info = Cmd.info "wrapper_gen" ~version:"5.2.0" ~doc ~man in

  let run_gen _all output_dir =
    generate_all_wrappers output_dir
  in

  Cmd.v info Term.(ret (const run_gen $ generate_all_flag $ output_dir_arg))

let () = exit (Cmd.eval wrapper_gen_cmd)
