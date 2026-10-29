(** [GSubprocess] allows the creation of and interaction with child processes.

    Its methods, signals and properties are on {!class-type-subprocess_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Subprocess}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Subprocess].}

    Implements:
    - {{!Ocgio.Initable.class-type-initable_t}Ocgio.Initable}

    [GSubprocess] allows the creation of and interaction with child processes.

    Processes can be communicated with using standard GIO-style APIs (ie:
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]},
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]}).
    There are GIO-style APIs to wait for process termination (ie: cancellable
    and with an asynchronous variant).

    There is an API to force a process to terminate, as well as a race-free API
    for sending UNIX signals to a subprocess.

    One major advantage that GIO brings over the core GLib library is
    comprehensive API for asynchronous I/O, such
    [Gio.OutputStream.splice_async]. This makes [GSubprocess] significantly more
    powerful and flexible than equivalent APIs in some other languages such as
    the [subprocess.py] included with Python. For example, using [GSubprocess]
    one could create two child processes, reading standard output from the
    first, processing it, and writing to the input stream of the second, all
    without blocking the main loop.

    A powerful [Gio.Subprocess.communicate] API is provided similar to the
    [communicate()] method of [subprocess.py]. This enables very easy
    interaction with a subprocess that has been opened with pipes.

    [GSubprocess] defaults to tight control over the file descriptors open in
    the child process, avoiding dangling-FD issues that are caused by a simple
    [fork()]/[exec()]. The only open file descriptors in the spawned process are
    ones that were explicitly specified by the [GSubprocess] API (unless
    [G_SUBPROCESS_FLAGS_INHERIT_FDS] was specified).

    [GSubprocess] will quickly reap all child processes as they exit, avoiding
    ‘zombie processes’ remaining around for long periods of time.
    {{!Ocgio.Subprocess.class-type-subprocess_t.method-wait}[Gio.Subprocess.wait]}
    can be used to wait for this to happen, but it will happen even without the
    call being explicitly made.

    As a matter of principle, [GSubprocess] has no API that accepts shell-style
    space-separated strings. It will, however, match the typical shell behaviour
    of searching the [PATH] for executables that do not contain a directory
    separator in their name. By default, the [PATH] of the current process is
    used. You can specify [G_SUBPROCESS_FLAGS_SEARCH_PATH_FROM_ENVP] to use the
    [PATH] of the launcher environment instead.

    [GSubprocess] attempts to have a very simple API for most uses (ie: spawning
    a subprocess with arguments and support for most typical kinds of input and
    output redirection). See [Gio.Subprocess.new]. The
    {{!Ocgio.Subprocess_launcher.class-type-subprocess_launcher_t}[Gio.SubprocessLauncher]}
    API is provided for more complicated cases (advanced types of redirection,
    environment variable manipulation, change of working directory, child setup
    functions, etc).

    A typical use of [GSubprocess] will involve calling [Gio.Subprocess.new],
    followed by [Gio.Subprocess.wait_async] or
    {{!Ocgio.Subprocess.class-type-subprocess_t.method-wait}[Gio.Subprocess.wait]}.
    After the process exits, the status can be checked using functions such as
    {{!Ocgio.Subprocess.class-type-subprocess_t.method-get_if_exited}[Gio.Subprocess.get_if_exited]}
    (which are similar to the familiar [WIFEXITED]-style POSIX macros).

    Note that as of GLib 2.82, creating a [GSubprocess] causes the signal
    [SIGPIPE] to be ignored for the remainder of the program. If you are writing
    a command-line utility that uses [GSubprocess], you may need to take into
    account the fact that your program will not automatically be killed if it
    tries to write to [stdout] after it has been closed. *)
