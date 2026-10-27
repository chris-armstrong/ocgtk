(* Local cache of rendered odoc HTML, one artifact per commit. See
   scripts/README.md for the commands and the cache layout. *)

open Doc_artifacts_lib

let ( let* ) = Result.bind
let git args = Host.capture "git" args

let tree_key () =
  let* sha = git [ "rev-parse"; "HEAD" ] in
  let* status = git [ "status"; "--porcelain" ] in
  Artifact_key.of_tree ~sha ~is_dirty:(not (String.equal status ""))

let available_keys ~root =
  let dir = Cache_layout.artifacts_dir ~root in
  if not (Sys.file_exists dir) then []
  else
    Sys.readdir dir |> Array.to_list
    |> List.filter_map Cache_layout.key_of_tarball_name
    |> List.sort String.compare

(* A query is a key, a prefix of one, or anything git resolves to a commit
   (HEAD, a branch, a short sha), with an optional -dirty suffix. *)
let resolve ~root query =
  let suffix = "-dirty" in
  let base, dirty =
    if String.ends_with ~suffix query then
      (String.sub query 0 (String.length query - String.length suffix), suffix)
    else (query, "")
  in
  let query =
    match git [ "rev-parse"; "--verify"; "--quiet"; base ^ "^{commit}" ] with
    | Ok sha -> sha ^ dirty
    | Error _ -> query
  in
  Artifact_key.resolve ~available:(available_keys ~root) query

let run_step ~root key ~step program args =
  let log = Cache_layout.build_log ~root key ~step in
  match Host.run ~log program args with
  | 0 -> Ok log
  | code ->
      Error (Printf.sprintf "%s step exited with %d; see %s" step code log)

