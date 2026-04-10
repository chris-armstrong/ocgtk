class type data_output_stream_t = object
    inherit GFilter_output_stream.filter_output_stream_t
    method get_byte_order : unit -> Gio_enums.datastreambyteorder
    method put_int16 : Int16.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_int32 : Int32.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_int64 : int64 -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_string : string -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_uint16 : UInt16.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_uint32 : UInt32.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_uint64 : Unsigned.UInt64.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_byte_order : Gio_enums.datastreambyteorder -> unit
    method as_data_output_stream : Data_output_stream.t
end

(* High-level class for DataOutputStream *)
class data_output_stream (obj : Data_output_stream.t) : data_output_stream_t = object (self)
  inherit GFilter_output_stream.filter_output_stream (obj :> Filter_output_stream.t)

  method get_byte_order : unit -> Gio_enums.datastreambyteorder =
    fun () ->
      (Data_output_stream.get_byte_order obj)

  method put_int16 : Int16.t -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun data cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_output_stream.put_int16 obj data cancellable)

  method put_int32 : Int32.t -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun data cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_output_stream.put_int32 obj data cancellable)

  method put_int64 : int64 -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun data cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_output_stream.put_int64 obj data cancellable)

  method put_string : string -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun str cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_output_stream.put_string obj str cancellable)

  method put_uint16 : UInt16.t -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun data cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_output_stream.put_uint16 obj data cancellable)

  method put_uint32 : UInt32.t -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun data cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_output_stream.put_uint32 obj data cancellable)

  method put_uint64 : Unsigned.UInt64.t -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun data cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_output_stream.put_uint64 obj data cancellable)

  method set_byte_order : Gio_enums.datastreambyteorder -> unit =
    fun order ->
      (Data_output_stream.set_byte_order obj order)

    method as_data_output_stream = obj
end

let new_ (base_stream : GOutput_stream.output_stream_t) : data_output_stream_t =
  let base_stream = base_stream#as_output_stream in
  let obj_ = Data_output_stream.new_ base_stream in
  new data_output_stream obj_

