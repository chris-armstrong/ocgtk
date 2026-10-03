(* GENERATED CODE - DO NOT EDIT *)
(* MemoryTexture: MemoryTexture *)

(** A [GdkTexture] representing image data in memory. *)

type t = [ `memory_texture | `texture | `object_ ] Gobject.obj

external new_ :
  int -> int -> Gdk_enums.memoryformat -> Glib_bytes.t -> Gsize.t -> t
  = "ml_gdk_memory_texture_new"
(** Create a new MemoryTexture *)

(* Methods *)
