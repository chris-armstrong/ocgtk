(* GENERATED CODE - DO NOT EDIT *)
(* MemoryTexture: MemoryTexture *)

type t = [`memory_texture | `texture | `object_] Gobject.obj

(** Create a new MemoryTexture *)
external new_ : int -> int -> Gdk_enums.memoryformat -> unit -> unit -> t = "ml_gdk_memory_texture_new"

(* Methods *)
