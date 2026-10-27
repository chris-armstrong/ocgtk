class type filter_input_stream_t = object
  inherit Input_stream.input_stream_t
  method get_base_stream : unit -> Input_stream.input_stream_t
  method get_close_base_stream : unit -> bool
  method set_close_base_stream : bool -> unit
  method as_filter_input_stream : Raw.Filter_input_stream.t
end

(* High-level class for FilterInputStream *)
class filter_input_stream (obj : Raw.Filter_input_stream.t) :
  filter_input_stream_t =
  object (self)
    inherit Input_stream.input_stream (obj :> Raw.Input_stream.t)

    method get_base_stream : unit -> Input_stream.input_stream_t =
      fun () ->
        new Input_stream.input_stream
          (Raw.Filter_input_stream.get_base_stream obj)

    method get_close_base_stream : unit -> bool =
      fun () -> Raw.Filter_input_stream.get_close_base_stream obj

    method set_close_base_stream : bool -> unit =
      fun close_base ->
        Raw.Filter_input_stream.set_close_base_stream obj close_base

    method as_filter_input_stream = obj
  end
