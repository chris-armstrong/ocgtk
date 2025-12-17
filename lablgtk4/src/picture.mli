(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Picture *)

type t = [`picture | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

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

(** Makes @self load and display the resource at the given
@resource_path.

This is a utility function that calls [method@Gtk.Picture.set_file]. *)
external set_resource : t -> string option -> unit = "ml_gtk_picture_set_resource"

(** If set to %TRUE, the @self will render its contents according to
their aspect ratio.

That means that empty space may show up at the top/bottom or
left/right of @self.

If set to %FALSE or if the contents provide no aspect ratio,
the contents will be stretched over the picture's whole area. *)
external set_keep_aspect_ratio : t -> bool -> unit = "ml_gtk_picture_set_keep_aspect_ratio"

(** Makes @self load and display the given @filename.

This is a utility function that calls [method@Gtk.Picture.set_file]. *)
external set_filename : t -> string option -> unit = "ml_gtk_picture_set_filename"

(** Sets how the content should be resized to fit the `GtkPicture`.

See [enum@Gtk.ContentFit] for details. *)
external set_content_fit : t -> Gtk_enums.contentfit -> unit = "ml_gtk_picture_set_content_fit"

(** If set to %TRUE, the @self can be made smaller than its contents.

The contents will then be scaled down when rendering.

If you want to still force a minimum size manually, consider using
[method@Gtk.Widget.set_size_request].

Also of note is that a similar function for growing does not exist
because the grow behavior can be controlled via
[method@Gtk.Widget.set_halign] and [method@Gtk.Widget.set_valign]. *)
external set_can_shrink : t -> bool -> unit = "ml_gtk_picture_set_can_shrink"

(** Sets an alternative textual description for the picture contents.

It is equivalent to the "alt" attribute for images on websites.

This text will be made available to accessibility tools.

If the picture cannot be described textually, set this property to %NULL. *)
external set_alternative_text : t -> string option -> unit = "ml_gtk_picture_set_alternative_text"

(** Returns whether the `GtkPicture` preserves its contents aspect ratio. *)
external get_keep_aspect_ratio : t -> bool = "ml_gtk_picture_get_keep_aspect_ratio"

(** Returns the fit mode for the content of the `GtkPicture`.

See [enum@Gtk.ContentFit] for details. *)
external get_content_fit : t -> Gtk_enums.contentfit = "ml_gtk_picture_get_content_fit"

(** Returns whether the `GtkPicture` respects its contents size. *)
external get_can_shrink : t -> bool = "ml_gtk_picture_get_can_shrink"

(** Gets the alternative textual description of the picture.

The returned string will be %NULL if the picture cannot be described textually. *)
external get_alternative_text : t -> string option = "ml_gtk_picture_get_alternative_text"

