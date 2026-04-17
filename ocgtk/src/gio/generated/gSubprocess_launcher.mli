class type subprocess_launcher_t = object
  method close : unit -> unit
  method getenv : string -> string option
  method set_cwd : string -> unit
  method set_environ : string array -> unit
  method set_flags : Gio_enums.subprocessflags -> unit
  method set_stderr_file_path : string option -> unit
  method set_stdin_file_path : string option -> unit
  method set_stdout_file_path : string option -> unit
  method setenv : string -> string -> bool -> unit
  method spawnv : string array -> (GSubprocess.subprocess_t, GError.t) result
  method take_fd : int -> int -> unit
  method take_stderr_fd : int -> unit
  method take_stdin_fd : int -> unit
  method take_stdout_fd : int -> unit
  method unsetenv : string -> unit
  method as_subprocess_launcher : Subprocess_launcher.t
end

class subprocess_launcher : Subprocess_launcher.t -> subprocess_launcher_t

val new_ : Gio_enums.subprocessflags -> subprocess_launcher_t
