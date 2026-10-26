class type subprocess_launcher_t = object
  method close : unit -> unit
  method getenv : string -> string option
  method set_cwd : string -> unit
  method set_environ : string array -> unit
  method set_flags : Enums.subprocessflags -> unit
  method set_stderr_file_path : string option -> unit
  method set_stdin_file_path : string option -> unit
  method set_stdout_file_path : string option -> unit
  method setenv : string -> string -> bool -> unit
  method spawnv : string array -> (Subprocess.subprocess_t, GError.t) result
  method take_fd : int -> int -> unit
  method take_stderr_fd : int -> unit
  method take_stdin_fd : int -> unit
  method take_stdout_fd : int -> unit
  method unsetenv : string -> unit
  method as_subprocess_launcher : Raw.Subprocess_launcher.t
end

(* High-level class for SubprocessLauncher *)
class subprocess_launcher (obj : Raw.Subprocess_launcher.t) :
  subprocess_launcher_t =
  object (self)
    method close : unit -> unit = fun () -> Raw.Subprocess_launcher.close obj

    method getenv : string -> string option =
      fun variable -> Raw.Subprocess_launcher.getenv obj variable

    method set_cwd : string -> unit =
      fun cwd -> Raw.Subprocess_launcher.set_cwd obj cwd

    method set_environ : string array -> unit =
      fun env -> Raw.Subprocess_launcher.set_environ obj env

    method set_flags : Enums.subprocessflags -> unit =
      fun flags -> Raw.Subprocess_launcher.set_flags obj flags

    method set_stderr_file_path : string option -> unit =
      fun path -> Raw.Subprocess_launcher.set_stderr_file_path obj path

    method set_stdin_file_path : string option -> unit =
      fun path -> Raw.Subprocess_launcher.set_stdin_file_path obj path

    method set_stdout_file_path : string option -> unit =
      fun path -> Raw.Subprocess_launcher.set_stdout_file_path obj path

    method setenv : string -> string -> bool -> unit =
      fun variable value overwrite ->
        Raw.Subprocess_launcher.setenv obj variable value overwrite

    method spawnv : string array -> (Subprocess.subprocess_t, GError.t) result =
      fun argv ->
        Result.map
          (fun ret -> new Subprocess.subprocess ret)
          (Raw.Subprocess_launcher.spawnv obj argv)

    method take_fd : int -> int -> unit =
      fun source_fd target_fd ->
        Raw.Subprocess_launcher.take_fd obj source_fd target_fd

    method take_stderr_fd : int -> unit =
      fun fd -> Raw.Subprocess_launcher.take_stderr_fd obj fd

    method take_stdin_fd : int -> unit =
      fun fd -> Raw.Subprocess_launcher.take_stdin_fd obj fd

    method take_stdout_fd : int -> unit =
      fun fd -> Raw.Subprocess_launcher.take_stdout_fd obj fd

    method unsetenv : string -> unit =
      fun variable -> Raw.Subprocess_launcher.unsetenv obj variable

    method as_subprocess_launcher = obj
  end

let new_ (flags : Enums.subprocessflags) : subprocess_launcher_t =
  let obj_ = Raw.Subprocess_launcher.new_ flags in
  new subprocess_launcher obj_
