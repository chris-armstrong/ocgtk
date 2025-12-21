(* GENERATED CODE - DO NOT EDIT *)
(* DataOutputStream: DataOutputStream *)

type t = [`data_output_stream | `filter_output_stream | `output_stream | `object_] Gobject.obj

(** Create a new DataOutputStream *)
external new_ : Output_stream.t -> t = "ml_g_data_output_stream_new"

(* Methods *)
(** Sets the byte order of the data output stream to @order. *)
external set_byte_order : t -> Gio_enums.datastreambyteorder -> unit = "ml_g_data_output_stream_set_byte_order"

(** Puts a string into the output stream. *)
external put_string : t -> string -> Cancellable.t option -> (bool, GError.t) result = "ml_g_data_output_stream_put_string"

(** Gets the byte order for the stream. *)
external get_byte_order : t -> Gio_enums.datastreambyteorder = "ml_g_data_output_stream_get_byte_order"

(* Properties *)

