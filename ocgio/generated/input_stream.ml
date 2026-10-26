class type input_stream_t = object
  method clear_pending : unit -> unit
  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  method has_pending : unit -> bool
  method is_closed : unit -> bool

  method read_bytes :
    Gsize.t ->
    Cancellable.cancellable_t option ->
    (Glib_bytes.t, GError.t) result

  method read_bytes_finish :
    Async_result.async_result_t -> (Glib_bytes.t, GError.t) result

  method read_finish : Async_result.async_result_t -> (int, GError.t) result
  method set_pending : unit -> (bool, GError.t) result

  method skip :
    Gsize.t -> Cancellable.cancellable_t option -> (int, GError.t) result

  method skip_finish : Async_result.async_result_t -> (int, GError.t) result
  method as_input_stream : Raw.Input_stream.t
end

(* High-level class for InputStream *)
class input_stream (obj : Raw.Input_stream.t) : input_stream_t =
  object (self)
    method clear_pending : unit -> unit =
      fun () -> Raw.Input_stream.clear_pending obj

    method close : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Input_stream.close obj cancellable

    method close_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Input_stream.close_finish obj result

    method has_pending : unit -> bool =
      fun () -> Raw.Input_stream.has_pending obj

    method is_closed : unit -> bool = fun () -> Raw.Input_stream.is_closed obj

    method read_bytes :
        Gsize.t ->
        Cancellable.cancellable_t option ->
        (Glib_bytes.t, GError.t) result =
      fun count cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Input_stream.read_bytes obj count cancellable

    method read_bytes_finish :
        Async_result.async_result_t -> (Glib_bytes.t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Input_stream.read_bytes_finish obj result

    method read_finish : Async_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Input_stream.read_finish obj result

    method set_pending : unit -> (bool, GError.t) result =
      fun () -> Raw.Input_stream.set_pending obj

    method skip :
        Gsize.t -> Cancellable.cancellable_t option -> (int, GError.t) result =
      fun count cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Input_stream.skip obj count cancellable

    method skip_finish : Async_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Input_stream.skip_finish obj result

    method as_input_stream = obj
  end
