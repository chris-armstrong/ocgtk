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

(* Find the first matching binary on PATH, returning its full path *)
let find_binary_on_path name =
  let entries = path_entries () in
  let exts = if Sys.os_type = "Win32" then [ ".exe"; ".cmd"; "" ] else [ "" ] in
  let rec search = function
    | [] -> None
    | dir :: dirs ->
      let rec try_exts = function
        | [] -> search dirs
        | ext :: exts ->
          let full = Filename.concat dir (name ^ ext) in
          if Sys.file_exists full then Some full
          else try_exts exts
      in
      try_exts exts
  in
  search entries

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

(* Dump detailed pkg-config diagnostics on Windows.
   Runs independently of dune-configurator — we manually resolve
   binaries on PATH and invoke them to see what they return. *)
let dump_pkgconf_diagnostics cfg packages =
  let log fmt = Printf.ksprintf (fun s -> Printf.eprintf "discover: %s\n%!" s) fmt in

  log "=== BEGIN WINDOWS PKG-CONFIG DIAGNOSTICS ===";
  log "Sys.os_type = %s" Sys.os_type;

  (* 1. Environment variables *)
  let env_vars =
    [ "PKG_CONFIG"; "PKG_CONFIG_PATH"; "PKG_CONFIG_SYSROOT_DIR";
      "PKG_CONFIG_LIBDIR"; "PKG_CONFIG_SYSTEM_INCLUDE_PATH";
      "PKG_CONFIG_SYSTEM_LIBRARY_PATH" ]
  in
  log "--- environment ---";
  List.iter (fun v ->
    log "  %s = %s" v
      (Option.value ~default:"(not set)" (Sys.getenv_opt v))
  ) env_vars;

  (* 2. Resolve binaries on PATH *)
  let binaries = [ "pkg-config"; "pkgconf";
                   "x86_64-w64-mingw32-pkg-config";
                   "x86_64-w64-mingw32-pkgconf" ] in
  log "--- binary resolution ---";
  List.iter (fun name ->
    match find_binary_on_path name with
    | None -> log "  %s : NOT FOUND" name
    | Some path -> log "  %s : %s" name path
  ) binaries;

  (* 3. Which binary does PKG_CONFIG env select? *)
  let effective_binary =
    match Sys.getenv_opt "PKG_CONFIG" with
    | Some s -> s
    | None -> "pkg-config"
  in
  log "--- effective binary ---";
  log "  configured as: %s" effective_binary;
  (match find_binary_on_path effective_binary with
   | None -> log "  resolved to: NOT FOUND"
   | Some path -> log "  resolved to: %s" path);

  (* 4. Run the effective binary with --version *)
  log "--- version ---";
  (try
     let out = Configurator.V1.Process.run cfg effective_binary [ "--version" ] in
     log "  %s --version: %s" effective_binary (String.trim out)
   with exn ->
     log "  %s --version: FAILED (%s)" effective_binary (Printexc.to_string exn));

  (* 5. Run pkgconf --about if available, to get build info *)
  log "--- pkgconf --about ---";
  (try
     let out = Configurator.V1.Process.run cfg "pkgconf" [ "--about" ] in
     String.split_on_char '\n' (String.trim out)
     |> List.iter (fun line -> log "  %s" line)
   with exn ->
     log "  pkgconf --about: FAILED (%s)" (Printexc.to_string exn));

  (* 6. Show the .pc search path via --variable pc_path *)
  log "--- pkgconf search paths ---";
  (try
     let out = Configurator.V1.Process.run cfg "pkgconf"
       [ "--variable=pc_path"; "pkg-config" ] in
     log "  pc_path: %s" (String.trim out)
   with _ ->
     (* Fall back to --debug and grep, or just skip *)
     log "  (could not query pc_path)");

  (* 7. For each requested package, run pkgconf directly and compare *)
  log "--- per-package pkgconf output ---";
  List.iter (fun package ->
    log "  [%s]" package;

    (* --cflags *)
    (try
       let out = Configurator.V1.Process.run cfg "pkgconf"
         [ "--cflags"; package ] in
       let trimmed = String.trim out in
       let first_flags =
         String.split_on_char ' ' trimmed
         |> List.filter (fun s -> s <> "")
         |> (fun l ->
           let rec take acc n = function
             | [] -> List.rev acc
             | _ when n <= 0 -> List.rev acc
             | x :: xs -> take (x :: acc) (n - 1) xs
           in
           take [] 4 l)
       in
       log "    cflags (first 4): %s" (String.concat " " first_flags)
     with exn ->
       log "    cflags: FAILED (%s)" (Printexc.to_string exn));

    (* --libs *)
    (try
       let out = Configurator.V1.Process.run cfg "pkgconf"
         [ "--libs"; package ] in
       let trimmed = String.trim out in
       let first_flags =
         String.split_on_char ' ' trimmed
         |> List.filter (fun s -> s <> "")
         |> (fun l ->
           let rec take acc n = function
             | [] -> List.rev acc
             | _ when n <= 0 -> List.rev acc
             | x :: xs -> take (x :: acc) (n - 1) xs
           in
           take [] 4 l)
       in
       log "    libs (first 4): %s" (String.concat " " first_flags)
     with exn ->
       log "    libs: FAILED (%s)" (Printexc.to_string exn));

    (* Also try the effective_binary (which dune-configurator uses) *)
    if effective_binary <> "pkgconf" then begin
      (try
         let out = Configurator.V1.Process.run cfg effective_binary
           [ "--cflags"; package ] in
         let trimmed = String.trim out in
         let first_flags =
           String.split_on_char ' ' trimmed
           |> List.filter (fun s -> s <> "")
           |> (fun l ->
             let rec take acc n = function
               | [] -> List.rev acc
               | _ when n <= 0 -> List.rev acc
               | x :: xs -> take (x :: acc) (n - 1) xs
             in
             take [] 4 l)
         in
         log "    %s cflags (first 4): %s" effective_binary
           (String.concat " " first_flags)
       with exn ->
         log "    %s cflags: FAILED (%s)" effective_binary
           (Printexc.to_string exn))
    end

  ) packages;

  log "=== END WINDOWS PKG-CONFIG DIAGNOSTICS ==="

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
      (* On Windows, dump comprehensive diagnostics before the real query *)
      if Sys.os_type = "Win32" then
        dump_pkgconf_diagnostics cfg (packages @ optional_packages);
      let cflags, libs =
        match Pkg_config.get cfg with
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
          let cflags = List.concat_map (fun c -> c.Pkg_config.cflags) confs in
          let libs = List.concat_map (fun c -> c.Pkg_config.libs) confs in
          (* Log what dune-configurator actually produced *)
          if Sys.os_type = "Win32" then begin
            Printf.eprintf "discover: --- dune-configurator result ---\n";
            Printf.eprintf "discover:   cflags (%d flags): %s\n%!"
              (List.length cflags)
              (String.concat " "
                 (List.filteri (fun i _ -> i < 5) cflags));
            Printf.eprintf "discover:   libs (%d flags): %s\n%!"
              (List.length libs)
              (String.concat " "
                 (List.filteri (fun i _ -> i < 5) libs))
          end;
          (cflags, libs)
      in
      Flags.write_sexp !output_cflags cflags;
      Flags.write_sexp !output_libs libs)
