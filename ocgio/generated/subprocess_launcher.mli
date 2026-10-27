(** This class contains a set of options for launching child processes, such as
    where its standard input and output will be directed, the argument list, the
    environment, and more.

    While the [Gio.Subprocess] class has high level functions covering popular
    cases, use of this class allows access to more advanced options. It can also
    be used to launch multiple subprocesses with a similar configuration.

    Its methods, signals and properties are on
    {!class-type-subprocess_launcher_t}. The functions it is built on are in
    {!Ocgio.Raw.Subprocess_launcher}. *)

(** The methods, signals and properties of a [GSubprocessLauncher]. *)
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

class subprocess_launcher : Raw.Subprocess_launcher.t -> subprocess_launcher_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Subprocess_launcher.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GSubprocessLauncher], give one already wrapped. *)

val new_ : Enums.subprocessflags -> subprocess_launcher_t
