(* Diffs the rendered odoc HTML of a base commit against the working tree.
   See README.md. *)

let ( let* ) = Result.bind

(* Both trees are built and compared in dune's default build context, the
   only one this repository defines. A workspace that adds contexts would
   need this to name the one to compare. *)
let build_context = "default"

let html_dir build_dir =
  List.fold_left Filename.concat build_dir [ build_context; "_doc"; "_html" ]

let wait pid =
  match snd (Unix.waitpid [] pid) with
  | Unix.WEXITED code -> code
  | Unix.WSIGNALED _ | Unix.WSTOPPED _ -> 255

(* Build output goes to stderr so stdout carries only the diff. *)
let run ?(stdout = Unix.stdout) program args =
  let argv = Array.of_list (program :: args) in
  wait (Unix.create_process program argv Unix.stdin stdout Unix.stderr)

let spawn program args =
  let argv = Array.of_list (program :: args) in
  Unix.create_process program argv Unix.stdin Unix.stderr Unix.stderr

let checked program args = function
  | 0 -> Ok ()
  | code ->
      Error
        (Printf.sprintf "%s exited with %d"
           (String.concat " " (program :: args))
           code)

let run_checked program args = checked program args (wait (spawn program args))

let capture program args =
  let ic =
    Unix.open_process_args_in program (Array.of_list (program :: args))
  in
  let output = In_channel.input_all ic in
  match Unix.close_process_in ic with
  | Unix.WEXITED 0 -> Ok (String.trim output)
  | Unix.WEXITED _ | Unix.WSIGNALED _ | Unix.WSTOPPED _ ->
      Error (Printf.sprintf "%s failed" (String.concat " " (program :: args)))

let build_docs_args ~root ~build_dir =
  [ "build"; "--root"; root; "--build-dir"; build_dir; "@doc" ]

(* The two builds share nothing but dune's cache, which is safe to use
   concurrently, so they run side by side. Both are waited for before either
   result is looked at, so no build outlives the worktree it reads. *)
let build_docs_in_parallel builds =
  let started =
    List.map
      (fun (root, build_dir) ->
        let args = build_docs_args ~root ~build_dir in
        (args, spawn "dune" args))
      builds
  in
  let codes = List.map (fun (args, pid) -> (args, wait pid)) started in
  List.fold_left
    (fun acc (args, code) ->
      let* () = acc in
      checked "dune" args code)
    (Ok ()) codes

(* Both builds live in a git worktree, so the only directory removed
   afterwards is one git registered as that worktree, inside a temporary
   directory this run created. *)
let with_worktree ~sha f =
  let parent = Filename.temp_dir "ocgtk-doc-diff" "" in
  let worktree = Filename.concat parent "base" in
  let remove () =
    match run_checked "git" [ "worktree"; "remove"; "--force"; worktree ] with
    | Ok () -> Sys.rmdir parent
    | Error message ->
        prerr_endline ("doc_diff: left " ^ worktree ^ " in place: " ^ message)
  in
  match run_checked "git" [ "worktree"; "add"; "--detach"; worktree; sha ] with
  | Error _ as error ->
      Sys.rmdir parent;
      error
  | Ok () -> Fun.protect ~finally:remove (fun () -> f worktree)

let doc_diff ~brief base =
  let* top = capture "git" [ "rev-parse"; "--show-toplevel" ] in
  let* sha = capture "git" [ "rev-parse"; "--verify"; base ^ "^{commit}" ] in
  with_worktree ~sha @@ fun worktree ->
  let base_build = Filename.concat worktree "_build" in
  (* Not the working tree's own _build: dune leaves the HTML of deleted
     modules there, which would show up as differences. Dune skips
     directories starting with an underscore, so the base build ignores it. *)
  let current_build = Filename.concat worktree "_build_current" in
  let* () =
    build_docs_in_parallel [ (worktree, base_build); (top, current_build) ]
  in
  let flags = if brief then [ "-r"; "-q" ] else [ "-r" ] in
  Ok (run "diff" (flags @ [ html_dir base_build; html_dir current_build ]))

open Cmdliner

let base_arg =
  Arg.(
    value & pos 0 string "origin/m3"
    & info [] ~docv:"BASE" ~doc:"The commit to compare against.")

let brief_arg =
  Arg.(
    value & flag & info [ "brief"; "q" ] ~doc:"Only name the files that differ.")

let main brief base =
  match doc_diff ~brief base with
  | Ok code -> code
  | Error message ->
      prerr_endline ("doc_diff: " ^ message);
      2

let () =
  let doc = "diff -r the rendered odoc HTML of BASE and the working tree." in
  Cmd.v (Cmd.info "doc_diff" ~doc) Term.(const main $ brief_arg $ base_arg)
  |> Cmd.eval' |> exit
