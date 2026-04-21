(* Dune File Generation *)

open ContainersLabels
open Printf

(* Map GIR namespace names to pkg-config package names *)
let pkg_config_name_of_namespace ~ctx namespace_name =
  let open Types in
  if List.mem ~eq:String.equal namespace_name C_stubs.base_namespaces then []
  else
    let ncr_namespace =
      StringMap.find_opt namespace_name ctx.cross_references
    in
    let namespace_packages =
      ncr_namespace
      |> Option.get_exn_or
           ("Unable to find packages for namespace " ^ namespace_name)
      |> fun ncr_namespace -> ncr_namespace.ncr_namespace_packages
    in
    namespace_packages

(* Recursively collect all pkg-config packages from a namespace and its
   transitive includes. This is needed because C headers form a transitive
   inclusion chain (e.g. pangocairo_decls.h -> pango_decls.h -> gio_decls.h)
   so all transitive pkg-config packages must be available for compilation.
   Dune does not propagate foreign-stub include flags between libraries, so
   each generated stubs library must receive the full transitive cflag set. *)
let rec collect_transitive_packages ~ctx ~visited namespace_name =
  let open Types in
  if
    List.mem ~eq:String.equal namespace_name visited
    || List.mem ~eq:String.equal namespace_name C_stubs.base_namespaces
  then []
  else
    let visited = namespace_name :: visited in
    let direct = pkg_config_name_of_namespace ~ctx namespace_name in
    let transitive =
      match StringMap.find_opt namespace_name ctx.cross_references with
      | None -> []
      | Some ncr ->
          ncr.ncr_namespace_includes
          |> List.map ~f:(collect_transitive_packages ~ctx ~visited)
          |> List.flatten
    in
    direct @ transitive

(* Map namespace to library name for dune (ocgtk.<ns>) *)
let library_name_of_namespace namespace_name =
  let ns_lower = String.lowercase_ascii namespace_name in
  sprintf "ocgtk.%s" ns_lower

(* Generate dune library stanza for generated C stubs *)
let generate_dune_library ~ctx ~lib_name ~stub_names ~module_names ~repository =
  let buf = Buffer.create 2048 in

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
  List.iter
    ~f:(fun name -> bprintf buf "      (echo \"%s\")\n" name)
    module_names;
  Buffer.add_string buf "    )))\n";
  Buffer.add_string buf ")\n\n";

  (* Collect pkg-config packages from dependencies, recursively following
     cross-namespace includes to pick up transitive pkg-config deps *)
  let dep_packages =
    let open Types in
    repository.repository_includes
    |> List.map ~f:(fun include_ ->
        collect_transitive_packages ~ctx ~visited:[] include_.include_name)
    |> List.flatten
    |> List.sort_uniq ~cmp:String.compare
  in
  let all_packages =
    repository.repository_packages @ dep_packages
    |> List.sort_uniq ~cmp:String.compare
  in

  (* Packages that are Linux-only (e.g. gio-unix-2.0 is absent on macOS /
     FreeBSD where Homebrew GLib ships no separate .pc file). These are
     queried with --pkg-optional so the configurator silently skips them
     on platforms where they don't exist. *)
  let optional_packages = [ "gio-unix-2.0" ] in
  let is_optional p = List.mem ~eq:String.equal p optional_packages in
  (* Emit the pkg-config rule, invoking the shared dune-configurator
     executable (src/configurator/config_flags.exe) rather than running
     pkg-config directly in bash. *)
  bprintf buf "(rule\n";
  bprintf buf " (targets %s %s)\n" cflag_file clink_file;
  bprintf buf " (action\n";
  bprintf buf "  (run\n";
  (* Path is relative to the parent library dune — the .inc is inlined via
     (include generated/dune-generated.inc) from src/<ns>/dune, so paths
     resolve from src/<ns>/, not src/<ns>/generated/. *)
  bprintf buf "   %%{exe:../configurator/config_flags.exe}\n";
  List.iter
    ~f:(fun package_name ->
      let flag =
        if is_optional package_name then "--pkg-optional" else "--pkg"
      in
      bprintf buf "   %s\n   %s\n" flag package_name)
    all_packages;
  bprintf buf "   --cflags-out\n   %s\n" cflag_file;
  bprintf buf "   --libs-out\n   %s)))\n\n" clink_file;

  Buffer.add_string buf "(library\n";
  Buffer.add_string buf
    (sprintf " (name ocgtk_%s_generated_stubs)\n"
       (lib_name |> Utils.to_snake_case));
  Buffer.add_string buf
    (sprintf " (public_name ocgtk.%s.generated_stubs)\n"
       (lib_name |> Utils.to_snake_case));
  Buffer.add_string buf " (wrapped false)\n";
  Buffer.add_string buf " (modules)  ; No OCaml modules, only C stubs\n";
  (* Generate library dependencies for dependency namespaces, recursively
     collecting transitive includes *)
  let rec collect_transitive_namespaces ~visited namespace_name =
    let open Types in
    if
      List.mem ~eq:String.equal namespace_name visited
      || List.mem ~eq:String.equal namespace_name C_stubs.base_namespaces
    then []
    else
      let visited = namespace_name :: visited in
      let transitive =
        match StringMap.find_opt namespace_name ctx.cross_references with
        | None -> []
        | Some ncr ->
            ncr.ncr_namespace_includes
            |> List.map ~f:(collect_transitive_namespaces ~visited)
            |> List.flatten
      in
      namespace_name :: transitive
  in
  let dep_libraries =
    Types.(repository.repository_includes)
    |> List.map ~f:(fun { Types.include_name; _ } ->
        collect_transitive_namespaces ~visited:[] include_name)
    |> List.flatten
    |> List.sort_uniq ~cmp:String.compare
    |> List.map ~f:library_name_of_namespace
    |> String.concat ~sep:" "
  in

  (* Build libraries clause - dependencies first, then common *)
  let libraries_clause =
    if String.equal dep_libraries "" then
      " (libraries ocgtk_common)  ; Depend on common for header files\n"
    else
      sprintf
        " (libraries %s ocgtk_common)  ; Dependencies and common for header \
         files\n"
        dep_libraries
  in
  Buffer.add_string buf libraries_clause;
  Buffer.add_string buf " (foreign_stubs\n";
  Buffer.add_string buf "  (language c)\n";
  Buffer.add_string buf "  (names\n";

  List.iter
    ~f:(fun name ->
      (* Files are in the same directory as this dune file (generated/) *)
      bprintf buf "   %s\n" name)
    stub_names;

  Buffer.add_string buf "  )\n";

  bprintf buf
    "  (flags -fPIC -Igenerated -Icore -I../common (:include %s) \
     -Wno-deprecated-declarations -Wno-incompatible-pointer-types \
     -Wno-int-conversion))\n"
    cflag_file;
  bprintf buf " (c_library_flags (:include %s)))\n" clink_file;

  Buffer.contents buf
