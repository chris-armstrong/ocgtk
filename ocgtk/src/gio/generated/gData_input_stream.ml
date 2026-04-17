class type data_input_stream_t = object
    inherit GBuffered_input_stream.buffered_input_stream_t
    method get_byte_order : unit -> Gio_enums.datastreambyteorder
    method get_newline_type : unit -> Gio_enums.datastreamnewlinetype
    method read_int16 : GCancellable.cancellable_t option -> (Int16.t, GError.t) result
    method read_int32 : GCancellable.cancellable_t option -> (Int32.t, GError.t) result
    method read_int64 : GCancellable.cancellable_t option -> (int64, GError.t) result
    method read_uint16 : GCancellable.cancellable_t option -> (UInt16.t, GError.t) result
    method read_uint32 : GCancellable.cancellable_t option -> (UInt32.t, GError.t) result
    method read_uint64 : GCancellable.cancellable_t option -> (UInt64.t, GError.t) result
    method set_byte_order : Gio_enums.datastreambyteorder -> unit
    method set_newline_type : Gio_enums.datastreamnewlinetype -> unit
    method as_data_input_stream : Data_input_stream.t
end

(* High-level class for DataInputStream *)
class data_input_stream (obj : Data_input_stream.t) : data_input_stream_t = object (self)
  inherit GBuffered_input_stream.buffered_input_stream (obj :> Buffered_input_stream.t)

  method get_byte_order : unit -> Gio_enums.datastreambyteorder =
    fun () ->
      (Data_input_stream.get_byte_order obj)

  method get_newline_type : unit -> Gio_enums.datastreamnewlinetype =
    fun () ->
      (Data_input_stream.get_newline_type obj)

  method read_int16 : GCancellable.cancellable_t option -> (Int16.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_input_stream.read_int16 obj cancellable)

  method read_int32 : GCancellable.cancellable_t option -> (Int32.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_input_stream.read_int32 obj cancellable)

  method read_int64 : GCancellable.cancellable_t option -> (int64, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_input_stream.read_int64 obj cancellable)

  method read_uint16 : GCancellable.cancellable_t option -> (UInt16.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_input_stream.read_uint16 obj cancellable)

  method read_uint32 : GCancellable.cancellable_t option -> (UInt32.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_input_stream.read_uint32 obj cancellable)

  method read_uint64 : GCancellable.cancellable_t option -> (UInt64.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_input_stream.read_uint64 obj cancellable)

  method set_byte_order : Gio_enums.datastreambyteorder -> unit =
    fun order ->
      (Data_input_stream.set_byte_order obj order)

  method set_newline_type : Gio_enums.datastreamnewlinetype -> unit =
    fun type_ ->
      (Data_input_stream.set_newline_type obj type_)

    method as_data_input_stream = obj
end

let new_ (base_stream : GInput_stream.input_stream_t) : data_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let obj_ = Data_input_stream.new_ base_stream in
  new data_input_stream obj_

