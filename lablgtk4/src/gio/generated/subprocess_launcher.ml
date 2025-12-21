(* GENERATED CODE - DO NOT EDIT *)
(* SubprocessLauncher: SubprocessLauncher *)

type t = [`subprocess_launcher | `object_] Gobject.obj

(** Create a new SubprocessLauncher *)
external new_ : unit -> t = "ml_g_subprocess_launcher_new"

(* Methods *)
(** Sets the file descriptor to use as the stdout for spawned processes.

If @fd is -1 then any previously given fd is unset.

Note that the default behaviour is to pass stdout through to the
stdout of the parent process.

The passed @fd is noted but will not be touched in the current
process.  It is therefore necessary that it be kept open by the
caller until the subprocess is spawned.  The file descriptor will
also not be explicitly closed on the child side, so it must be marked
O_CLOEXEC if that's what you want.

You may not set a stdout fd if a stdout file path is already set or
if the launcher flags contain any flags directing stdout elsewhere.

This feature is only available on UNIX. *)
external take_stdout_fd : t -> int -> unit = "ml_g_subprocess_launcher_take_stdout_fd"

(** Sets the file descriptor to use as the stdin for spawned processes.

If @fd is -1 then any previously given fd is unset.

Note that if your intention is to have the stdin of the calling
process inherited by the child then %G_SUBPROCESS_FLAGS_STDIN_INHERIT
is a better way to go about doing that.

The passed @fd is noted but will not be touched in the current
process.  It is therefore necessary that it be kept open by the
caller until the subprocess is spawned.  The file descriptor will
also not be explicitly closed on the child side, so it must be marked
O_CLOEXEC if that's what you want.

You may not set a stdin fd if a stdin file path is already set or if
the launcher flags contain any flags directing stdin elsewhere.

This feature is only available on UNIX. *)
external take_stdin_fd : t -> int -> unit = "ml_g_subprocess_launcher_take_stdin_fd"

(** Sets the file descriptor to use as the stderr for spawned processes.

If @fd is -1 then any previously given fd is unset.

Note that the default behaviour is to pass stderr through to the
stderr of the parent process.

The passed @fd belongs to the #GSubprocessLauncher.  It will be
automatically closed when the launcher is finalized.  The file
descriptor will also be closed on the child side when executing the
spawned process.

You may not set a stderr fd if a stderr file path is already set or
if the launcher flags contain any flags directing stderr elsewhere.

This feature is only available on UNIX. *)
external take_stderr_fd : t -> int -> unit = "ml_g_subprocess_launcher_take_stderr_fd"

(** Transfer an arbitrary file descriptor from parent process to the
child.  This function takes ownership of the @source_fd; it will be closed
in the parent when @self is freed.

By default, all file descriptors from the parent will be closed.
This function allows you to create (for example) a custom `pipe()` or
`socketpair()` before launching the process, and choose the target
descriptor in the child.

An example use case is GNUPG, which has a command line argument
`--passphrase-fd` providing a file descriptor number where it expects
the passphrase to be written. *)
external take_fd : t -> int -> int -> unit = "ml_g_subprocess_launcher_take_fd"

(** Closes all the file descriptors previously passed to the object with
g_subprocess_launcher_take_fd(), g_subprocess_launcher_take_stderr_fd(), etc.

After calling this method, any subsequent calls to g_subprocess_launcher_spawn() or g_subprocess_launcher_spawnv() will
return %G_IO_ERROR_CLOSED. This method is idempotent if
called more than once.

This function is called automatically when the #GSubprocessLauncher
is disposed, but is provided separately so that garbage collected
language bindings can call it earlier to guarantee when FDs are closed. *)
external close : t -> unit = "ml_g_subprocess_launcher_close"

(* Properties *)