class type subprocess_t = object
  inherit Initable.initable_t

  (** {2:methods Methods} *)

  method force_exit : unit -> unit
  (** Use an operating-system specific method to attempt an immediate, forceful
      termination of the process. There is no mechanism to determine whether or
      not the request itself was successful; however, you can use
      g_subprocess_wait() to monitor the status of the process after calling
      this function.

      On Unix, this function sends [SIGKILL]. *)

  method get_exit_status : unit -> int
  (** Check the exit status of the subprocess, given that it exited normally.
      This is the value passed to the exit() system call or the return value
      from main.

      This is equivalent to the system WEXITSTATUS macro.

      It is an error to call this function before g_subprocess_wait() and unless
      g_subprocess_get_if_exited() returned [true]. *)

  method get_identifier : unit -> string option
  (** On UNIX, returns the process ID as a decimal string. On Windows, returns
      the result of GetProcessId() also as a string. If the subprocess has
      terminated, this will return [None]. *)

  method get_if_exited : unit -> bool
  (** Check if the given subprocess exited normally (ie: by way of exit() or
      return from main()).

      This is equivalent to the system WIFEXITED macro.

      It is an error to call this function before g_subprocess_wait() has
      returned. *)

  method get_if_signaled : unit -> bool
  (** Check if the given subprocess terminated in response to a signal.

      This is equivalent to the system WIFSIGNALED macro.

      It is an error to call this function before g_subprocess_wait() has
      returned. *)

  method get_status : unit -> int
  (** Gets the raw status code of the process, as from waitpid().

      This value has no particular meaning, but it can be used with the macros
      defined by the system headers such as WIFEXITED. It can also be used with
      g_spawn_check_wait_status().

      It is more likely that you want to use g_subprocess_get_if_exited()
      followed by g_subprocess_get_exit_status().

      It is an error to call this function before g_subprocess_wait() has
      returned. *)

  method get_stderr_pipe : unit -> Input_stream.input_stream_t option
  (** Gets the [GInputStream] from which to read the stderr output of
      [subprocess].

      The process must have been created with [G_SUBPROCESS_FLAGS_STDERR_PIPE],
      otherwise [None] will be returned. *)

  method get_stdin_pipe : unit -> Output_stream.output_stream_t option
  (** Gets the [GOutputStream] that you can write to in order to give data to
      the stdin of [subprocess].

      The process must have been created with [G_SUBPROCESS_FLAGS_STDIN_PIPE]
      and not [G_SUBPROCESS_FLAGS_STDIN_INHERIT], otherwise [None] will be
      returned. *)

  method get_stdout_pipe : unit -> Input_stream.input_stream_t option
  (** Gets the [GInputStream] from which to read the stdout output of
      [subprocess].

      The process must have been created with [G_SUBPROCESS_FLAGS_STDOUT_PIPE],
      otherwise [None] will be returned. *)

  method get_successful : unit -> bool
  [@@ocaml.doc
    "Checks if the process was \"successful\".  A process is considered\n\
     successful if it exited cleanly with an exit status of 0, either by\n\
     way of the exit() system call or return from main().\n\n\
     It is an error to call this function before g_subprocess_wait() has\n\
     returned."]

  method get_term_sig : unit -> int
  (** Get the signal number that caused the subprocess to terminate, given that
      it terminated due to a signal.

      This is equivalent to the system WTERMSIG macro.

      It is an error to call this function before g_subprocess_wait() and unless
      g_subprocess_get_if_signaled() returned [true]. *)

  method send_signal : int -> unit
  (** Sends the UNIX signal [signal_num] to the subprocess, if it is still
      running.

      This API is race-free. If the subprocess has terminated, it will not be
      signalled.

      This API is not available on Windows. *)

  method wait : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Synchronously wait for the subprocess to terminate.

      After the process terminates you can query its exit status with functions
      such as g_subprocess_get_if_exited() and g_subprocess_get_exit_status().

      This function does not fail in the case of the subprocess having abnormal
      termination. See g_subprocess_wait_check() for that.

      Cancelling [cancellable] doesn't kill the subprocess. Call
      g_subprocess_force_exit() if it is desirable. *)

  method wait_check :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Combines g_subprocess_wait() with g_spawn_check_wait_status(). *)

  method wait_check_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Collects the result of a previous call to g_subprocess_wait_check_async().
  *)

  method wait_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Collects the result of a previous call to g_subprocess_wait_async(). *)

  (** {2:conversions Conversions} *)

  method as_subprocess : Raw.Subprocess.t
