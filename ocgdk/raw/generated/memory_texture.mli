(* GENERATED CODE - DO NOT EDIT *)
(* MemoryTexture: MemoryTexture *)

(** A [GdkTexture] representing image data in memory.

    The class built on this module is in {!Ocgdk.Memory_texture}. *)

type t = [ `memory_texture | `texture | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_memory_texture_get_type"

external new_ :
  int -> int -> Ocgdk_enums.memoryformat -> Glib_bytes.t -> Gsize.t -> t
  = "ml_gdk_memory_texture_new"
(** Creates a new texture for a blob of image data.

    The [GBytes] must contain [stride] × [height] pixels in the given format. *)

(* Methods *)
