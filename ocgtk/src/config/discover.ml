let () =
  let packages = ref [] in
  let optional_packages = ref [] in
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
      Flags.write_sexp "c_flags.sexp" cflags;
      Flags.write_sexp "c_library_flags.sexp" libs)
