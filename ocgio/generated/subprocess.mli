(** [GSubprocess] allows the creation of and interaction with child processes.

    Processes can be communicated with using standard GIO-style APIs (ie:
    [Gio.InputStream], [Gio.OutputStream]). There are GIO-style APIs to wait for
    process termination (ie: cancellable and with an asynchronous variant).

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
    [Gio.Subprocess.wait] can be used to wait for this to happen, but it will
    happen even without the call being explicitly made.

    As a matter of principle, [GSubprocess] has no API that accepts shell-style
    space-separated strings. It will, however, match the typical shell behaviour
    of searching the [PATH] for executables that do not contain a directory
    separator in their name. By default, the [PATH] of the current process is
    used. You can specify [G_SUBPROCESS_FLAGS_SEARCH_PATH_FROM_ENVP] to use the
    [PATH] of the launcher environment instead.

    [GSubprocess] attempts to have a very simple API for most uses (ie: spawning
    a subprocess with arguments and support for most typical kinds of input and
    output redirection). See [Gio.Subprocess.new]. The [Gio.SubprocessLauncher]
    API is provided for more complicated cases (advanced types of redirection,
    environment variable manipulation, change of working directory, child setup
    functions, etc).

    A typical use of [GSubprocess] will involve calling [Gio.Subprocess.new],
    followed by [Gio.Subprocess.wait_async] or [Gio.Subprocess.wait]. After the
    process exits, the status can be checked using functions such as
    [Gio.Subprocess.get_if_exited] (which are similar to the familiar
    [WIFEXITED]-style POSIX macros).

    Note that as of GLib 2.82, creating a [GSubprocess] causes the signal
    [SIGPIPE] to be ignored for the remainder of the program. If you are writing
    a command-line utility that uses [GSubprocess], you may need to take into
    account the fact that your program will not automatically be killed if it
    tries to write to [stdout] after it has been closed.

    Its methods, signals and properties are on {!class-type-subprocess_t}. The
    functions it is built on are in {!Ocgio.Raw.Subprocess}. *)

(** The methods, signals and properties of a [GSubprocess]. *)
class type subprocess_t = object
  inherit Initable.initable_t
  method force_exit : unit -> unit
  method get_exit_status : unit -> int
  method get_identifier : unit -> string option
  method get_if_exited : unit -> bool
  method get_if_signaled : unit -> bool
  method get_status : unit -> int
  method get_stderr_pipe : unit -> Input_stream.input_stream_t option
  method get_stdin_pipe : unit -> Output_stream.output_stream_t option
  method get_stdout_pipe : unit -> Input_stream.input_stream_t option
  method get_successful : unit -> bool
  method get_term_sig : unit -> int
  method send_signal : int -> unit
  method wait : Cancellable.cancellable_t option -> (bool, GError.t) result

  method wait_check :
    Cancellable.cancellable_t option -> (bool, GError.t) result

  method wait_check_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method wait_finish : Async_result.async_result_t -> (bool, GError.t) result
  method as_subprocess : Raw.Subprocess.t
end

class subprocess : Raw.Subprocess.t -> subprocess_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Subprocess.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GSubprocess], give one already wrapped. *)

val newv :
  string array -> Enums.subprocessflags -> (subprocess_t, GError.t) result