end

class subprocess : Raw.Subprocess.t -> subprocess_t
(** Wraps a raw handle of {!Ocgio.Raw.Subprocess.t}. *)

(** {1:description Description}

    [GSubprocess] allows the creation of and interaction with child processes.

    Processes can be communicated with using standard GIO-style APIs (ie:
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]},
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]}).
    There are GIO-style APIs to wait for process termination (ie: cancellable
    and with an asynchronous variant).

    There is an API to force a process to terminate, as well as a race-free API
    for sending UNIX signals to a subprocess.

    One major advantage that GIO brings over the core GLib library is
    comprehensive API for asynchronous I/O, such
    [Gio.OutputStream.splice_async]. This makes [GSubprocess] significantly more
    powerful and flexible than equivalent APIs in some other languages such as
    the [subprocess.py] included with Python. For example, using [GSubprocess]
    one could create two child processes, reading standard output from the
    first, processing it, and writing to the input stream of the second, all
    without blocking the main loop.

    A powerful [Gio.Subprocess.communicate] API is provided similar to the
    [communicate()] method of [subprocess.py]. This enables very easy
    interaction with a subprocess that has been opened with pipes.

    [GSubprocess] defaults to tight control over the file descriptors open in
    the child process, avoiding dangling-FD issues that are caused by a simple
    [fork()]/[exec()]. The only open file descriptors in the spawned process are
    ones that were explicitly specified by the [GSubprocess] API (unless
    [G_SUBPROCESS_FLAGS_INHERIT_FDS] was specified).

    [GSubprocess] will quickly reap all child processes as they exit, avoiding
    ‘zombie processes’ remaining around for long periods of time.
    {{!Ocgio.Subprocess.class-type-subprocess_t.method-wait}[Gio.Subprocess.wait]}
    can be used to wait for this to happen, but it will happen even without the
    call being explicitly made.

    As a matter of principle, [GSubprocess] has no API that accepts shell-style
    space-separated strings. It will, however, match the typical shell behaviour
    of searching the [PATH] for executables that do not contain a directory
    separator in their name. By default, the [PATH] of the current process is
    used. You can specify [G_SUBPROCESS_FLAGS_SEARCH_PATH_FROM_ENVP] to use the
    [PATH] of the launcher environment instead.

    [GSubprocess] attempts to have a very simple API for most uses (ie: spawning
    a subprocess with arguments and support for most typical kinds of input and
    output redirection). See [Gio.Subprocess.new]. The
    {{!Ocgio.Subprocess_launcher.class-type-subprocess_launcher_t}[Gio.SubprocessLauncher]}
    API is provided for more complicated cases (advanced types of redirection,
    environment variable manipulation, change of working directory, child setup
    functions, etc).

    A typical use of [GSubprocess] will involve calling [Gio.Subprocess.new],
    followed by [Gio.Subprocess.wait_async] or
    {{!Ocgio.Subprocess.class-type-subprocess_t.method-wait}[Gio.Subprocess.wait]}.
    After the process exits, the status can be checked using functions such as
    {{!Ocgio.Subprocess.class-type-subprocess_t.method-get_if_exited}[Gio.Subprocess.get_if_exited]}
    (which are similar to the familiar [WIFEXITED]-style POSIX macros).

    Note that as of GLib 2.82, creating a [GSubprocess] causes the signal
    [SIGPIPE] to be ignored for the remainder of the program. If you are writing
    a command-line utility that uses [GSubprocess], you may need to take into
    account the fact that your program will not automatically be killed if it
    tries to write to [stdout] after it has been closed. *)

(** {1:constructors Constructors} *)

val newv :
  string array -> Enums.subprocessflags -> (subprocess_t, GError.t) result
(** Create a new process with the given flags and argument list.

    The argument list is expected to be null-terminated. *)
