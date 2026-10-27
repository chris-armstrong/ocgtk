(** Processes and files on the machine the driver runs on. *)

val run : ?log:string -> string -> string list -> int
(** Runs a program (looked up on [PATH]) and returns its exit code. Its standard
    output and error go to the file [log] when given (truncated first), else to
    the driver's own. *)

val capture : string -> string list -> (string, string) result
(** A program's standard output with surrounding whitespace trimmed; an error
    when it exits non-zero. *)

val mkdir_p : string -> unit
val read_file : string -> string
val write_file : string -> string -> unit
val append_file : string -> string -> unit

val count_files : suffix:string -> string -> int
(** Regular files under a directory, recursively, whose names end in [suffix].
*)

val is_empty_dir : string -> bool
(** True for a directory with no entries; false for anything else. *)

val now_utc : unit -> string
(** ISO 8601, e.g. [2026-10-27T03:04:05Z]. *)
