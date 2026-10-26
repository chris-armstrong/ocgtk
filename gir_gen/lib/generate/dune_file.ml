(* Dune File Generation *)

open ContainersLabels
open Gen_buffer

(* Maximum C stub files per batch library. Windows (CreateProcess) has a
   32 767-char command-line limit; ~80 stubs × ~55-char path ≈ 4 400 chars,
   leaving enough headroom for the ar/ld invocation. *)
let stub_batch_size = 80

(* Order the stub file names for batching.

   Every class stub file (ml_button_gen, ml_box_gen, ...) depends on the
   enum converter file (ml_<ns>_enums_gen) of its namespace, but the
   native linker emits the -cclib archive flags in the reverse of the
   order the batch libraries are listed, so the first-listed batch
   (batch_0) is scanned *last* by ld. Chunking a plain alphabetical list
   therefore leaves class stubs whose enum converter landed in an
   earlier-listed batch unable to resolve it whenever nothing else pulls
   the converter archive in first — exactly what happens in executables
   that only reference class stubs from the first batch (e.g. tests
   using Button/Box but no Widget/Window).

   Enum converter files are the only stubs that everything else
   depends on while depending on nothing, so listing them first — and
   thus inside batch_0, where the single-archive rescan of ld resolves
   the mutual references with the batch_0 class stubs — makes every
   cross-batch reference flow towards later-scanned archives. *)
let order_stub_names_for_batching names =
  let is_enums_converter name = String.suffix ~suf:"_enums_gen" name in
  let sorted = List.sort ~cmp:String.compare names in
  let enums, rest = List.partition ~f:is_enums_converter sorted in
  List.concat [ enums; rest ]

(* Split a list into chunks of at most n elements, preserving order. *)
let list_chunks n lst =
  let rec go acc cur cnt = function
    | [] ->
        if List.is_empty cur then List.rev acc
        else List.rev (List.rev cur :: acc)
    | x :: rest ->
        if cnt = n then go (List.rev cur :: acc) [ x ] 1 rest
        else go acc (x :: cur) (cnt + 1) rest
  in
  go [] [] 0 lst

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

(* Whether namespace_name is, or transitively includes, target_namespace. *)
let rec transitively_includes ~ctx ~visited ~target namespace_name =
  let open Types in
  String.equal namespace_name target
  ||
  if List.mem ~eq:String.equal namespace_name visited then false
  else
    let visited = namespace_name :: visited in
    match StringMap.find_opt namespace_name ctx.cross_references with
    | None -> false
    | Some ncr ->
        List.exists
          ~f:(transitively_includes ~ctx ~visited ~target)
          ncr.ncr_namespace_includes

(* Warnings generated code triggers routinely: deprecated values, omitted
   labels, unused names and opens, unattached doc comments. *)
let generated_ocaml_flags = ":standard -w -3-6-9-27-32-33-34-50"

(* Namespaces whose libraries the current one depends on: its GIR includes and
   theirs, transitively, without the base namespaces (GLib, GObject, ...)
   that ocglib covers. Sorted. *)
let dependency_namespaces ~ctx ~repository =
  let rec collect ~visited namespace_name =
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
            |> List.map ~f:(collect ~visited)
            |> List.flatten
      in
      namespace_name :: transitive
  in
  Types.(repository.repository_includes)
  |> List.map ~f:(fun { Types.include_name; _ } ->
      collect ~visited:[] include_name)
  |> List.flatten
  |> List.sort_uniq ~cmp:String.compare

(* Emit the pkg-config rule that generates cflag and clink sexp files. The
   rule is in raw/generated/dune.inc, included from <pkg>/raw/dune, so paths
   are relative to <pkg>/raw/. *)
let emit_pkg_config_rule buf ~cflag_file ~clink_file ~all_packages ~is_optional
    =
  bprintf buf "(rule\n";
  bprintf buf " (targets %s %s)\n" cflag_file clink_file;
  bprintf buf " (action\n";
  bprintf buf "  (run\n";
  bprintf buf "   %%{exe:../../configurator/config_flags.exe}\n";
  List.iter
    ~f:(fun package_name ->
      let flag =
        if is_optional package_name then "--pkg-optional" else "--pkg"
      in
      bprintf buf "   %s\n   %s\n" flag package_name)
    all_packages;
  bprintf buf "   --cflags-out\n   %s\n" cflag_file;
  bprintf buf "   --libs-out\n   %s)))\n\n" clink_file

