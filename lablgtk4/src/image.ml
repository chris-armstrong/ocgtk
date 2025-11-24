(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Image *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_image_new"

external new_from_file : string -> t = "ml_gtk_image_new_from_file"

external new_from_gicon : unit -> t = "ml_gtk_image_new_from_gicon"

external new_from_icon_name : string option -> t = "ml_gtk_image_new_from_icon_name"

external new_from_paintable : unit -> t = "ml_gtk_image_new_from_paintable"

external new_from_pixbuf : unit -> t = "ml_gtk_image_new_from_pixbuf"

external new_from_resource : string -> t = "ml_gtk_image_new_from_resource"

(* Properties *)

external get_file : t -> string = "ml_gtk_image_get_file"

external set_file : t -> string -> unit = "ml_gtk_image_set_file"

external get_icon_name : t -> string = "ml_gtk_image_get_icon_name"

external set_icon_name : t -> string -> unit = "ml_gtk_image_set_icon_name"

external get_pixel_size : t -> int = "ml_gtk_image_get_pixel_size"

external set_pixel_size : t -> int -> unit = "ml_gtk_image_set_pixel_size"

external get_resource : t -> string = "ml_gtk_image_get_resource"

external set_resource : t -> string -> unit = "ml_gtk_image_set_resource"

external get_use_fallback : t -> bool = "ml_gtk_image_get_use_fallback"

external set_use_fallback : t -> bool -> unit = "ml_gtk_image_set_use_fallback"

external set_icon_size : t -> Gtk_enums.iconsize -> unit = "ml_gtk_image_set_icon_size"

external set_from_resource : t -> string option -> unit = "ml_gtk_image_set_from_resource"

external set_from_icon_name : t -> string option -> unit = "ml_gtk_image_set_from_icon_name"

external set_from_file : t -> string option -> unit = "ml_gtk_image_set_from_file"

external get_storage_type : t -> Gtk_enums.imagetype = "ml_gtk_image_get_storage_type"

external get_icon_size : t -> Gtk_enums.iconsize = "ml_gtk_image_get_icon_size"

external clear : t -> unit = "ml_gtk_image_clear"

