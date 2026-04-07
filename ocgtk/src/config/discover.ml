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
        | None -> [], []
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