(* Other namespaces' stubs include the decls header, which includes the core
   header. [install_c_headers] takes headers from the library's own directory
   (<pkg>/raw/), so both are copied up from generated/ and core/; includes
   name them without a directory. *)
let emit_header_copy_rules buf ~namespace =
  let ns_lower = String.lowercase_ascii namespace in
  List.iter
    ~f:(fun (dir, header) ->
      bprintf buf "(rule\n (copy %s/%s %s))\n\n" dir header header)
    [ ("generated", ns_lower ^ "_decls.h"); ("core", ns_lower ^ "_core.h") ]

(* Emit one library stanza containing C foreign stubs (either the single
   stubs library or one batch of it). *)
let emit_stub_library buf ~name ~public_name ~dep_libraries ~stub_names
    ~cflag_file ~clink_file =
  bprintf buf "(library\n";
  bprintf buf " (name %s)\n" name;
  (match public_name with
  | Some pn -> bprintf buf " (public_name %s)\n" pn
  | None -> ());
  Buffer.add_string buf " (wrapped false)\n";
  Buffer.add_string buf " (modules)  ; No OCaml modules, only C stubs\n";
  let libraries_clause =
    if String.equal dep_libraries "" then
      " (libraries ocglib)  ; Depend on ocglib for header files\n"
    else
      Fmt.str
        " (libraries %s ocglib)  ; Dependencies and ocglib for header files\n"
        dep_libraries
  in
  Buffer.add_string buf libraries_clause;
  Buffer.add_string buf " (foreign_stubs\n";
  Buffer.add_string buf "  (language c)\n";
  Buffer.add_string buf "  (names\n";
  List.iter ~f:(fun s -> bprintf buf "   %s\n" s) stub_names;
  Buffer.add_string buf "  )\n";
  bprintf buf
    "  (flags -fPIC -Igenerated -Icore (:include %s) \
     -Wno-deprecated-declarations -Wno-incompatible-pointer-types \
     -Wno-int-conversion))\n"
    cflag_file;
  bprintf buf " (c_library_flags (:include %s)))\n\n" clink_file

(* Generate raw/generated/dune.inc: the pkg-config rule, the header copies and
   the C stubs library (or its batches) that the raw library depends on *)
