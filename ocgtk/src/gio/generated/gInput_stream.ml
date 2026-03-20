class type input_stream_t = object
    method clear_pending : unit -> unit
    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method set_pending : unit -> (bool, GError.t) result
    method as_input_stream : Input_stream.t
end

(* High-level class for InputStream *)
class input_stream (obj : Input_stream.t) : input_stream_t = object (self)

  method clear_pending : unit -> unit =
    fun () ->
      (Input_stream.clear_pending obj)

  method close : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Input_stream.close obj cancellable)

  method has_pending : unit -> bool =
    fun () ->
      (Input_stream.has_pending obj)

  method is_closed : unit -> bool =
    fun () ->
      (Input_stream.is_closed obj)

  method set_pending : unit -> (bool, GError.t) result =
    fun () ->
      (Input_stream.set_pending obj)

    method as_input_stream = obj
end

