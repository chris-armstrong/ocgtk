(* GENERATED CODE - DO NOT EDIT *)
(* Image: Image *)

type t = [ `image | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Displays an image.

    An example GtkImage

    Various kinds of object can be displayed as an image; most typically, you
    would load a [GdkTexture] from a file, using the convenience function
    [Gtk.Image.new_from_file], for instance:

    {[
    GtkWidget *image = gtk_image_new_from_file (“myfile.png”);
    ]}

    If the file isn’t loaded successfully, the image will contain a “broken
    image” icon similar to that used in many web browsers.

    If you want to handle errors in loading the file yourself, for example by
    displaying an error message, then load the image with an image loading
    framework such as libglycin, then create the [GtkImage] with
    [Gtk.Image.new_from_paintable].

    Sometimes an application will want to avoid depending on external data
    files, such as image files. See the documentation of [GResource] inside GIO,
    for details. In this case, [Gtk.Image:resource],
    [Gtk.Image.new_from_resource], and [Gtk.Image.set_from_resource] should be
    used.

    [GtkImage] displays its image as an icon, with a size that is determined by
    the application. See [Gtk.Picture] if you want to show an image at is actual
    size.

    {b CSS nodes}

    [GtkImage] has a single CSS node with the name [image]. The style classes
    [.normal-icons] or [.large-icons] may appear, depending on the
    [Gtk.Image:icon-size] property.

    {b Accessibility}

    [GtkImage] uses the [Gtk.AccessibleRole.img] role. *)

external new_ : unit -> t = "ml_gtk_image_new"
(** Create a new Image *)

external new_from_file : string -> t = "ml_gtk_image_new_from_file"
(** Create a new Image *)

external new_from_gicon : Ocgtk_gio.Gio.Wrappers.Icon.t -> t
  = "ml_gtk_image_new_from_gicon"
(** Create a new Image *)

external new_from_icon_name : string option -> t
  = "ml_gtk_image_new_from_icon_name"
(** Create a new Image *)

external new_from_paintable : Ocgtk_gdk.Gdk.Wrappers.Paintable.t option -> t
  = "ml_gtk_image_new_from_paintable"
(** Create a new Image *)

external new_from_pixbuf :
  Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf.t option -> t
  = "ml_gtk_image_new_from_pixbuf"
(** Create a new Image *)

external new_from_resource : string -> t = "ml_gtk_image_new_from_resource"
(** Create a new Image *)

(* Methods *)

external set_pixel_size : t -> int -> unit = "ml_gtk_image_set_pixel_size"
(** Sets the pixel size to use for named icons.

    If the pixel size is set to a value != -1, it is used instead of the icon
    size set by [Gtk.Image.set_icon_size]. *)

external set_icon_size : t -> Gtk_enums.iconsize -> unit
  = "ml_gtk_image_set_icon_size"
(** Suggests an icon size to the theme for named icons. *)

external set_from_resource : t -> string option -> unit
  = "ml_gtk_image_set_from_resource"
(** Sets a [GtkImage] to show a resource.

    See [Gtk.Image.new_from_resource] for details. *)

external set_from_pixbuf :
  t -> Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf.t option -> unit
  = "ml_gtk_image_set_from_pixbuf"
(** Sets a [GtkImage] to show a [GdkPixbuf].

    See [Gtk.Image.new_from_pixbuf] for details.

    Note: This is a helper for [Gtk.Image.set_from_paintable], and you can't get
    back the exact pixbuf once this is called, only a paintable. *)

external set_from_paintable :
  t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t option -> unit
  = "ml_gtk_image_set_from_paintable"
(** Sets a [GtkImage] to show a [GdkPaintable].

    See [Gtk.Image.new_from_paintable] for details. *)

external set_from_icon_name : t -> string option -> unit
  = "ml_gtk_image_set_from_icon_name"
(** Sets a [GtkImage] to show a named icon.

    See [Gtk.Image.new_from_icon_name] for details. *)

external set_from_gicon : t -> Ocgtk_gio.Gio.Wrappers.Icon.t -> unit
  = "ml_gtk_image_set_from_gicon"
(** Sets a [GtkImage] to show a [GIcon].

    See [Gtk.Image.new_from_gicon] for details. *)

external set_from_file : t -> string option -> unit
  = "ml_gtk_image_set_from_file"
(** Sets a [GtkImage] to show a file.

    See [Gtk.Image.new_from_file] for details.

    Note that this function should not be used with untrusted data. Use a proper
    image loading framework such as libglycin, which can load many image formats
    into a [GdkTexture], and then use [Gtk.Image.set_from_paintable]. *)

external get_storage_type : t -> Gtk_enums.imagetype
  = "ml_gtk_image_get_storage_type"
(** Gets the type of representation being used by the [GtkImage] to store image
    data.

    If the [GtkImage] has no image data, the return value will be
    [GTK_IMAGE_EMPTY]. *)

external get_pixel_size : t -> int = "ml_gtk_image_get_pixel_size"
(** Gets the pixel size used for named icons. *)

external get_paintable : t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t option
  = "ml_gtk_image_get_paintable"
(** Gets the image [GdkPaintable] being displayed by the [GtkImage].

    The storage type of the image must be [GTK_IMAGE_EMPTY] or
    [GTK_IMAGE_PAINTABLE] (see [Gtk.Image.get_storage_type]). The caller of this
    function does not own a reference to the returned paintable. *)

external get_icon_size : t -> Gtk_enums.iconsize = "ml_gtk_image_get_icon_size"
(** Gets the icon size used by the [image] when rendering icons. *)

external get_icon_name : t -> string option = "ml_gtk_image_get_icon_name"
(** Gets the icon name and size being displayed by the [GtkImage].

    The storage type of the image must be [GTK_IMAGE_EMPTY] or
    [GTK_IMAGE_ICON_NAME] (see [Gtk.Image.get_storage_type]). The returned
    string is owned by the [GtkImage] and should not be freed. *)

external get_gicon : t -> Ocgtk_gio.Gio.Wrappers.Icon.t option
  = "ml_gtk_image_get_gicon"
(** Gets the [GIcon] being displayed by the [GtkImage].

    The storage type of the image must be [GTK_IMAGE_EMPTY] or [GTK_IMAGE_GICON]
    (see [Gtk.Image.get_storage_type]). The caller of this function does not own
    a reference to the returned [GIcon]. *)

external clear : t -> unit = "ml_gtk_image_clear"
(** Resets the image to be empty. *)

(* Properties *)

external get_use_fallback : t -> bool = "ml_gtk_image_get_use_fallback"
(** Get property: use-fallback *)

external set_use_fallback : t -> bool -> unit = "ml_gtk_image_set_use_fallback"
(** Set property: use-fallback *)
