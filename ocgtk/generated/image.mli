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
 Its methods, signals and properties are on {!class-type-image_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Image}."]

(** The methods, signals and properties of a [GtkImage]. *)
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
  method set_use_fallback : bool -> unit
  method as_image : Raw.Image.t
end

class image : Raw.Image.t -> image_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Image.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkImage], give one already wrapped. *)

val new_ : unit -> image_t
val new_from_file : string -> image_t
val new_from_gicon : Ocgio.Icon.icon_t -> image_t
val new_from_icon_name : string option -> image_t
val new_from_paintable : Ocgdk.Paintable.paintable_t option -> image_t
val new_from_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> image_t
val new_from_resource : string -> image_t
