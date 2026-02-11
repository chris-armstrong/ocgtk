(* GENERATED CODE - DO NOT EDIT *)
(* PixbufFormat: PixbufFormat *)

(** A `GdkPixbufFormat` contains information about the image format accepted
by a module.

Only modules should access the fields directly, applications should
use the `gdk_pixbuf_format_*` family of functions. *)
type t = [`pixbuf_format] Gobject.obj

(* Methods *)
(** Disables or enables an image format.

If a format is disabled, GdkPixbuf won't use the image loader for
this format to load images.

Applications can use this to avoid using image loaders with an
inappropriate license, see gdk_pixbuf_format_get_license(). *)
external set_disabled : t -> bool -> unit = "ml_gdk_pixbuf_format_set_disabled"

(** Returns whether pixbufs can be saved in the given format. *)
external is_writable : t -> bool = "ml_gdk_pixbuf_format_is_writable"

(** Returns whether this image format is scalable.

If a file is in a scalable format, it is preferable to load it at
the desired size, rather than loading it at the default size and
scaling the resulting pixbuf to the desired size. *)
external is_scalable : t -> bool = "ml_gdk_pixbuf_format_is_scalable"

(** Returns `TRUE` if the save option specified by @option_key is supported when
saving a pixbuf using the module implementing @format.

See gdk_pixbuf_save() for more information about option keys. *)
external is_save_option_supported : t -> string -> bool = "ml_gdk_pixbuf_format_is_save_option_supported"

(** Returns whether this image format is disabled.

See gdk_pixbuf_format_set_disabled(). *)
external is_disabled : t -> bool = "ml_gdk_pixbuf_format_is_disabled"

(** Returns the name of the format. *)
external get_name : t -> string = "ml_gdk_pixbuf_format_get_name"

(** Returns the mime types supported by the format. *)
external get_mime_types : t -> string array = "ml_gdk_pixbuf_format_get_mime_types"

(** Returns information about the license of the image loader for the format.

The returned string should be a shorthand for a well known license, e.g.
"LGPL", "GPL", "QPL", "GPL/QPL", or "other" to indicate some other license. *)
external get_license : t -> string = "ml_gdk_pixbuf_format_get_license"

(** Returns the filename extensions typically used for files in the
given format. *)
external get_extensions : t -> string array = "ml_gdk_pixbuf_format_get_extensions"

(** Returns a description of the format. *)
external get_description : t -> string = "ml_gdk_pixbuf_format_get_description"

(** Frees the resources allocated when copying a `GdkPixbufFormat`
using gdk_pixbuf_format_copy() *)
external free : t -> unit = "ml_gdk_pixbuf_format_free"

(** Creates a copy of `format`. *)
external copy : t -> t = "ml_gdk_pixbuf_format_copy"

