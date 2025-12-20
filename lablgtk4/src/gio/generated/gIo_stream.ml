(* High-level class for IOStream *)
class io_stream (obj : Io_stream.t) = object (self)

  method clear_pending : unit -> unit =
    fun () ->
      (Io_stream.clear_pending obj)

  method close : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Io_stream.close obj cancellable)

  method get_input_stream : unit -> GInput_stream.input_stream =
    fun () ->
      new  GInput_stream.input_stream(Io_stream.get_input_stream obj)

  method get_output_stream : unit -> GOutput_stream.output_stream =
    fun () ->
      new  GOutput_stream.output_stream(Io_stream.get_output_stream obj)

  method has_pending : unit -> bool =
    fun () ->
      (Io_stream.has_pending obj)

  method is_closed : unit -> bool =
    fun () ->
      (Io_stream.is_closed obj)

  method set_pending : unit -> (bool, GError.t) result =
    fun () ->
      (Io_stream.set_pending obj)

  method closed = Io_stream.get_closed obj

    method as_io_stream = obj
end

