(* GENERATED CODE - DO NOT EDIT *)
(* Picture: Picture *)

(** Displays a [GdkPaintable].

    An example GtkPicture

    Many convenience functions are provided to make pictures simple to use. For
    example, if you want to load an image from a file, and then display it,
    there’s a convenience function to do this:

    {[
    GtkWidget *widget = gtk_picture_new_for_filename (“myfile.png”);
    ]}

    If the file isn’t loaded successfully, the picture will contain a “broken
    image” icon similar to that used in many web browsers. If you want to handle
    errors in loading the file yourself, for example by displaying an error
    message, then load the image with and image loading framework such as
    libglycin, then create the [GtkPicture] with
    [Gtk.Picture.new_for_paintable].

    Sometimes an application will want to avoid depending on external data
    files, such as image files. See the documentation of [GResource] for
    details. In this case, [Gtk.Picture.new_for_resource] and
    [Gtk.Picture.set_resource] should be used.

    [GtkPicture] displays an image at its natural size. See [Gtk.Image] if you
    want to display a fixed-size image, such as an icon.

    {b Sizing the paintable}

    You can influence how the paintable is displayed inside the [GtkPicture] by
    changing [Gtk.Picture:content-fit]. See [Gtk.ContentFit] for details.
    [Gtk.Picture:can-shrink] can be unset to make sure that paintables are never
    made smaller than their ideal size - but be careful if you do not know the
    size of the paintable in use (like when displaying user-loaded images). This
    can easily cause the picture to grow larger than the screen. And
    [Gtk.Widget:halign] and [Gtk.Widget:valign] can be used to make sure the
    paintable doesn't fill all available space but is instead displayed at its
    original size.

    {b CSS nodes}

    [GtkPicture] has a single CSS node with the name [picture].

    {b Accessibility}

    [GtkPicture] uses the [Gtk.AccessibleRole.img] role. *)

type t = [ `picture | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_picture_new"
(** Create a new Picture *)

external new_for_file : Ocgtk_gio.Gio.Wrappers.File.t option -> t
  = "ml_gtk_picture_new_for_file"
(** Create a new Picture *)

external new_for_filename : string option -> t
  = "ml_gtk_picture_new_for_filename"
(** Create a new Picture *)

external new_for_paintable : Ocgtk_gdk.Gdk.Wrappers.Paintable.t option -> t
  = "ml_gtk_picture_new_for_paintable"
(** Create a new Picture *)

external new_for_pixbuf :
  Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf.t option -> t
  = "ml_gtk_picture_new_for_pixbuf"
(** Create a new Picture *)

external new_for_resource : string option -> t
  = "ml_gtk_picture_new_for_resource"
(** Create a new Picture *)

(* Methods *)

external set_resource : t -> string option -> unit
  = "ml_gtk_picture_set_resource"
(** Makes [self] load and display the resource at the given [resource_path].

    This is a utility function that calls [Gtk.Picture.set_file]. *)

external set_pixbuf :
  t -> Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf.t option -> unit
  = "ml_gtk_picture_set_pixbuf"
(** Sets a [GtkPicture] to show a [GdkPixbuf].

    See [Gtk.Picture.new_for_pixbuf] for details.

    This is a utility function that calls [Gtk.Picture.set_paintable]. *)

external set_paintable : t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t option -> unit
  = "ml_gtk_picture_set_paintable"
(** Makes [self] display the given [paintable].

    If [paintable] is [NULL], nothing will be displayed.

    See [Gtk.Picture.new_for_paintable] for details. *)

external set_keep_aspect_ratio : t -> bool -> unit
  = "ml_gtk_picture_set_keep_aspect_ratio"
(** If set to [TRUE], the [self] will render its contents according to their
    aspect ratio.

    That means that empty space may show up at the top/bottom or left/right of
    [self].

    If set to [FALSE] or if the contents provide no aspect ratio, the contents
    will be stretched over the picture's whole area. *)

external set_filename : t -> string option -> unit
  = "ml_gtk_picture_set_filename"
(** Makes [self] load and display the given [filename].

    This is a utility function that calls [Gtk.Picture.set_file].

    Note that this function should not be used with untrusted data. Use a proper
    image loading framework such as libglycin, which can load many image formats
    into a [GdkTexture], and then use [Gtk.Image.set_from_paintable]. *)

external set_file : t -> Ocgtk_gio.Gio.Wrappers.File.t option -> unit
  = "ml_gtk_picture_set_file"
(** Makes [self] load and display [file].

    See [Gtk.Picture.new_for_file] for details.

    Note that this function should not be used with untrusted data. Use a proper
    image loading framework such as libglycin, which can load many image formats
    into a [GdkTexture], and then use [Gtk.Image.set_from_paintable]. *)

external set_content_fit : t -> Gtk_enums.contentfit -> unit
  = "ml_gtk_picture_set_content_fit"
(** Sets how the content should be resized to fit the [GtkPicture].

    See [Gtk.ContentFit] for details. *)

external set_can_shrink : t -> bool -> unit = "ml_gtk_picture_set_can_shrink"
(** If set to [TRUE], the [self] can be made smaller than its contents.

    The contents will then be scaled down when rendering.

    If you want to still force a minimum size manually, consider using
    [Gtk.Widget.set_size_request].

    Also of note is that a similar function for growing does not exist because
    the grow behavior can be controlled via [Gtk.Widget.set_halign] and
    [Gtk.Widget.set_valign]. *)

external set_alternative_text : t -> string option -> unit
  = "ml_gtk_picture_set_alternative_text"
(** Sets an alternative textual description for the picture contents.

    It is equivalent to the “alt” attribute for images on websites.

    This text will be made available to accessibility tools.

    If the picture cannot be described textually, set this property to [NULL].
*)

external get_paintable : t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t option
  = "ml_gtk_picture_get_paintable"
(** Gets the [GdkPaintable] being displayed by the [GtkPicture]. *)

external get_keep_aspect_ratio : t -> bool
  = "ml_gtk_picture_get_keep_aspect_ratio"
(** Returns whether the [GtkPicture] preserves its contents aspect ratio. *)

external get_file : t -> Ocgtk_gio.Gio.Wrappers.File.t option
  = "ml_gtk_picture_get_file"
(** Gets the [GFile] currently displayed if [self] is displaying a file.

    If [self] is not displaying a file, for example when
    [Gtk.Picture.set_paintable] was used, then [NULL] is returned. *)

external get_content_fit : t -> Gtk_enums.contentfit
  = "ml_gtk_picture_get_content_fit"
(** Returns the fit mode for the content of the [GtkPicture].

    See [Gtk.ContentFit] for details. *)

external get_can_shrink : t -> bool = "ml_gtk_picture_get_can_shrink"
(** Returns whether the [GtkPicture] respects its contents size. *)

external get_alternative_text : t -> string option
  = "ml_gtk_picture_get_alternative_text"
(** Gets the alternative textual description of the picture.

    The returned string will be [NULL] if the picture cannot be described
    textually. *)

(* Properties *)
