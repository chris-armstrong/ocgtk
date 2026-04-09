class type subprocess_t = object
    inherit GInitable.initable_t
    method force_exit : unit -> unit
    method get_exit_status : unit -> int
    method get_identifier : unit -> string option
    method get_if_exited : unit -> bool
    method get_if_signaled : unit -> bool
    method get_status : unit -> int
    method get_stderr_pipe : unit -> GInput_stream.input_stream_t option
    method get_stdin_pipe : unit -> GOutput_stream.output_stream_t option
    method get_stdout_pipe : unit -> GInput_stream.input_stream_t option
    method get_successful : unit -> bool
    method get_term_sig : unit -> int
    method send_signal : int -> unit
    method wait : GCancellable.cancellable_t option -> (bool, GError.t) result
    method wait_check : GCancellable.cancellable_t option -> (bool, GError.t) result
    method as_subprocess : Subprocess.t
end

(* High-level class for Subprocess *)
class subprocess (obj : Subprocess.t) : subprocess_t = object (self)
  inherit GInitable.initable (Initable.from_gobject obj)

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

  method get_stderr_pipe : unit -> GInput_stream.input_stream_t option =
    fun () ->
      Option.map (fun ret -> new GInput_stream.input_stream ret) (Subprocess.get_stderr_pipe obj)

  method get_stdin_pipe : unit -> GOutput_stream.output_stream_t option =
    fun () ->
      Option.map (fun ret -> new GOutput_stream.output_stream ret) (Subprocess.get_stdin_pipe obj)

  method get_stdout_pipe : unit -> GInput_stream.input_stream_t option =
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

  method wait : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Subprocess.wait obj cancellable)

  method wait_check : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Subprocess.wait_check obj cancellable)

    method as_subprocess = obj
end

let newv (argv : string array) (flags : Gio_enums.subprocessflags) : (subprocess_t, GError.t) result =
  let obj_ = Subprocess.newv argv flags in
Result.map (fun obj_ ->  new subprocess obj_) obj_

