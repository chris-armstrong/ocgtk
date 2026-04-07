let run_pkg_config_direct flag pkg =
  let cmd = Printf.sprintf "pkg-config %s %s 2>/dev/null" flag pkg in
  try
    let ic = Unix.open_process_in cmd in
    let result = String.trim (In_channel.input_all ic) in
    (match Unix.close_process_in ic with _ -> ());
    if result = "" then []
    else
      String.split_on_char ' ' result
      |> List.filter (fun s -> s <> "")
  with _ -> []

let pkg_config_direct ~packages ~optional_packages =
  let cflags =
    List.concat_map (fun p -> run_pkg_config_direct "--cflags" p) packages
    @ List.concat_map (fun p -> run_pkg_config_direct "--cflags" p) optional_packages
  in
  let libs =
    List.concat_map (fun p -> run_pkg_config_direct "--libs" p) packages
    @ List.concat_map (fun p -> run_pkg_config_direct "--libs" p) optional_packages
  in
  (cflags, libs)

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
        match Pkg_config.get cfg with
        | None ->
          (* Configurator couldn't find pkg-config; fall back to running it directly *)
          pkg_config_direct ~packages ~optional_packages
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
          , List.concat_map (fun c -> c.Pkg_config.libs) confs )
      in
      Flags.write_sexp !output_cflags cflags;
      Flags.write_sexp !output_libs libs)