let generate_raw_dune_inc ~ctx ~namespace ~stub_names ~repository =
  let buf = Buffer.create 2048 in

  let ns_lower = String.lowercase_ascii namespace in
  let cflag_file = Fmt.str "cflag-%s.sexp" ns_lower in
  let clink_file = Fmt.str "clink-%s.sexp" ns_lower in

  Buffer.add_string buf "; Auto-generated library for generated C bindings\n";
  Buffer.add_string buf "; Regenerate by running gir_gen\n\n";

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
  (* Our hand-written gio_core.h unconditionally #includes gio-unix-2.0
     headers on Linux (see ocgio/raw/core/gio_core.h). Newer GLib (>=2.86)
     split Gio's Unix-specific types out into a separate GioUnix-2.0
     namespace, so Gio-2.0.gir no longer declares <package
     name="gio-unix-2.0"/> and it won't show up via repository_packages or
     dep_packages below. Force it in for Gio itself and for anything that
     transitively pulls in Gio's headers, regardless of what the GIR
     declares. *)
  let needs_gio_unix =
    String.equal namespace "Gio"
    || List.exists
         ~f:(fun { Types.include_name; _ } ->
           transitively_includes ~ctx ~visited:[] ~target:"Gio" include_name)
         repository.repository_includes
  in
  let all_packages =
    (if needs_gio_unix then [ "gio-unix-2.0" ] else [])
    @ repository.repository_packages @ dep_packages
    |> List.sort_uniq ~cmp:String.compare
  in

  (* Packages that are Linux-only (e.g. gio-unix-2.0 is absent on macOS /
     FreeBSD where Homebrew GLib ships no separate .pc file). These are
     queried with --pkg-optional so the configurator silently skips them
     on platforms where they don't exist. *)
  let optional_packages = [ "gio-unix-2.0" ] in
  let is_optional p = List.mem ~eq:String.equal p optional_packages in

  emit_pkg_config_rule buf ~cflag_file ~clink_file ~all_packages ~is_optional;
  emit_header_copy_rules buf ~namespace;

  (* The stubs include other namespaces' decls headers, which their raw
     libraries install. *)
  let dep_libraries =
    dependency_namespaces ~ctx ~repository
    |> List.map ~f:Module_paths.raw_library_public_name
    |> String.concat ~sep:" "
  in

  let n_stubs = List.length stub_names in
  if n_stubs <= stub_batch_size then begin
    (* Small enough to fit in a single library stanza — order is irrelevant
       with a single archive, but keep it canonical. *)
    emit_stub_library buf
      ~name:(Module_paths.stubs_library_name namespace)
      ~public_name:(Some (Module_paths.stubs_library_public_name namespace))
      ~dep_libraries
      ~stub_names:(order_stub_names_for_batching stub_names)
      ~cflag_file ~clink_file
  end
  else begin
    (* Too many stubs for a single Windows command line — split into batches.
       Each batch is a private library; a public facade library depends on all
       of them so downstream consumers need only list the facade. *)
    let batches =
      list_chunks stub_batch_size (order_stub_names_for_batching stub_names)
    in
    let batch_lib_names =
      List.mapi
        ~f:(fun i _ -> Module_paths.stubs_batch_library_name namespace i)
        batches
    in
    (* Emit each batch library with a public name (required because the public
       facade library lists them as dependencies). *)
    List.iteri
      ~f:(fun i batch_stubs ->
        emit_stub_library buf
          ~name:(Module_paths.stubs_batch_library_name namespace i)
          ~public_name:
            (Some (Module_paths.stubs_batch_library_public_name namespace i))
          ~dep_libraries ~stub_names:batch_stubs ~cflag_file ~clink_file)
      batches;
    (* Emit the public facade library that depends on all batches.
       The facade carries no C stubs itself; dune propagates the C archives
       of the batch libraries transitively when linking downstream targets. *)
    bprintf buf "(library\n";
    bprintf buf " (name %s)\n" (Module_paths.stubs_library_name namespace);
    bprintf buf " (public_name %s)\n"
      (Module_paths.stubs_library_public_name namespace);
    Buffer.add_string buf " (wrapped false)\n";
    Buffer.add_string buf " (modules)  ; No OCaml modules, only C stubs\n";
    let batch_deps = String.concat ~sep:" " batch_lib_names in
    bprintf buf " (libraries %s))\n" batch_deps
  end;

  Buffer.contents buf

let generated_dune_header = "; GENERATED CODE - DO NOT EDIT\n\n"

(* Generate enums/generated/dune: pure OCaml, no dependencies *)
let generate_enums_dune ~namespace =
  Fmt.str
    "%s(library\n\
    \ (name %s)\n\
    \ (public_name %s)\n\
    \ (synopsis \"%s enumerations and bitfields\")\n\
    \ (flags %s))\n"
    generated_dune_header
    (Module_paths.enums_file_stem namespace)
    (Module_paths.enums_library_public_name namespace)
    namespace generated_ocaml_flags

(* Generate generated/dune: the main library, whose layer 2 refers to the
   other namespaces' main libraries only *)
let generate_main_dune ~ctx ~namespace ~repository =
  let libraries =
    [
      "ocglib";
      Module_paths.raw_library_public_name namespace;
      Module_paths.enums_library_public_name namespace;
    ]
    @ List.map ~f:Module_paths.package_name
        (dependency_namespaces ~ctx ~repository)
  in
  Fmt.str
    "%s(library\n\
    \ (name %s)\n\
    \ (public_name %s)\n\
    \ (synopsis \"OCaml bindings for %s\")\n\
    \ (flags %s -open Ocglib)\n\
    \ (libraries %s))\n"
    generated_dune_header
    (Module_paths.package_name namespace)
    (Module_paths.package_name namespace)
    namespace generated_ocaml_flags
    (String.concat ~sep:" " libraries)
