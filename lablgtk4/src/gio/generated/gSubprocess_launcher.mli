class subprocess_launcher : Subprocess_launcher.t ->
  object
    method close : unit -> unit
    method take_fd : int -> int -> unit
    method take_stderr_fd : int -> unit
    method take_stdin_fd : int -> unit
    method take_stdout_fd : int -> unit
    method as_subprocess_launcher : Subprocess_launcher.t
  end

