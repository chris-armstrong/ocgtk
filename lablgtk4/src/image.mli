(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Image *)

type t = Gtk.Widget.t

(** Create a new Image *)
external new_ : unit -> t = "ml_gtk_image_new"

(** Create a new Image *)
external new_ : unit -> t = "ml_gtk_image_new_from_file"

(** Create a new Image *)
external new_ : unit -> t = "ml_gtk_image_new_from_gicon"

(** Create a new Image *)
external new_ : unit -> t = "ml_gtk_image_new_from_icon_name"

(** Create a new Image *)
external new_ : unit -> t = "ml_gtk_image_new_from_paintable"

(** Create a new Image *)
external new_ : unit -> t = "ml_gtk_image_new_from_pixbuf"

(** Create a new Image *)
external new_ : unit -> t = "ml_gtk_image_new_from_resource"

(* Properties *)

(** Get property: file *)
external get_file : t -> unit = "ml_gtk_image_get_file"

(** Set property: file *)
external set_file : t -> unit -> unit = "ml_gtk_image_set_file"

(** Get property: gicon *)
external get_gicon : t -> unit = "ml_gtk_image_get_gicon"

(** Set property: gicon *)
external set_gicon : t -> unit -> unit = "ml_gtk_image_set_gicon"

(** Get property: icon-name *)
external get_icon_name : t -> unit = "ml_gtk_image_get_icon_name"

(** Set property: icon-name *)
external set_icon_name : t -> unit -> unit = "ml_gtk_image_set_icon_name"

(** Get property: icon-size *)
external get_icon_size : t -> unit = "ml_gtk_image_get_icon_size"

(** Set property: icon-size *)
external set_icon_size : t -> unit -> unit = "ml_gtk_image_set_icon_size"

(** Get property: paintable *)
external get_paintable : t -> unit = "ml_gtk_image_get_paintable"

(** Set property: paintable *)
external set_paintable : t -> unit -> unit = "ml_gtk_image_set_paintable"

(** Get property: pixel-size *)
external get_pixel_size : t -> int = "ml_gtk_image_get_pixel_size"

(** Set property: pixel-size *)
external set_pixel_size : t -> int -> unit = "ml_gtk_image_set_pixel_size"

(** Get property: resource *)
external get_resource : t -> unit = "ml_gtk_image_get_resource"

(** Set property: resource *)
external set_resource : t -> unit -> unit = "ml_gtk_image_set_resource"

(** Get property: storage-type *)
external get_storage_type : t -> unit = "ml_gtk_image_get_storage_type"

(** Get property: use-fallback *)
external get_use_fallback : t -> bool = "ml_gtk_image_get_use_fallback"

(** Set property: use-fallback *)
external set_use_fallback : t -> bool -> unit = "ml_gtk_image_set_use_fallback"

external set_from_resource : t -> unit -> unit = "ml_gtk_image_set_from_resource"

external set_from_pixbuf : t -> unit -> unit = "ml_gtk_image_set_from_pixbuf"

external set_from_paintable : t -> unit -> unit = "ml_gtk_image_set_from_paintable"

external set_from_icon_name : t -> unit -> unit = "ml_gtk_image_set_from_icon_name"

external set_from_gicon : t -> unit -> unit = "ml_gtk_image_set_from_gicon"

external set_from_file : t -> unit -> unit = "ml_gtk_image_set_from_file"

external clear : t -> unit = "ml_gtk_image_clear"

