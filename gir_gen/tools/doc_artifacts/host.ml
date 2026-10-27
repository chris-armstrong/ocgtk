let wait pid =
  match snd (Unix.waitpid [] pid) with
  | Unix.WEXITED code -> code
  | Unix.WSIGNALED _ | Unix.WSTOPPED _ -> 255

let run ?log program args =
  let argv = Array.of_list (program :: args) in
  match log with
  | None ->
      wait (Unix.create_process program argv Unix.stdin Unix.stdout Unix.stderr)
  | Some path ->
      let fd =
        Unix.openfile path [ Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC ] 0o644
      in
      Fun.protect
        ~finally:(fun () -> Unix.close fd)
        (fun () -> wait (Unix.create_process program argv Unix.stdin fd fd))

let capture program args =
  let argv = Array.of_list (program :: args) in
  let ic = Unix.open_process_args_in program argv in
  let output = In_channel.input_all ic in
  match Unix.close_process_in ic with
  | Unix.WEXITED 0 -> Ok (String.trim output)
  | Unix.WEXITED _ | Unix.WSIGNALED _ | Unix.WSTOPPED _ ->
      Error (Printf.sprintf "%s failed" (String.concat " " (program :: args)))

let rec mkdir_p dir =
  if not (Sys.file_exists dir) then begin
    mkdir_p (Filename.dirname dir);
    Sys.mkdir dir 0o755
  end

let read_file path = In_channel.with_open_bin path In_channel.input_all

let write_file path contents =
  Out_channel.with_open_bin path (fun oc ->
      Out_channel.output_string oc contents)

let append_file path contents =
  Out_channel.with_open_gen
    [ Open_wronly; Open_creat; Open_append; Open_binary ] 0o644 path (fun oc ->
      Out_channel.output_string oc contents)

let rec count_files ~suffix dir =
  Sys.readdir dir |> Array.to_list
  |> List.fold_left
       (fun count name ->
         let path = Filename.concat dir name in
         if Sys.is_directory path then count + count_files ~suffix path
         else if String.ends_with ~suffix name then count + 1
         else count)
       0

let is_empty_dir dir =
  Sys.file_exists dir && Sys.is_directory dir
  && Array.length (Sys.readdir dir) = 0

let now_utc () =
  let t = Unix.gmtime (Unix.time ()) in
  Printf.sprintf "%04d-%02d-%02dT%02d:%02d:%02dZ" (t.tm_year + 1900)
    (t.tm_mon + 1) t.tm_mday t.tm_hour t.tm_min t.tm_sec
