class type data_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Seekable.seekable_t

  (** {2:methods Methods} *)

  method get_byte_order : unit -> Enums.datastreambyteorder
  (** Gets the byte order for the stream. *)

  method put_int16 :
    Int16.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts a signed 16-bit integer into the output stream. *)

  method put_int32 :
    Int32.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts a signed 32-bit integer into the output stream. *)

  method put_int64 :
    int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts a signed 64-bit integer into the stream. *)

  method put_string :
    string -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts a string into the output stream. *)

  method put_uint16 :
    UInt16.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts an unsigned 16-bit integer into the output stream. *)

  method put_uint32 :
    UInt32.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts an unsigned 32-bit integer into the stream. *)

  method put_uint64 :
    UInt64.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts an unsigned 64-bit integer into the stream. *)

  method set_byte_order : Enums.datastreambyteorder -> unit
  (** Sets the byte order of the data output stream to [order]. *)

  (** {2:conversions Conversions} *)

  method as_data_output_stream : Raw.Data_output_stream.t
end

(* High-level class for DataOutputStream *)
class data_output_stream (obj : Raw.Data_output_stream.t) : data_output_stream_t
  =
  object (self)
    inherit
      Filter_output_stream.filter_output_stream
        (obj :> Raw.Filter_output_stream.t)

    inherit Seekable.seekable (Raw.Seekable.from_gobject obj)

    method get_byte_order : unit -> Enums.datastreambyteorder =
      fun () -> Raw.Data_output_stream.get_byte_order obj

    method put_int16 :
        Int16.t -> Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun data cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_output_stream.put_int16 obj data cancellable

    method put_int32 :
        Int32.t -> Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun data cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_output_stream.put_int32 obj data cancellable

    method put_int64 :
        int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun data cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_output_stream.put_int64 obj data cancellable

    method put_string :
        string -> Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun str cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_output_stream.put_string obj str cancellable

    method put_uint16 :
        UInt16.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun data cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_output_stream.put_uint16 obj data cancellable

    method put_uint32 :
        UInt32.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun data cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_output_stream.put_uint32 obj data cancellable

    method put_uint64 :
        UInt64.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun data cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Data_output_stream.put_uint64 obj data cancellable

    method set_byte_order : Enums.datastreambyteorder -> unit =
      fun order -> Raw.Data_output_stream.set_byte_order obj order

    method as_data_output_stream = obj
  end

let new_ (base_stream : Output_stream.output_stream_t) : data_output_stream_t =
  let base_stream = base_stream#as_output_stream in
  let obj_ = Raw.Data_output_stream.new_ base_stream in
  new data_output_stream obj_
