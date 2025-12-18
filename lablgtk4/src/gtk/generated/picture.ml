(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Picture *)

type t = [`picture | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Picture *)
external new_ : unit -> t = "ml_gtk_picture_new"

(** Create a new Picture *)
external new_for_file : unit -> t = "ml_gtk_picture_new_for_file"

(** Create a new Picture *)
external new_for_filename : string option -> t = "ml_gtk_picture_new_for_filename"

(** Create a new Picture *)
external new_for_paintable : unit -> t = "ml_gtk_picture_new_for_paintable"

(** Create a new Picture *)
external new_for_pixbuf : unit -> t = "ml_gtk_picture_new_for_pixbuf"

(** Create a new Picture *)
external new_for_resource : string option -> t = "ml_gtk_picture_new_for_resource"

(* Properties *)

(** Get property: alternative-text *)
external get_alternative_text : t -> string = "ml_gtk_picture_get_alternative_text"

(** Set property: alternative-text *)
external set_alternative_text : t -> string -> unit = "ml_gtk_picture_set_alternative_text"

(** Get property: can-shrink *)
external get_can_shrink : t -> bool = "ml_gtk_picture_get_can_shrink"

(** Set property: can-shrink *)
external set_can_shrink : t -> bool -> unit = "ml_gtk_picture_set_can_shrink"

(** Get property: keep-aspect-ratio *)
external get_keep_aspect_ratio : t -> bool = "ml_gtk_picture_get_keep_aspect_ratio"

(** Set property: keep-aspect-ratio *)
external set_keep_aspect_ratio : t -> bool -> unit = "ml_gtk_picture_set_keep_aspect_ratio"

(** Makes @self load and display the resource at the given
@resource_path.

This is a utility function that calls [method@Gtk.Picture.set_file]. *)
external set_resource : t -> string option -> unit = "ml_gtk_picture_set_resource"

(** Makes @self load and display the given @filename.

This is a utility function that calls [method@Gtk.Picture.set_file]. *)
external set_filename : t -> string option -> unit = "ml_gtk_picture_set_filename"

(** Sets how the content should be resized to fit the `GtkPicture`.

See [enum@Gtk.ContentFit] for details. *)
external set_content_fit : t -> Gtk_enums.contentfit -> unit = "ml_gtk_picture_set_content_fit"

(** Returns the fit mode for the content of the `GtkPicture`.

See [enum@Gtk.ContentFit] for details. *)
external get_content_fit : t -> Gtk_enums.contentfit = "ml_gtk_picture_get_content_fit"

