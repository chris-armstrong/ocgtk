(* GENERATED CODE - DO NOT EDIT *)
(* MemoryInputStream: MemoryInputStream *)

(** [GMemoryInputStream] is a class for using arbitrary memory chunks as input
    for GIO streaming input operations.

    As of GLib 2.34, [GMemoryInputStream] implements [Gio.PollableInputStream].
*)

type t = [ `memory_input_stream | `input_stream | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_g_memory_input_stream_new"
(** Create a new MemoryInputStream *)

external new_from_bytes : Glib_bytes.t -> t
  = "ml_g_memory_input_stream_new_from_bytes"
(** Create a new MemoryInputStream *)

(* Methods *)

external add_bytes : t -> Glib_bytes.t -> unit
  = "ml_g_memory_input_stream_add_bytes"
(** Appends [bytes] to data that can be read from the input stream. *)
