(* GENERATED CODE - DO NOT EDIT *)
(* Texture: Texture *)

type t = [`texture | `object_] Gobject.obj

(** Create a new Texture *)
external new_for_pixbuf : unit -> t = "ml_gdk_texture_new_for_pixbuf"

(** Create a new Texture *)
external new_from_resource : string -> t = "ml_gdk_texture_new_from_resource"

(* Methods *)
(** Store the given @texture to the @filename as a TIFF file.

GTK will attempt to store data without loss. *)
external save_to_tiff : t -> string -> bool = "ml_gdk_texture_save_to_tiff"

(** Store the given @texture to the @filename as a PNG file.

This is a utility function intended for debugging and testing.
If you want more control over formats, proper error handling or
want to store to a [iface@Gio.File] or other location, you might want to
use [method@Gdk.Texture.save_to_png_bytes] or look into the
gdk-pixbuf library. *)
external save_to_png : t -> string -> bool = "ml_gdk_texture_save_to_png"

(** Returns the width of @texture, in pixels. *)
external get_width : t -> int = "ml_gdk_texture_get_width"

(** Returns the height of the @texture, in pixels. *)
external get_height : t -> int = "ml_gdk_texture_get_height"

(** Gets the memory format most closely associated with the data of
the texture.

Note that it may not be an exact match for texture data
stored on the GPU or with compression.

The format can give an indication about the bit depth and opacity
of the texture and is useful to determine the best format for
downloading the texture. *)
external get_format : t -> Gdk_enums.memoryformat = "ml_gdk_texture_get_format"

(* Properties *)