(* The committed bindings must be what the generator produces, or the
   artifact would not be the commit's. *)
let check_still_clean key =
  match key with
  | Artifact_key.Dirty _ -> Ok ()
  | Artifact_key.Clean _ -> (
      let* status = git [ "status"; "--porcelain" ] in
      match status with
      | "" -> Ok ()
      | changes ->
          Error
            (Printf.sprintf
               "regenerating the bindings changed the tree; commit the \
                regenerated files first:\n\
                %s"
               changes))

let write_artifact ~root key ~note ~doc_log =
  let html_dir = Cache_layout.html_dir ~root in
  let tarball = Cache_layout.tarball ~root key in
  let partial = tarball ^ ".partial" in
  let* () =
    match Host.run "tar" [ "-czf"; partial; "-C"; html_dir; "." ] with
    | 0 -> Ok ()
    | code -> Error (Printf.sprintf "tar exited with %d" code)
  in
  Sys.rename partial tarball;
  let warnings = Odoc_warnings.report (Host.read_file doc_log) in
  let* branch = git [ "rev-parse"; "--abbrev-ref"; "HEAD" ] in
  let* odoc_version = Host.capture "odoc" [ "--version" ] in
  let* dune_version = Host.capture "dune" [ "--version" ] in
  let date = Host.now_utc () in
  let manifest =
    {
      Manifest.key;
      branch;
      date;
      odoc_version;
      dune_version;
      byte_size = (Unix.stat tarball).Unix.st_size;
      html_file_count = Host.count_files ~suffix:".html" html_dir;
      note;
      odoc_warning_count = List.length warnings;
    }
  in
  Host.write_file (Cache_layout.manifest ~root key) (Manifest.to_json manifest);
  Host.write_file
    (Cache_layout.warnings ~root key)
    (String.concat "" (List.map (fun w -> w ^ "\n") warnings));
  Host.append_file
    (Cache_layout.index_file ~root)
    (Cache_layout.index_line ~key ~date ~branch ~note);
  Printf.printf "Built %s\n  %s\n  %d HTML files, %d odoc warnings\n"
    (Artifact_key.to_string key)
    tarball manifest.html_file_count manifest.odoc_warning_count;
  Ok 0

(* The docs are built in a build directory of their own, emptied first, so
   dune runs every odoc rule and the log holds every warning: dune does not
   replay the warnings of rules that are up to date, or restored from its
   cache (hence --cache=disabled). Deleting part of _build instead leaves
   dune's database out of step with the files. *)
let rebuild ~root key ~note =
  Host.mkdir_p (Cache_layout.artifacts_dir ~root);
  let* _ =
    run_step ~root key ~step:"regenerate" "bash"
      [ "scripts/generate-bindings.sh" ]
  in
  let* () = check_still_clean key in
  let build_dir = Cache_layout.build_dir ~root in
  let* () =
    match Host.run "rm" [ "-rf"; build_dir ] with
    | 0 -> Ok ()
    | code -> Error (Printf.sprintf "removing %s exited with %d" build_dir code)
  in
  let* doc_log =
    run_step ~root key ~step:"doc" "dune"
      [ "build"; "--build-dir"; build_dir; "--cache=disabled"; "@doc" ]
  in
  write_artifact ~root key ~note ~doc_log

let build ~root ~force ~note =
  let* key = tree_key () in
  let tarball = Cache_layout.tarball ~root key in
  match key with
  | Artifact_key.Clean _ when (not force) && Sys.file_exists tarball ->
      Printf.printf "Cache hit for %s\n  %s\n"
        (Artifact_key.to_string key)
        tarball;
      Ok 0
  | Artifact_key.Clean _ | Artifact_key.Dirty _ -> rebuild ~root key ~note

let list ~root =
  let index = Cache_layout.index_file ~root in
  if Sys.file_exists index then print_string (Host.read_file index)
  else Printf.printf "No artifacts in %s yet\n" root;
  Ok 0

let untar ~root key dir =
  Host.mkdir_p dir;
  match
    Host.run "tar" [ "-xzf"; Cache_layout.tarball ~root key; "-C"; dir ]
  with
  | 0 -> Ok dir
  | code -> Error (Printf.sprintf "tar exited with %d" code)

(* The view directory belongs to the cache, so it is replaced; a directory
   the user names must be new or empty. *)
let extract_to_view ~root key =
  let dir = Cache_layout.view_dir ~root key in
  match Host.run "rm" [ "-rf"; dir ] with
  | 0 -> untar ~root key dir
  | code -> Error (Printf.sprintf "removing %s exited with %d" dir code)

let extract ~root query dir =
  let* key = resolve ~root query in
  let* dir =
    match dir with
    | None -> extract_to_view ~root key
    | Some dir when (not (Sys.file_exists dir)) || Host.is_empty_dir dir ->
        untar ~root key dir
    | Some dir -> Error (Printf.sprintf "%s exists and is not empty" dir)
  in
  Printf.printf "Extracted %s to %s\n" (Artifact_key.to_string key) dir;
  Ok 0

let diff_keys ~root ~brief a b =
  let* dir_a = extract_to_view ~root a in
  let* dir_b = extract_to_view ~root b in
  let flags = if brief then [ "-r"; "-q" ] else [ "-r" ] in
  Ok (Host.run "diff" (flags @ [ dir_a; dir_b ]))

let diff ~root ~brief a b =
  let* a = resolve ~root a in
  let* b = resolve ~root b in
  diff_keys ~root ~brief a b

let baseline ~root =
  let file = Cache_layout.baseline_file ~root in
  if Sys.file_exists file then
    Cache_layout.baseline_of_contents (Host.read_file file)
  else Error "no baseline; set one with set-baseline"

let diff_baseline ~root ~brief =
  let* base = baseline ~root in
  let* key = tree_key () in
  if Sys.file_exists (Cache_layout.tarball ~root key) then
    diff_keys ~root ~brief base key
  else
    Error
      (Printf.sprintf "no artifact for the working tree (%s); run build first"
         (Artifact_key.to_string key))

let set_baseline ~root query ~note =
  let* key = resolve ~root query in
  match key with
  | Artifact_key.Dirty _ ->
      Error "a dirty-tree artifact cannot be the baseline: it is not a commit's"
  | Artifact_key.Clean _ ->
      let file = Cache_layout.baseline_file ~root in
      Host.mkdir_p (Filename.dirname file);
      Host.write_file file (Cache_layout.baseline_contents ~key ~note);
      Printf.printf "Baseline is %s\n" (Artifact_key.to_string key);
      Ok 0

let warnings ~root query =
  let* key = resolve ~root query in
  let file = Cache_layout.warnings ~root key in
  if Sys.file_exists file then begin
    print_string (Host.read_file file);
    Ok 0
  end
  else
    Error
      (Printf.sprintf "no warning report for %s" (Artifact_key.to_string key))

(* ---------- command line ---------- *)

open Cmdliner

let with_root f =
  let outcome =
    let* root = Cache_layout.default_root ~getenv:Sys.getenv_opt in
    let* top = git [ "rev-parse"; "--show-toplevel" ] in
    Sys.chdir top;
    f ~root
  in
  match outcome with
  | Ok code -> code
  | Error message ->
      prerr_endline ("doc_artifacts: " ^ message);
      2

let note_arg =
  Arg.(
    value & pos 0 string "" & info [] ~docv:"NOTE" ~doc:"A note for the index.")

let query_arg ~pos_index ~docv =
  Arg.(
    required
    & pos pos_index (some string) None
    & info [] ~docv
        ~doc:"An artifact: a key or its prefix, or a commit git can resolve.")

let brief_arg =
  Arg.(
    value & flag & info [ "brief"; "q" ] ~doc:"Only name the files that differ.")

let command name ~doc term = Cmd.v (Cmd.info name ~doc) term

let build_cmd =
  let force =
    Arg.(
      value & flag
      & info [ "force" ] ~doc:"Rebuild even when the artifact exists.")
  in
  command "build" ~doc:"Ensure an artifact for the working tree."
    Term.(
      const (fun force note -> with_root (build ~force ~note))
      $ force $ note_arg)

let list_cmd =
  command "list" ~doc:"Print the index of builds."
    Term.(const (fun () -> with_root list) $ const ())

let extract_cmd =
  let dir =
    Arg.(
      value
      & pos 1 (some string) None
      & info [] ~docv:"DIR"
          ~doc:"Where to extract; default view/<key> in the cache.")
  in
  command "extract" ~doc:"Extract an artifact for browsing."
    Term.(
      const (fun query dir -> with_root (fun ~root -> extract ~root query dir))
      $ query_arg ~pos_index:0 ~docv:"ARTIFACT"
      $ dir)

let diff_cmd =
  command "diff" ~doc:"diff -r two artifacts' HTML trees."
    Term.(
      const (fun brief a b -> with_root (fun ~root -> diff ~root ~brief a b))
      $ brief_arg
      $ query_arg ~pos_index:0 ~docv:"A"
      $ query_arg ~pos_index:1 ~docv:"B")

let diff_baseline_cmd =
  command "diff-baseline"
    ~doc:"diff -r the baseline against the working tree's artifact."
    Term.(const (fun brief -> with_root (diff_baseline ~brief)) $ brief_arg)

let set_baseline_cmd =
  let note =
    Arg.(
      value & pos 1 string "" & info [] ~docv:"NOTE" ~doc:"Why this baseline.")
  in
  command "set-baseline" ~doc:"Bless a clean-tree artifact as the baseline."
    Term.(
      const (fun query note ->
          with_root (fun ~root -> set_baseline ~root query ~note))
      $ query_arg ~pos_index:0 ~docv:"ARTIFACT"
      $ note)

let warnings_cmd =
  command "warnings" ~doc:"Print an artifact's odoc warning report."
    Term.(
      const (fun query -> with_root (fun ~root -> warnings ~root query))
      $ query_arg ~pos_index:0 ~docv:"ARTIFACT")

let () =
  let doc = "Local cache of rendered odoc HTML, one artifact per commit." in
  Cmd.group
    (Cmd.info "doc_artifacts" ~doc)
    [
      build_cmd;
      list_cmd;
      extract_cmd;
      diff_cmd;
      diff_baseline_cmd;
      set_baseline_cmd;
      warnings_cmd;
    ]
  |> Cmd.eval' |> exit
