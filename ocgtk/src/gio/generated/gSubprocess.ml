(* High-level class for Subprocess *)
class subprocess (obj : Subprocess.t) = object (self)

  method force_exit : unit -> unit =
    fun () ->
      (Subprocess.force_exit obj)

  method get_exit_status : unit -> int =
    fun () ->
      (Subprocess.get_exit_status obj)

  method get_identifier : unit -> string option =
    fun () ->
      (Subprocess.get_identifier obj)

  method get_if_exited : unit -> bool =
    fun () ->
      (Subprocess.get_if_exited obj)

  method get_if_signaled : unit -> bool =
    fun () ->
      (Subprocess.get_if_signaled obj)

  method get_status : unit -> int =
    fun () ->
      (Subprocess.get_status obj)

  method get_stderr_pipe : unit -> GInput_stream.input_stream option =
    fun () ->
      Option.map (fun ret -> new GInput_stream.input_stream ret) (Subprocess.get_stderr_pipe obj)

  method get_stdin_pipe : unit -> GOutput_stream.output_stream option =
    fun () ->
      Option.map (fun ret -> new GOutput_stream.output_stream ret) (Subprocess.get_stdin_pipe obj)

  method get_stdout_pipe : unit -> GInput_stream.input_stream option =
    fun () ->
      Option.map (fun ret -> new GInput_stream.input_stream ret) (Subprocess.get_stdout_pipe obj)

  method get_successful : unit -> bool =
    fun () ->
      (Subprocess.get_successful obj)

  method get_term_sig : unit -> int =
    fun () ->
      (Subprocess.get_term_sig obj)

  method send_signal : int -> unit =
    fun signal_num ->
      (Subprocess.send_signal obj signal_num)

  method wait : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Subprocess.wait obj cancellable)

  method wait_check : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Subprocess.wait_check obj cancellable)

  method flags = Subprocess.get_flags obj

    method as_subprocess = obj
end

