class type output_stream_t = object
  method clear_pending : unit -> unit
  method close : GCancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : GAsync_result.async_result_t -> (bool, GError.t) result
  method flush : GCancellable.cancellable_t option -> (bool, GError.t) result
  method flush_finish : GAsync_result.async_result_t -> (bool, GError.t) result
  method has_pending : unit -> bool
  method is_closed : unit -> bool
  method is_closing : unit -> bool
  method set_pending : unit -> (bool, GError.t) result

  method splice :
    GInput_stream.input_stream_t ->
    Gio_enums.outputstreamspliceflags ->
    GCancellable.cancellable_t option ->
    (int, GError.t) result

  method splice_finish : GAsync_result.async_result_t -> (int, GError.t) result

  method write_bytes :
    Glib_bytes.t -> GCancellable.cancellable_t option -> (int, GError.t) result

  method write_bytes_finish :
    GAsync_result.async_result_t -> (int, GError.t) result

  method write_finish : GAsync_result.async_result_t -> (int, GError.t) result
  method as_output_stream : Output_stream.t
end

(* High-level class for OutputStream *)
class output_stream (obj : Output_stream.t) : output_stream_t =
  object (self)
    method clear_pending : unit -> unit =
      fun () -> Output_stream.clear_pending obj

    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Output_stream.close obj cancellable

    method close_finish :
        GAsync_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Output_stream.close_finish obj result

    method flush : GCancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Output_stream.flush obj cancellable

    method flush_finish :
        GAsync_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Output_stream.flush_finish obj result

    method has_pending : unit -> bool = fun () -> Output_stream.has_pending obj
    method is_closed : unit -> bool = fun () -> Output_stream.is_closed obj
    method is_closing : unit -> bool = fun () -> Output_stream.is_closing obj

    method set_pending : unit -> (bool, GError.t) result =
      fun () -> Output_stream.set_pending obj

    method splice :
        GInput_stream.input_stream_t ->
        Gio_enums.outputstreamspliceflags ->
        GCancellable.cancellable_t option ->
        (int, GError.t) result =
      fun source flags cancellable ->
        let source = source#as_input_stream in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Output_stream.splice obj source flags cancellable

    method splice_finish :
        GAsync_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Output_stream.splice_finish obj result

    method write_bytes :
        Glib_bytes.t ->
        GCancellable.cancellable_t option ->
        (int, GError.t) result =
      fun bytes cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Output_stream.write_bytes obj bytes cancellable

    method write_bytes_finish :
        GAsync_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Output_stream.write_bytes_finish obj result

    method write_finish : GAsync_result.async_result_t -> (int, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Output_stream.write_finish obj result

    method as_output_stream = obj
  end
