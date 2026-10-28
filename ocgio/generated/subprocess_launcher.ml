class type subprocess_launcher_t = object
  method close : unit -> unit
  (** Closes all the file descriptors previously passed to the object with
      g_subprocess_launcher_take_fd(), g_subprocess_launcher_take_stderr_fd(),
      etc.

      After calling this method, any subsequent calls to
      g_subprocess_launcher_spawn() or g_subprocess_launcher_spawnv() will
      return [G_IO_ERROR_CLOSED]. This method is idempotent if called more than
      once.

      This function is called automatically when the [GSubprocessLauncher] is
      disposed, but is provided separately so that garbage collected language
      bindings can call it earlier to guarantee when FDs are closed. *)

  method getenv : string -> string option
  (** Returns the value of the environment variable [variable] in the
      environment of processes launched from this launcher.

      On UNIX, the returned string can be an arbitrary byte string. On Windows,
      it will be UTF-8. *)

  method set_cwd : string -> unit
  (** Sets the current working directory that processes will be launched with.

      By default processes are launched with the current working directory of
      the launching process at the time of launch. *)

  method set_environ : string array -> unit
  (** Replace the entire environment of processes launched from this launcher
      with the given 'environ' variable.

      Typically you will build this variable by using g_listenv() to copy the
      process 'environ' and using the functions g_environ_setenv(),
      g_environ_unsetenv(), etc.

      As an alternative, you can use g_subprocess_launcher_setenv(),
      g_subprocess_launcher_unsetenv(), etc.

      Pass an empty array to set an empty environment. Pass [NULL] to inherit
      the parent process’ environment. As of GLib 2.54, the parent process’
      environment will be copied when g_subprocess_launcher_set_environ() is
      called. Previously, it was copied when the subprocess was executed. This
      means the copied environment may now be modified (using
      g_subprocess_launcher_setenv(), etc.) before launching the subprocess.

      On UNIX, all strings in this array can be arbitrary byte strings. On
      Windows, they should be in UTF-8. *)

  method set_flags : Enums.subprocessflags -> unit
  (** Sets the flags on the launcher.

      The default flags are [G_SUBPROCESS_FLAGS_NONE].

      You may not set flags that specify conflicting options for how to handle a
      particular stdio stream (eg: specifying both
      [G_SUBPROCESS_FLAGS_STDIN_PIPE] and [G_SUBPROCESS_FLAGS_STDIN_INHERIT]).

      You may also not set a flag that conflicts with a previous call to a
      function like g_subprocess_launcher_set_stdin_file_path() or
      g_subprocess_launcher_take_stdout_fd(). *)

  method set_stderr_file_path : string option -> unit
  (** Sets the file path to use as the stderr for spawned processes.

      If [path] is [NULL] then any previously given path is unset.

      The file will be created or truncated when the process is spawned, as
      would be the case if using '2>' at the shell.

      If you want to send both stdout and stderr to the same file then use
      [G_SUBPROCESS_FLAGS_STDERR_MERGE].

      You may not set a stderr file path if a stderr fd is already set or if the
      launcher flags contain any flags directing stderr elsewhere.

      This feature is only available on UNIX. *)

  method set_stdin_file_path : string option -> unit
  (** Sets the file path to use as the stdin for spawned processes.

      If [path] is [NULL] then any previously given path is unset.

      The file must exist or spawning the process will fail.

      You may not set a stdin file path if a stdin fd is already set or if the
      launcher flags contain any flags directing stdin elsewhere.

      This feature is only available on UNIX. *)

  method set_stdout_file_path : string option -> unit
  (** Sets the file path to use as the stdout for spawned processes.

      If [path] is [NULL] then any previously given path is unset.

      The file will be created or truncated when the process is spawned, as
      would be the case if using '>' at the shell.

      You may not set a stdout file path if a stdout fd is already set or if the
      launcher flags contain any flags directing stdout elsewhere.

      This feature is only available on UNIX. *)

  method setenv : string -> string -> bool -> unit
  (** Sets the environment variable [variable] in the environment of processes
      launched from this launcher.

      On UNIX, both the variable's name and value can be arbitrary byte strings,
      except that the variable's name cannot contain '='. On Windows, they
      should be in UTF-8. *)

  method spawnv : string array -> (Subprocess.subprocess_t, GError.t) result
  (** Creates a [GSubprocess] given a provided array of arguments. *)

  method take_fd : int -> int -> unit
  (** Transfer an arbitrary file descriptor from parent process to the child.
      This function takes ownership of the [source_fd]; it will be closed in the
      parent when [self] is freed.

      By default, all file descriptors from the parent will be closed. This
      function allows you to create (for example) a custom [pipe()] or
      [socketpair()] before launching the process, and choose the target
      descriptor in the child.

      An example use case is GNUPG, which has a command line argument
      [--passphrase-fd] providing a file descriptor number where it expects the
      passphrase to be written. *)

  method take_stderr_fd : int -> unit
  (** Sets the file descriptor to use as the stderr for spawned processes.

      If [fd] is -1 then any previously given fd is unset.

      Note that the default behaviour is to pass stderr through to the stderr of
      the parent process.

      The passed [fd] belongs to the [GSubprocessLauncher]. It will be
      automatically closed when the launcher is finalized. The file descriptor
      will also be closed on the child side when executing the spawned process.

      You may not set a stderr fd if a stderr file path is already set or if the
      launcher flags contain any flags directing stderr elsewhere.

      This feature is only available on UNIX. *)

  method take_stdin_fd : int -> unit
  (** Sets the file descriptor to use as the stdin for spawned processes.

      If [fd] is -1 then any previously given fd is unset.

      Note that if your intention is to have the stdin of the calling process
      inherited by the child then [G_SUBPROCESS_FLAGS_STDIN_INHERIT] is a better
      way to go about doing that.

      The passed [fd] is noted but will not be touched in the current process.
      It is therefore necessary that it be kept open by the caller until the
      subprocess is spawned. The file descriptor will also not be explicitly
      closed on the child side, so it must be marked O_CLOEXEC if that's what
      you want.

      You may not set a stdin fd if a stdin file path is already set or if the
      launcher flags contain any flags directing stdin elsewhere.

      This feature is only available on UNIX. *)

  method take_stdout_fd : int -> unit
  (** Sets the file descriptor to use as the stdout for spawned processes.

      If [fd] is -1 then any previously given fd is unset.

      Note that the default behaviour is to pass stdout through to the stdout of
      the parent process.

      The passed [fd] is noted but will not be touched in the current process.
      It is therefore necessary that it be kept open by the caller until the
      subprocess is spawned. The file descriptor will also not be explicitly
      closed on the child side, so it must be marked O_CLOEXEC if that's what
      you want.

      You may not set a stdout fd if a stdout file path is already set or if the
      launcher flags contain any flags directing stdout elsewhere.

      This feature is only available on UNIX. *)

  method unsetenv : string -> unit
  (** Removes the environment variable [variable] from the environment of
      processes launched from this launcher.

      On UNIX, the variable's name can be an arbitrary byte string not
      containing '='. On Windows, it should be in UTF-8. *)

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
