(* High-level class for OutputStream *)
class output_stream (obj : Output_stream.t) = object (self)

  method clear_pending : unit -> unit =
    fun () ->
      (Output_stream.clear_pending obj)

  method close : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Output_stream.close obj cancellable)

  method flush : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
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

