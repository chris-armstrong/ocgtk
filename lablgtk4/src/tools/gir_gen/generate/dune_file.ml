(* Dune File Generation *)

open StdLabels
open Printf

(* Generate dune library stanza for generated C stubs *)
let generate_dune_library ~stub_names ~module_names =
  let buf = Buffer.create 2048 in

  Buffer.add_string buf "; Auto-generated library for generated C bindings\n";
  Buffer.add_string buf "; Regenerate by running gir_gen\n\n";

  (* Rule to emit the generated module list for inclusion in the main library stanza *)
  Buffer.add_string buf "(rule\n";
  Buffer.add_string buf " (targets dune-modules.sexp)\n";
  Buffer.add_string buf " (action\n";
  Buffer.add_string buf "  (with-stdout-to dune-modules.sexp\n";
  Buffer.add_string buf "    (progn\n";
  List.iter ~f:(fun name ->
    bprintf buf "      (echo \"%s\")\n" name
  ) module_names;
  Buffer.add_string buf "    )))\n";
  Buffer.add_string buf ")\n\n";

  Buffer.add_string buf "(library\n";
  Buffer.add_string buf " (name lablgtk4_generated_stubs)\n";
  Buffer.add_string buf " (public_name lablgtk4.generated_stubs)\n";
  Buffer.add_string buf " (wrapped false)\n";
  Buffer.add_string buf " (modules)  ; No OCaml modules, only C stubs\n";
  Buffer.add_string buf " (foreign_stubs\n";
  Buffer.add_string buf "  (language c)\n";
  Buffer.add_string buf "  (names\n";

  List.iter ~f:(fun name ->
    (* Files are in the same directory as this dune file (generated/) *)
    bprintf buf "   %s\n" name
  ) stub_names;

  Buffer.add_string buf "  )\n";
  Buffer.add_string buf "  (flags -fPIC (:include ../../cflag-gtk4.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))\n";
  Buffer.add_string buf " (c_library_flags (:include ../../clink-gtk4.sexp)))\n";

  Buffer.contents buf
