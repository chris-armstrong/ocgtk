(* High-level class for InputStream *)
class input_stream (obj : Input_stream.t) = object (self)

  method clear_pending : unit -> unit =
    fun () ->
      (Input_stream.clear_pending obj)

  method close : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
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

