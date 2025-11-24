(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Picture *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_picture_new"

external new_for_file : unit -> t = "ml_gtk_picture_new_for_file"

external new_for_filename : string option -> t = "ml_gtk_picture_new_for_filename"

external new_for_paintable : unit -> t = "ml_gtk_picture_new_for_paintable"

external new_for_pixbuf : unit -> t = "ml_gtk_picture_new_for_pixbuf"

external new_for_resource : string option -> t = "ml_gtk_picture_new_for_resource"

(* Properties *)

external get_alternative_text : t -> string = "ml_gtk_picture_get_alternative_text"

external set_alternative_text : t -> string -> unit = "ml_gtk_picture_set_alternative_text"

external get_can_shrink : t -> bool = "ml_gtk_picture_get_can_shrink"

external set_can_shrink : t -> bool -> unit = "ml_gtk_picture_set_can_shrink"

external get_keep_aspect_ratio : t -> bool = "ml_gtk_picture_get_keep_aspect_ratio"

external set_keep_aspect_ratio : t -> bool -> unit = "ml_gtk_picture_set_keep_aspect_ratio"

external set_resource : t -> string option -> unit = "ml_gtk_picture_set_resource"

external set_filename : t -> string option -> unit = "ml_gtk_picture_set_filename"

external set_content_fit : t -> Gtk_enums.contentfit -> unit = "ml_gtk_picture_set_content_fit"

external get_content_fit : t -> Gtk_enums.contentfit = "ml_gtk_picture_get_content_fit"

