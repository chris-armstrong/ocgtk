(* GENERATED CODE - DO NOT EDIT *)
(* DataInputStream: DataInputStream *)

type t = [`data_input_stream | `buffered_input_stream | `filter_input_stream | `input_stream | `object_] Gobject.obj

(** Create a new DataInputStream *)
external new_ : Input_stream.t -> t = "ml_g_data_input_stream_new"

(* Methods *)
(** Sets the newline type for the @stream.

Note that using G_DATA_STREAM_NEWLINE_TYPE_ANY is slightly unsafe. If a read
chunk ends in "CR" we must read an additional byte to know if this is "CR" or
"CR LF", and this might block if there is no more data available. *)
external set_newline_type : t -> Gio_enums.datastreamnewlinetype -> unit = "ml_g_data_input_stream_set_newline_type"

(** This function sets the byte order for the given @stream. All subsequent
reads from the @stream will be read in the given @order. *)
external set_byte_order : t -> Gio_enums.datastreambyteorder -> unit = "ml_g_data_input_stream_set_byte_order"

(** Gets the current newline type for the @stream. *)
external get_newline_type : t -> Gio_enums.datastreamnewlinetype = "ml_g_data_input_stream_get_newline_type"

(** Gets the byte order for the data input stream. *)
external get_byte_order : t -> Gio_enums.datastreambyteorder = "ml_g_data_input_stream_get_byte_order"

(* Properties *)

