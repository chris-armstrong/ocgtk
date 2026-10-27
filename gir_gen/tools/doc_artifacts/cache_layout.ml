let dir_name = "ocgtk-doc-artifacts"

let non_empty getenv name =
  match getenv name with Some "" | None -> None | Some v -> Some v

let default_root ~getenv =
  match non_empty getenv "OCGTK_DOC_ARTIFACTS" with
  | Some root -> Ok root
  | None -> (
      match (non_empty getenv "XDG_CACHE_HOME", non_empty getenv "HOME") with
      | Some cache, _ -> Ok (Filename.concat cache dir_name)
      | None, Some home ->
          Ok (Filename.concat (Filename.concat home ".cache") dir_name)
      | None, None ->
          Error "set OCGTK_DOC_ARTIFACTS, XDG_CACHE_HOME or HOME for the cache")

let artifacts_dir ~root = Filename.concat root "artifacts"

let artifact_file ~root key suffix =
  Filename.concat (artifacts_dir ~root) (Artifact_key.to_string key ^ suffix)

let tarball_suffix = ".tar.gz"
let tarball ~root key = artifact_file ~root key tarball_suffix
let manifest ~root key = artifact_file ~root key ".json"
let warnings ~root key = artifact_file ~root key ".warnings"
let build_log ~root key ~step = artifact_file ~root key ("." ^ step ^ ".log")
let build_dir ~root = Filename.concat root "build"

let html_dir ~root =
  List.fold_left Filename.concat (build_dir ~root)
    [ "default"; "_doc"; "_html" ]

let view_dir ~root key =
  Filename.concat (Filename.concat root "view") (Artifact_key.to_string key)

let baseline_file ~root =
  Filename.concat (Filename.concat root "benchmarks") "BASELINE"

let index_file ~root = Filename.concat root "index.tsv"

let key_of_tarball_name name =
  if String.ends_with ~suffix:tarball_suffix name then
    Some (String.sub name 0 (String.length name - String.length tarball_suffix))
  else None

let one_line s = String.map (function '\t' | '\n' | '\r' -> ' ' | c -> c) s

let index_line ~key ~date ~branch ~note =
  String.concat "\t"
    [ Artifact_key.to_string key; date; one_line branch; one_line note ]
  ^ "\n"

let baseline_contents ~key ~note =
  Artifact_key.to_string key ^ " " ^ one_line note ^ "\n"

let baseline_of_contents contents =
  let first_line =
    match String.split_on_char '\n' contents with line :: _ -> line | [] -> ""
  in
  match String.split_on_char ' ' (String.trim first_line) with
  | key :: _ when not (String.equal key "") -> Artifact_key.of_string key
  | _ :: _ | [] -> Error "BASELINE is empty"
