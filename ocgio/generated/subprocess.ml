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
