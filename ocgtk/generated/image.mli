[@@@ocaml.text
"Displays an image.\n\n\
 An example GtkImage\n\n\
 Various kinds of object can be displayed as an image; most typically,\n\
 you would load a [GdkTexture] from a file, using the convenience function\n\
 [Gtk.Image.new_from_file], for instance:\n\n\
 {[\n\
 GtkWidget *image = gtk_image_new_from_file (\"myfile.png\");\n\
 ]}\n\n\
 If the file isn’t loaded successfully, the image will contain a\n\
 “broken image” icon similar to that used in many web browsers.\n\n\
 If you want to handle errors in loading the file yourself, for example\n\
 by displaying an error message, then load the image with an image\n\
 loading framework such as libglycin, then create the [GtkImage] with\n\
 [Gtk.Image.new_from_paintable].\n\n\
 Sometimes an application will want to avoid depending on external data\n\
 files, such as image files. See the documentation of [GResource] inside\n\
 GIO, for details. In this case, [Gtk.Image:resource],\n\
 [Gtk.Image.new_from_resource], and [Gtk.Image.set_from_resource]\n\
 should be used.\n\n\
 [GtkImage] displays its image as an icon, with a size that is determined\n\
 by the application. See [Gtk.Picture] if you want to show an image\n\
 at is actual size.\n\n\
 {b CSS nodes}\n\n\
 [GtkImage] has a single CSS node with the name [image]. The style classes\n\
 [.normal-icons] or [.large-icons] may appear, depending on the\n\
 [Gtk.Image:icon-size] property.\n\n\
 {b Accessibility}\n\n\
 [GtkImage] uses the [Gtk.AccessibleRole.img] role.\n\n\
 Its methods, signals and properties are on {!class-type-image_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Image}."]

(** The methods, signals and properties of a [Image]. *)
class type image_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method clear : unit -> unit
  (** Resets the image to be empty. *)

  method get_gicon : unit -> Ocgio.Icon.icon_t option
  (** Gets the [GIcon] being displayed by the [GtkImage].

      The storage type of the image must be [GTK_IMAGE_EMPTY] or
      [GTK_IMAGE_GICON] (see [Gtk.Image.get_storage_type]). The caller of this
      function does not own a reference to the returned [GIcon]. *)

  method get_icon_name : unit -> string option
  (** Gets the icon name and size being displayed by the [GtkImage].

      The storage type of the image must be [GTK_IMAGE_EMPTY] or
      [GTK_IMAGE_ICON_NAME] (see [Gtk.Image.get_storage_type]). The returned
      string is owned by the [GtkImage] and should not be freed. *)

  method get_icon_size : unit -> Enums.iconsize
  (** Gets the icon size used by the [image] when rendering icons. *)

  method get_paintable : unit -> Ocgdk.Paintable.paintable_t option
  (** Gets the image [GdkPaintable] being displayed by the [GtkImage].

      The storage type of the image must be [GTK_IMAGE_EMPTY] or
      [GTK_IMAGE_PAINTABLE] (see [Gtk.Image.get_storage_type]). The caller of
      this function does not own a reference to the returned paintable. *)

  method get_pixel_size : unit -> int
  (** Gets the pixel size used for named icons. *)

  method get_storage_type : unit -> Enums.imagetype
  (** Gets the type of representation being used by the [GtkImage] to store
      image data.

      If the [GtkImage] has no image data, the return value will be
      [GTK_IMAGE_EMPTY]. *)

  method set_from_file : string option -> unit
  (** Sets a [GtkImage] to show a file.

      See [Gtk.Image.new_from_file] for details.

      Note that this function should not be used with untrusted data. Use a
      proper image loading framework such as libglycin, which can load many
      image formats into a [GdkTexture], and then use
      [Gtk.Image.set_from_paintable]. *)

  method set_from_gicon : Ocgio.Icon.icon_t -> unit
  (** Sets a [GtkImage] to show a [GIcon].

      See [Gtk.Image.new_from_gicon] for details. *)

  method set_from_icon_name : string option -> unit
  (** Sets a [GtkImage] to show a named icon.

      See [Gtk.Image.new_from_icon_name] for details. *)

  method set_from_paintable : Ocgdk.Paintable.paintable_t option -> unit
  (** Sets a [GtkImage] to show a [GdkPaintable].

      See [Gtk.Image.new_from_paintable] for details. *)

  method set_from_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit
  (** Sets a [GtkImage] to show a [GdkPixbuf].

      See [Gtk.Image.new_from_pixbuf] for details.

      Note: This is a helper for [Gtk.Image.set_from_paintable], and you can't
      get back the exact pixbuf once this is called, only a paintable. *)

  method set_from_resource : string option -> unit
  (** Sets a [GtkImage] to show a resource.

      See [Gtk.Image.new_from_resource] for details. *)

  method set_icon_size : Enums.iconsize -> unit
  (** Suggests an icon size to the theme for named icons. *)

  method set_pixel_size : int -> unit
  (** Sets the pixel size to use for named icons.

      If the pixel size is set to a value != -1, it is used instead of the icon
      size set by [Gtk.Image.set_icon_size]. *)

  method use_fallback : bool
  (** Whether the icon displayed in the [GtkImage] will use standard icon names
      fallback.

      The value of this property is only relevant for images of type
      [GTK_IMAGE_ICON_NAME] and [GTK_IMAGE_GICON]. *)

  method set_use_fallback : bool -> unit
  (** Whether the icon displayed in the [GtkImage] will use standard icon names
      fallback.

      The value of this property is only relevant for images of type
      [GTK_IMAGE_ICON_NAME] and [GTK_IMAGE_GICON]. *)

  method as_image : Raw.Image.t
