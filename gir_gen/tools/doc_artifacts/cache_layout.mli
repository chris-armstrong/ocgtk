(** Where the cache keeps each file, and the formats of its plain-text files.

    {v
    <root>/
      artifacts/<key>.tar.gz      gzipped tar of _build/default/_doc/_html
      artifacts/<key>.json        manifest
      artifacts/<key>.warnings    odoc warning report
      artifacts/<key>.<step>.log  output of the regenerate and doc steps
      benchmarks/BASELINE         blessed sha and a note
      view/<key>/                 extracted trees
      build/                      dune build directory for the doc build
      index.tsv                   one line per build: key, date, branch, note
    v} *)

val default_root : getenv:(string -> string option) -> (string, string) result
(** [$OCGTK_DOC_ARTIFACTS], else [$XDG_CACHE_HOME/ocgtk-doc-artifacts], else
    [$HOME/.cache/ocgtk-doc-artifacts]. *)

val artifacts_dir : root:string -> string
val tarball : root:string -> Artifact_key.t -> string
val manifest : root:string -> Artifact_key.t -> string
val warnings : root:string -> Artifact_key.t -> string

val build_log : root:string -> Artifact_key.t -> step:string -> string
(** [artifacts/<key>.<step>.log]: the output of one build step. *)

val build_dir : root:string -> string

val html_dir : root:string -> string
(** The rendered HTML in {!build_dir}. *)

val view_dir : root:string -> Artifact_key.t -> string
val baseline_file : root:string -> string
val index_file : root:string -> string

val key_of_tarball_name : string -> string option
(** The key stem of an [artifacts/] file name ending in [.tar.gz]. *)

val index_line :
  key:Artifact_key.t -> date:string -> branch:string -> note:string -> string
(** Tab-separated, newline-terminated; tabs and newlines in [branch] and [note]
    become spaces. *)

val baseline_contents : key:Artifact_key.t -> note:string -> string

val baseline_of_contents : string -> (Artifact_key.t, string) result
(** The key at the start of [BASELINE]'s first line. *)
