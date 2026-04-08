let path_entries () =
  match Sys.getenv_opt "PATH" with
  | None -> []
  | Some p ->
    let sep = if Sys.os_type = "Win32" then ';' else ':' in
    String.split_on_char sep p

let prog_exists_in dir prog =
  let path = Filename.concat dir prog in
  let paths =
    if Sys.os_type = "Win32" then
      [ path ^ ".exe"; path ^ ".cmd"; path ]
    else
      [ path ]
  in
  List.exists Sys.file_exists paths

let diagnose_pkg_config () =
  let entries = path_entries () in
  Printf.eprintf "discover: pkg-config not found via dune configurator\n";
  Printf.eprintf "discover: PKG_CONFIG env = %s\n"
    (Option.value ~default:"(not set)" (Sys.getenv_opt "PKG_CONFIG"));
  Printf.eprintf "discover: PATH has %d entries\n" (List.length entries);
  let found = ref [] in
  List.iter
    (fun dir ->
       List.iter
         (fun prog ->
            if prog_exists_in dir prog then
              found := (dir, prog) :: !found)
         [ "pkgconf"; "pkg-config" ])
    entries;
  (match !found with
   | [] ->
     Printf.eprintf "discover: neither pkgconf nor pkg-config found in any PATH entry\n";
     Printf.eprintf "discover: PATH entries searched:\n";
     List.iter (fun e -> Printf.eprintf "  %s\n" e) entries
   | hits ->
     Printf.eprintf "discover: found executables but configurator still returned None:\n";
     List.iter (fun (dir, prog) -> Printf.eprintf "  %s/%s\n" dir prog) (List.rev hits));
  Printf.eprintf "%!"

(* On Windows with MinGW cross-compilation, dune-configurator may select
   a cross-compiler-aware pkg-config binary (e.g. x86_64-w64-mingw32-pkg-config)
   that uses the Cygwin cross-compiler sysroot for .pc file lookup.  Since
   we provide GTK4/GLib headers via MSYS2 (not Cygwin cross-compilation
   packages), we need to query pkgconf directly and override the prefix
   to point to the MSYS2 MINGW64 installation.

   The OCGTK_MINGW_PREFIX environment variable should be set to the
   Windows-format path of the MSYS2 MINGW64 prefix, e.g. "D:/a/_temp/msys64/mingw64".
   When set, discover.exe calls pkgconf directly with --define-variable=prefix=...
   to override the .pc file prefix, producing correct Windows paths that
   the MinGW GCC compiler can resolve. *)
let query_mingw cfg ~packages ~optional_packages =
  let mingw_prefix = Sys.getenv "OCGTK_MINGW_PREFIX" in
  let binary =
    match Sys.getenv_opt "PKG_CONFIG" with
    | Some s -> s
    | None -> "pkgconf"
  in
  let define_var = "--define-variable=prefix=" ^ mingw_prefix in
  Printf.eprintf "discover: MinGW mode, prefix=%s, binary=%s\n%!" mingw_prefix binary;
  let split_flags s =
    String.split_on_char ' ' (String.trim s)
    |> List.filter (fun s -> s <> "")
  in
  let query_one ~required package =
    let run args =
      try
        Some (Configurator.V1.Process.run cfg binary (define_var :: args))
      with _ ->
        None
    in
    match run [ "--cflags"; package ], run [ "--libs"; package ] with
    | Some cflags, Some libs ->
      Some (split_flags cflags, split_flags libs)
    | _ ->
      if required then
        failwith (Printf.sprintf "pkg-config package not found: %s" package)
      else
        None
  in
  let required_results =
    List.map (fun p -> query_one ~required:true p) packages
  in
  let optional_results =
    List.map (fun p -> query_one ~required:false p) optional_packages
  in
  let all_results =
    List.filter_map Fun.id (required_results @ optional_results)
  in
  ( List.concat_map fst all_results
  , List.concat_map snd all_results )

let () =
  let packages = ref [] in
  let optional_packages = ref [] in
  let output_cflags = ref "c_flags.sexp" in
  let output_libs = ref "c_library_flags.sexp" in
  let open Configurator.V1 in
  main
    ~name:"ocgtk-discover"
    ~args:
      [ ( "--pkg"
        , Arg.String (fun p -> packages := p :: !packages)
        , "<name> Required pkg-config package" )
      ; ( "--optional-pkg"
        , Arg.String (fun p -> optional_packages := p :: !optional_packages)
        , "<name> Optional pkg-config package (skipped if not found)" )
      ; ( "--output-cflags"
        , Arg.String (fun s -> output_cflags := s)
        , "<file> Output file for C flags sexp (default: c_flags.sexp)" )
      ; ( "--output-libs"
        , Arg.String (fun s -> output_libs := s)
        , "<file> Output file for C library flags sexp (default: c_library_flags.sexp)" )
      ]
    (fun cfg ->
      let packages = List.rev !packages in
      let optional_packages = List.rev !optional_packages in
      let cflags, libs =
        match Sys.getenv_opt "OCGTK_MINGW_PREFIX" with
        | Some _ ->
          (* Windows MinGW: bypass Configurator.V1.Pkg_config and call
             pkgconf directly with prefix override *)
          query_mingw cfg ~packages ~optional_packages
        | None ->
          (* Standard path: use dune-configurator's Pkg_config *)
          (match Pkg_config.get cfg with
           | None ->
             diagnose_pkg_config ();
             failwith
               "pkg-config not found. Ensure pkg-config (or pkgconf) is installed \
                and available on PATH."
           | Some pc ->
             let query_required p =
               match Pkg_config.query pc ~package:p with
               | None -> failwith (Printf.sprintf "pkg-config package not found: %s" p)
               | Some c -> c
             in
             let confs =
               List.map query_required packages
               @ List.filter_map (fun p -> Pkg_config.query pc ~package:p) optional_packages
             in
             ( List.concat_map (fun c -> c.Pkg_config.cflags) confs
             , List.concat_map (fun c -> c.Pkg_config.libs) confs ))
      in
      Flags.write_sexp !output_cflags cflags;
      Flags.write_sexp !output_libs libs)
