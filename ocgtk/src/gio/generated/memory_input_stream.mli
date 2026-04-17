(* GENERATED CODE - DO NOT EDIT *)
(* MemoryInputStream: MemoryInputStream *)

type t = [`memory_input_stream | `input_stream | `object_] Gobject.obj

(** Create a new MemoryInputStream *)
external new_ : unit -> t = "ml_g_memory_input_stream_new"

(** Create a new MemoryInputStream *)
external new_from_bytes : Glib_bytes.t -> t = "ml_g_memory_input_stream_new_from_bytes"

(* Methods *)
(** Appends @bytes to data that can be read from the input stream. *)
external add_bytes : t -> Glib_bytes.t -> unit = "ml_g_memory_input_stream_add_bytes"

