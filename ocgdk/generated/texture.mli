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
  (** Returns the color state associated with the texture. *)

  method get_format : unit -> Enums.memoryformat
  (** Gets the memory format most closely associated with the data of the
      texture.

      Note that it may not be an exact match for texture data stored on the GPU
      or with compression.

      The format can give an indication about the bit depth and opacity of the
      texture and is useful to determine the best format for downloading the
      texture. *)

  method get_height : unit -> int
  (** Returns the height of the [texture], in pixels. *)

  method get_width : unit -> int
  (** Returns the width of [texture], in pixels. *)

  method save_to_png : string -> bool
  (** Store the given [texture] to the [filename] as a PNG file.

      This is a utility function intended for debugging and testing. If you want
      more control over formats, proper error handling or want to store to a
      [Gio.File] or other location, you might want to use
      [Gdk.Texture.save_to_png_bytes] or look into the libglycin library. *)

  method save_to_png_bytes : unit -> Glib_bytes.t
  (** Store the given [texture] in memory as a PNG file.

      Use [Gdk.Texture.new_from_bytes] to read it back.

      If you want to serialize a texture, this is a convenient and portable way
      to do that.

      If you need more control over the generated image, such as attaching
      metadata, you should look into an image handling library such as the
      libglycin library.

      If you are dealing with high dynamic range float data, you might also want
      to consider [Gdk.Texture.save_to_tiff_bytes] instead. *)

  method save_to_tiff : string -> bool
  (** Store the given [texture] to the [filename] as a TIFF file.

      GTK will attempt to store data without loss. *)

  method save_to_tiff_bytes : unit -> Glib_bytes.t
  (** Store the given [texture] in memory as a TIFF file.

      Use [Gdk.Texture.new_from_bytes] to read it back.

      This function is intended to store a representation of the texture's data
      that is as accurate as possible. This is particularly relevant when
      working with high dynamic range images and floating-point texture data.

      If that is not your concern and you are interested in a smaller size and a
      more portable format, you might want to use
      [Gdk.Texture.save_to_png_bytes]. *)

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