end

class image : Raw.Image.t -> image_t
(** Wraps a raw handle of {!Ocgtk.Raw.Image.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> image_t
(** Creates a new empty [GtkImage] widget. *)

val new_from_file : string -> image_t
(** Creates a new [GtkImage] displaying the file [filename].

    If the file isn’t found or can’t be loaded, the resulting [GtkImage] will
    display a “broken image” icon. This function never returns [NULL], it always
    returns a valid [GtkImage] widget.

    If you need to detect failures to load the file, use an image loading
    framework such as libglycin to load the file yourself, then create the
    [GtkImage] from the texture.

    The storage type (see [Gtk.Image.get_storage_type]) of the returned image is
    not defined, it will be whatever is appropriate for displaying the file. *)

val new_from_gicon : Ocgio.Icon.icon_t -> image_t
(** Creates a [GtkImage] displaying an icon from the current icon theme.

    If the icon name isn’t known, a “broken image” icon will be displayed
    instead. If the current icon theme is changed, the icon will be updated
    appropriately. *)

val new_from_icon_name : string option -> image_t
(** Creates a [GtkImage] displaying an icon from the current icon theme.

    If the icon name isn’t known, a “broken image” icon will be displayed
    instead. If the current icon theme is changed, the icon will be updated
    appropriately. *)

val new_from_paintable : Ocgdk.Paintable.paintable_t option -> image_t
(** Creates a new [GtkImage] displaying [paintable].

    The [GtkImage] does not assume a reference to the paintable; you still need
    to unref it if you own references. [GtkImage] will add its own reference
    rather than adopting yours.

    The [GtkImage] will track changes to the [paintable] and update its size and
    contents in response to it.

    Note that paintables are still subject to the icon size that is set on the
    image. If you want to display a paintable at its intrinsic size, use
    [Gtk.Picture] instead.

    If [paintable] is a [Gtk.SymbolicPaintable], then it will be recolored with
    the symbolic palette from the theme. *)

val new_from_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> image_t
(** Creates a new [GtkImage] displaying [pixbuf].

    The [GtkImage] does not assume a reference to the pixbuf; you still need to
    unref it if you own references. [GtkImage] will add its own reference rather
    than adopting yours.

    This is a helper for [Gtk.Image.new_from_paintable], and you can't get back
    the exact pixbuf once this is called, only a texture.

    Note that this function just creates an [GtkImage] from the pixbuf. The
    [GtkImage] created will not react to state changes. Should you want that,
    you should use [Gtk.Image.new_from_icon_name]. *)

val new_from_resource : string -> image_t
(** Creates a new [GtkImage] displaying the resource file [resource_path].

    If the file isn’t found or can’t be loaded, the resulting [GtkImage] will
    display a “broken image” icon. This function never returns [NULL], it always
    returns a valid [GtkImage] widget.

    If you need to detect failures to load the file, use an image loading
    framework such as libglycin to load the file yourself, then create the
    [GtkImage] from the texture.

    The storage type (see [Gtk.Image.get_storage_type]) of the returned image is
    not defined, it will be whatever is appropriate for displaying the file. *)
