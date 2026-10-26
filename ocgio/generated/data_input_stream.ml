class type data_input_stream_t = object
  inherit Buffered_input_stream.buffered_input_stream_t
  method get_byte_order : unit -> Enums.datastreambyteorder
  method get_newline_type : unit -> Enums.datastreamnewlinetype

  method read_int16 :
    Cancellable.cancellable_t option -> (Int16.t, GError.t) result

  method read_int32 :
    Cancellable.cancellable_t option -> (Int32.t, GError.t) result

  method read_int64 :
    Cancellable.cancellable_t option -> (int64, GError.t) result

  method read_uint16 :
    Cancellable.cancellable_t option -> (UInt16.t, GError.t) result

  method read_uint32 :
    Cancellable.cancellable_t option -> (UInt32.t, GError.t) result

  method read_uint64 :
    Cancellable.cancellable_t option -> (UInt64.t, GError.t) result

  method set_byte_order : Enums.datastreambyteorder -> unit
  method set_newline_type : Enums.datastreamnewlinetype -> unit
  method as_data_input_stream : Raw.Data_input_stream.t
end

(* High-level class for DataInputStream *)
class data_input_stream (obj : Raw.Data_input_stream.t) : data_input_stream_t =
  object (self)
    inherit
      Buffered_input_stream.buffered_input_stream
        (obj :> Raw.Buffered_input_stream.t)

    method get_byte_order : unit -> Enums.datastreambyteorder =
      fun () -> Raw.Data_input_stream.get_byte_order obj

    method get_newline_type : unit -> Enums.datastreamnewlinetype =
      fun () -> Raw.Data_input_stream.get_newline_type obj

    method read_int16 :
        Cancellable.cancellable_t option -> (Int16.t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_input_stream.read_int16 obj cancellable

    method read_int32 :
        Cancellable.cancellable_t option -> (Int32.t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_input_stream.read_int32 obj cancellable

    method read_int64 :
        Cancellable.cancellable_t option -> (int64, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_input_stream.read_int64 obj cancellable

    method read_uint16 :
        Cancellable.cancellable_t option -> (UInt16.t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_input_stream.read_uint16 obj cancellable

    method read_uint32 :
        Cancellable.cancellable_t option -> (UInt32.t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_input_stream.read_uint32 obj cancellable

    method read_uint64 :
        Cancellable.cancellable_t option -> (UInt64.t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_input_stream.read_uint64 obj cancellable

    method set_byte_order : Enums.datastreambyteorder -> unit =
      fun order -> Raw.Data_input_stream.set_byte_order obj order

    method set_newline_type : Enums.datastreamnewlinetype -> unit =
      fun type_ -> Raw.Data_input_stream.set_newline_type obj type_

    method as_data_input_stream = obj
  end

let new_ (base_stream : Input_stream.input_stream_t) : data_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let obj_ = Raw.Data_input_stream.new_ base_stream in
  new data_input_stream obj_
