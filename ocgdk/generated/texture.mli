(** Refers to pixel data in various forms.

    It is primarily meant for pixel data that will not change over multiple
    frames, and will be used for a long time.

    There are various ways to create [GdkTexture] objects from a
    [GdkPixbuf.Pixbuf], or from bytes stored in memory, a file, or a
    [Gio.Resource].

    The ownership of the pixel data is transferred to the [GdkTexture] instance;
    you can only make a copy of it, via [Gdk.Texture.download].

    [GdkTexture] is an immutable object: That means you cannot change anything
    about it other than increasing the reference count via [GObject.Object.ref],
    and consequently, it is a threadsafe object.

    GDK provides a number of threadsafe texture loading functions:
    [Gdk.Texture.new_from_resource], [Gdk.Texture.new_from_bytes],
    [Gdk.Texture.new_from_file], [Gdk.Texture.new_from_filename],
    [Gdk.Texture.new_for_pixbuf]. Note that these are meant for loading icons
    and resources that are shipped with the toolkit or application. It is
    recommended that you use a dedicated image loading framework such as
    {{:https://lib.rs/crates/glycin}glycin}, if you need to load untrusted image
    data.

    Its methods, signals and properties are on {!class-type-texture_t}. The
    functions it is built on are in {!Ocgdk.Raw.Texture}. *)

(** The methods, signals and properties of a [GdkTexture]. *)
class type texture_t = object
  inherit Paintable.paintable_t
  inherit Ocgio.Icon.icon_t
  inherit Ocgio.Loadable_icon.loadable_icon_t
  method get_color_state : unit -> Raw.Color_state.t
  method get_format : unit -> Enums.memoryformat
  method get_height : unit -> int
  method get_width : unit -> int
  method save_to_png : string -> bool
  method save_to_png_bytes : unit -> Glib_bytes.t
  method save_to_tiff : string -> bool
  method save_to_tiff_bytes : unit -> Glib_bytes.t
  method as_texture : Raw.Texture.t
end

class texture : Raw.Texture.t -> texture_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Texture.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkTexture], give one already wrapped. *)

val new_for_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t -> texture_t
val new_from_bytes : Glib_bytes.t -> (texture_t, GError.t) result
val new_from_file : Ocgio.File.file_t -> (texture_t, GError.t) result
val new_from_filename : string -> (texture_t, GError.t) result
val new_from_resource : string -> texture_t
