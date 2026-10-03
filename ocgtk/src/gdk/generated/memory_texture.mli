(* GENERATED CODE - DO NOT EDIT *)
(* MemoryTexture: MemoryTexture *)

type t = [ `memory_texture | `texture | `object_ ] Gobject.obj
(** A [GdkTexture] representing image data in memory. *)

external new_ :
  int -> int -> Gdk_enums.memoryformat -> Glib_bytes.t -> Gsize.t -> t
  = "ml_gdk_memory_texture_new"
(** Create a new MemoryTexture *)

(* Methods *)
