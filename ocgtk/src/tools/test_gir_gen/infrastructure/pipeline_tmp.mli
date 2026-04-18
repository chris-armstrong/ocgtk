(** Per-test temp directory for pipeline tests.

    Pipeline tests (tier 2 in the test classification — see Phase 1.5 of
    [docs/plans/test-suite-remediation.md]) must use this module rather than
    [Filename.temp_file] or hard-coded [/tmp] paths. *)

val make_dir : string -> string
(** [make_dir test_name] creates [pipeline_tmp/<test_name>/] (relative to the
    current working directory, which under [dune runtest] is inside the build
    tree) if it does not already exist, and returns the path. Idempotent. *)

val write_file : test_name:string -> filename:string -> string -> string
(** [write_file ~test_name ~filename content] creates
    [pipeline_tmp/<test_name>/] if needed, writes [content] to
    [<dir>/<filename>], and returns the full path. *)
