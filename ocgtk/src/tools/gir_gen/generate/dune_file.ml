(* Dune File Generation *)

open StdLabels
open Printf

(* Map GIR namespace names to pkg-config package names *)
let pkg_config_name_of_namespace namespace_name =
  match String.lowercase_ascii namespace_name with
  | "gtk" -> "gtk4"
  | "gio" -> "gio-2.0"
  | "gdk" -> "gdk-4.0"
  | "pango" -> "pango"
  | "gdkpixbuf" -> "gdk-pixbuf-2.0"
  | "graphene" -> "graphene-1.0"
  | "gsk" -> "gsk-4.0"
  | ns -> ns  (* Default: use namespace as-is *)

(* Generate dune library stanza for generated C stubs *)
let generate_dune_library ~lib_name ~stub_names ~module_names ~package_names =
  let buf = Buffer.create 2048 in

  (* Determine pkg-config package name and generate sexp file names *)
  (* let pkg_config_name = pkg_config_name_of_namespace lib_name in *)
  let cflag_file = sprintf "cflag-%s.sexp" (String.lowercase_ascii lib_name) in
  let clink_file = sprintf "clink-%s.sexp" (String.lowercase_ascii lib_name) in

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

  (* Generate pkg-config rules for this library *)
  bprintf buf "(rule\n";
  bprintf buf " (targets %s %s)\n" cflag_file clink_file;
  bprintf buf " (action (bash \"\\\n";
  bprintf buf "echo '' > %s.tmp && \\\\\n" cflag_file;
  bprintf buf "echo '' > %s.tmp && \\\\\n" clink_file;

  List.iter ~f:(fun package_name ->
    bprintf buf "pkg-config --cflags %s >> %s.tmp && \\\\\n" package_name cflag_file;
    bprintf buf "pkg-config --libs %s >> %s.tmp && \\\\\n" package_name clink_file;
  ) package_names;
  bprintf buf "echo \\\"(\\\" > %s && \\\\\n" cflag_file;
  bprintf buf "tr ' ' '\\\\n' < %s.tmp | sed 's/^\\\\(.*\\\\)$/\\\\1/' | tr '\\\\n' ' ' >> %s && \\\\\n" cflag_file cflag_file;
  bprintf buf "echo \\\")\\\" >> %s && \\\\\n" cflag_file;
  bprintf buf "echo \\\"(\\\" > %s && \\\\\n" clink_file;
  bprintf buf "tr ' ' '\\\\n' < %s.tmp | sed 's/^\\\\(.*\\\\)$/\\\\1/' | tr '\\\\n' ' ' >> %s && \\\\\n" clink_file clink_file;
  bprintf buf "echo \\\")\\\" >> %s && \\\\\n" clink_file;
  bprintf buf "rm %s.tmp %s.tmp\\\\\n" cflag_file clink_file;
  bprintf buf "\")))\n\n";

  Buffer.add_string buf "(library\n";
  Buffer.add_string buf (sprintf " (name ocgtk_%s_generated_stubs)\n" (lib_name |> Utils.to_snake_case));
  Buffer.add_string buf (sprintf " (public_name ocgtk.%s.generated_stubs)\n" (lib_name |> Utils.to_snake_case));
  Buffer.add_string buf " (wrapped false)\n";
  Buffer.add_string buf " (modules)  ; No OCaml modules, only C stubs\n";
  Buffer.add_string buf " (libraries ocgtk_common)  ; Depend on common for header files\n";
  Buffer.add_string buf " (foreign_stubs\n";
  Buffer.add_string buf "  (language c)\n";
  Buffer.add_string buf "  (names\n";

  List.iter ~f:(fun name ->
    (* Files are in the same directory as this dune file (generated/) *)
    bprintf buf "   %s\n" name
  ) stub_names;

  Buffer.add_string buf "  )\n";
  bprintf buf "  (flags -fPIC -Igenerated -Icore -I../common (:include %s) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))\n" cflag_file;
  bprintf buf " (c_library_flags (:include %s)))\n" clink_file;

  Buffer.contents buf
