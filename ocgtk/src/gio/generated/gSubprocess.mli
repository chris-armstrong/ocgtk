class subprocess : Subprocess.t ->
  object
    method force_exit : unit -> unit
    method get_exit_status : unit -> int
    method get_identifier : unit -> string option
    method get_if_exited : unit -> bool
    method get_if_signaled : unit -> bool
    method get_status : unit -> int
    method get_stderr_pipe : unit -> GInput_stream.input_stream option
    method get_stdin_pipe : unit -> GOutput_stream.output_stream option
    method get_stdout_pipe : unit -> GInput_stream.input_stream option
    method get_successful : unit -> bool
    method get_term_sig : unit -> int
    method send_signal : int -> unit
    method wait : #GCancellable.cancellable option -> (bool, GError.t) result
    method wait_check : #GCancellable.cancellable option -> (bool, GError.t) result
    method argv : string array
    method flags : Gio_enums.subprocessflags
    method as_subprocess : Subprocess.t
  end

