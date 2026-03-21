class type output_stream_t = object
    method clear_pending : unit -> unit
    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
    method flush : GCancellable.cancellable_t option -> (bool, GError.t) result
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method is_closing : unit -> bool
    method set_pending : unit -> (bool, GError.t) result
    method as_output_stream : Output_stream.t
end

(* High-level class for OutputStream *)
class output_stream (obj : Output_stream.t) : output_stream_t = object (self)

  method clear_pending : unit -> unit =
    fun () ->
      (Output_stream.clear_pending obj)

  method close : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Output_stream.close obj cancellable)

  method flush : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Output_stream.flush obj cancellable)

  method has_pending : unit -> bool =
    fun () ->
      (Output_stream.has_pending obj)

  method is_closed : unit -> bool =
    fun () ->
      (Output_stream.is_closed obj)

  method is_closing : unit -> bool =
    fun () ->
      (Output_stream.is_closing obj)

  method set_pending : unit -> (bool, GError.t) result =
    fun () ->
      (Output_stream.set_pending obj)

    method as_output_stream = obj
end

