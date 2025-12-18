(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Image *)

type t = [`image | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Image *)
external new_ : unit -> t = "ml_gtk_image_new"

(** Create a new Image *)
external new_from_file : string -> t = "ml_gtk_image_new_from_file"

(** Create a new Image *)
external new_from_gicon : unit -> t = "ml_gtk_image_new_from_gicon"

(** Create a new Image *)
external new_from_icon_name : string option -> t = "ml_gtk_image_new_from_icon_name"

(** Create a new Image *)
external new_from_paintable : unit -> t = "ml_gtk_image_new_from_paintable"

(** Create a new Image *)
external new_from_pixbuf : unit -> t = "ml_gtk_image_new_from_pixbuf"

(** Create a new Image *)
external new_from_resource : string -> t = "ml_gtk_image_new_from_resource"

(* Properties *)

(** Get property: file *)
external get_file : t -> string = "ml_gtk_image_get_file"

(** Set property: file *)
external set_file : t -> string -> unit = "ml_gtk_image_set_file"

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_image_get_icon_name"

(** Set property: icon-name *)
external set_icon_name : t -> string -> unit = "ml_gtk_image_set_icon_name"

(** Get property: pixel-size *)
external get_pixel_size : t -> int = "ml_gtk_image_get_pixel_size"

(** Set property: pixel-size *)
external set_pixel_size : t -> int -> unit = "ml_gtk_image_set_pixel_size"

(** Get property: resource *)
external get_resource : t -> string = "ml_gtk_image_get_resource"

(** Set property: resource *)
external set_resource : t -> string -> unit = "ml_gtk_image_set_resource"

(** Get property: use-fallback *)
external get_use_fallback : t -> bool = "ml_gtk_image_get_use_fallback"

(** Set property: use-fallback *)
external set_use_fallback : t -> bool -> unit = "ml_gtk_image_set_use_fallback"

(** Suggests an icon size to the theme for named icons. *)
external set_icon_size : t -> Gtk_enums.iconsize -> unit = "ml_gtk_image_set_icon_size"

(** Sets a `GtkImage` to show a resource.

See [ctor@Gtk.Image.new_from_resource] for details. *)
external set_from_resource : t -> string option -> unit = "ml_gtk_image_set_from_resource"

(** Sets a `GtkImage` to show a named icon.

See [ctor@Gtk.Image.new_from_icon_name] for details. *)
external set_from_icon_name : t -> string option -> unit = "ml_gtk_image_set_from_icon_name"

(** Sets a `GtkImage` to show a file.

See [ctor@Gtk.Image.new_from_file] for details. *)
external set_from_file : t -> string option -> unit = "ml_gtk_image_set_from_file"

(** Gets the type of representation being used by the `GtkImage`
to store image data.

If the `GtkImage` has no image data, the return value will
be %GTK_IMAGE_EMPTY. *)
external get_storage_type : t -> Gtk_enums.imagetype = "ml_gtk_image_get_storage_type"

(** Gets the icon size used by the @image when rendering icons. *)
external get_icon_size : t -> Gtk_enums.iconsize = "ml_gtk_image_get_icon_size"

(** Resets the image to be empty. *)
external clear : t -> unit = "ml_gtk_image_clear"

