class type io_stream_t = object
  method clear_pending : unit -> unit
  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  method get_input_stream : unit -> Input_stream.input_stream_t
  method get_output_stream : unit -> Output_stream.output_stream_t
  method has_pending : unit -> bool
  method is_closed : unit -> bool
  method set_pending : unit -> (bool, GError.t) result
  method as_io_stream : Raw.Io_stream.t
end

(* High-level class for IOStream *)
class io_stream (obj : Raw.Io_stream.t) : io_stream_t =
  object (self)
    method clear_pending : unit -> unit =
      fun () -> Raw.Io_stream.clear_pending obj

    method close : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Io_stream.close obj cancellable

    method close_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Io_stream.close_finish obj result

    method get_input_stream : unit -> Input_stream.input_stream_t =
      fun () ->
        new Input_stream.input_stream (Raw.Io_stream.get_input_stream obj)

    method get_output_stream : unit -> Output_stream.output_stream_t =
      fun () ->
        new Output_stream.output_stream (Raw.Io_stream.get_output_stream obj)

    method has_pending : unit -> bool = fun () -> Raw.Io_stream.has_pending obj
    method is_closed : unit -> bool = fun () -> Raw.Io_stream.is_closed obj

    method set_pending : unit -> (bool, GError.t) result =
      fun () -> Raw.Io_stream.set_pending obj

    method as_io_stream = obj
  end
