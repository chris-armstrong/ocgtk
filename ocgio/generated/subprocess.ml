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

(* High-level class for Subprocess *)
class subprocess (obj : Raw.Subprocess.t) : subprocess_t =
  object (self)
    inherit Initable.initable (Raw.Initable.from_gobject obj)
    method force_exit : unit -> unit = fun () -> Raw.Subprocess.force_exit obj

    method get_exit_status : unit -> int =
      fun () -> Raw.Subprocess.get_exit_status obj

    method get_identifier : unit -> string option =
      fun () -> Raw.Subprocess.get_identifier obj

    method get_if_exited : unit -> bool =
      fun () -> Raw.Subprocess.get_if_exited obj

    method get_if_signaled : unit -> bool =
      fun () -> Raw.Subprocess.get_if_signaled obj

    method get_status : unit -> int = fun () -> Raw.Subprocess.get_status obj

    method get_stderr_pipe : unit -> Input_stream.input_stream_t option =
      fun () ->
        Option.map
          (fun ret -> new Input_stream.input_stream ret)
          (Raw.Subprocess.get_stderr_pipe obj)

    method get_stdin_pipe : unit -> Output_stream.output_stream_t option =
      fun () ->
        Option.map
          (fun ret -> new Output_stream.output_stream ret)
          (Raw.Subprocess.get_stdin_pipe obj)

    method get_stdout_pipe : unit -> Input_stream.input_stream_t option =
      fun () ->
        Option.map
          (fun ret -> new Input_stream.input_stream ret)
          (Raw.Subprocess.get_stdout_pipe obj)

    method get_successful : unit -> bool =
      fun () -> Raw.Subprocess.get_successful obj

    method get_term_sig : unit -> int =
      fun () -> Raw.Subprocess.get_term_sig obj

    method send_signal : int -> unit =
      fun signal_num -> Raw.Subprocess.send_signal obj signal_num

    method wait : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Subprocess.wait obj cancellable

    method wait_check :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Subprocess.wait_check obj cancellable

    method wait_check_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Subprocess.wait_check_finish obj result

    method wait_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Subprocess.wait_finish obj result

    method as_subprocess = obj
  end

let newv (argv : string array) (flags : Enums.subprocessflags) :
    (subprocess_t, GError.t) result =
  let obj_ = Raw.Subprocess.newv argv flags in
  Result.map (fun obj_ -> new subprocess obj_) obj_
