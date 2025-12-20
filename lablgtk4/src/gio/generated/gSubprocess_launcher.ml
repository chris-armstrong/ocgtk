(* High-level class for SubprocessLauncher *)
class subprocess_launcher (obj : Subprocess_launcher.t) = object (self)

  method close : unit -> unit =
    fun () ->
      (Subprocess_launcher.close obj)

  method take_fd : int -> int -> unit =
    fun source_fd target_fd ->
      (Subprocess_launcher.take_fd obj source_fd target_fd)

  method take_stderr_fd : int -> unit =
    fun fd ->
      (Subprocess_launcher.take_stderr_fd obj fd)

  method take_stdin_fd : int -> unit =
    fun fd ->
      (Subprocess_launcher.take_stdin_fd obj fd)

  method take_stdout_fd : int -> unit =
    fun fd ->
      (Subprocess_launcher.take_stdout_fd obj fd)

    method as_subprocess_launcher = obj
end

