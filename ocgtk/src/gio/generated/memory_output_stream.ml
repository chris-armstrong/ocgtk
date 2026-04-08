(* GENERATED CODE - DO NOT EDIT *)
(* MemoryOutputStream: MemoryOutputStream *)

type t = [`memory_output_stream | `output_stream | `object_] Gobject.obj

(** Create a new MemoryOutputStream *)
external new_resizable : unit -> t = "ml_g_memory_output_stream_new_resizable"

(* Methods *)
(** Returns data from the @ostream as a #GBytes. @ostream must be
closed before calling this function. *)
external steal_as_bytes : t -> Glib_bytes.t = "ml_g_memory_output_stream_steal_as_bytes"

(* Properties *)

