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
      (* Log pkg-config environment on Windows for diagnostics *)
      if Sys.os_type = "Win32" then begin
        Printf.eprintf "discover: os_type=%s\n" Sys.os_type;
        Printf.eprintf "discover: PKG_CONFIG=%s\n"
          (Option.value ~default:"(not set)" (Sys.getenv_opt "PKG_CONFIG"));
        Printf.eprintf "discover: PKG_CONFIG_PATH=%s\n"
          (Option.value ~default:"(not set)" (Sys.getenv_opt "PKG_CONFIG_PATH"));
        Printf.eprintf "discover: PKG_CONFIG_SYSROOT_DIR=%s\n%!"
          (Option.value ~default:"(not set)" (Sys.getenv_opt "PKG_CONFIG_SYSROOT_DIR"))
      end;
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
          (* Log first few flags on Windows for diagnostics *)
          if Sys.os_type = "Win32" then begin
            let show_first n l =
              let rec take acc n = function
                | [] -> List.rev acc
                | _ when n <= 0 -> List.rev acc
                | x :: xs -> take (x :: acc) (n - 1) xs
              in
              String.concat " " (take [] n l)
            in
            Printf.eprintf "discover: cflags (first 5): %s\n%!" (show_first 5 cflags)
          end;
          (cflags, libs)
      in
      Flags.write_sexp !output_cflags cflags;
      Flags.write_sexp !output_libs libs)
