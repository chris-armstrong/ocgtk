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

val newv :
  string array -> Enums.subprocessflags -> (subprocess_t, GError.t) result
