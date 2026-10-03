(* GENERATED CODE - DO NOT EDIT *)
(* Texture: Texture *)

type t = [ `texture | `object_ ] Gobject.obj
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
    data. *)

external new_for_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf.t -> t
  = "ml_gdk_texture_new_for_pixbuf"
(** Create a new Texture *)

external new_from_bytes : Glib_bytes.t -> (t, GError.t) result
  = "ml_gdk_texture_new_from_bytes"
(** Create a new Texture *)

external new_from_file : Ocgtk_gio.Gio.Wrappers.File.t -> (t, GError.t) result
  = "ml_gdk_texture_new_from_file"
(** Create a new Texture *)

external new_from_filename : string -> (t, GError.t) result
  = "ml_gdk_texture_new_from_filename"
(** Create a new Texture *)

external new_from_resource : string -> t = "ml_gdk_texture_new_from_resource"
(** Create a new Texture *)

(* Methods *)

external save_to_tiff_bytes : t -> Glib_bytes.t
  = "ml_gdk_texture_save_to_tiff_bytes"
(** Store the given [texture] in memory as a TIFF file.

    Use [Gdk.Texture.new_from_bytes] to read it back.

    This function is intended to store a representation of the texture's data
    that is as accurate as possible. This is particularly relevant when working
    with high dynamic range images and floating-point texture data.

    If that is not your concern and you are interested in a smaller size and a
    more portable format, you might want to use [Gdk.Texture.save_to_png_bytes].
*)

external save_to_tiff : t -> string -> bool = "ml_gdk_texture_save_to_tiff"
(** Store the given [texture] to the [filename] as a TIFF file.

    GTK will attempt to store data without loss. *)

external save_to_png_bytes : t -> Glib_bytes.t
  = "ml_gdk_texture_save_to_png_bytes"
(** Store the given [texture] in memory as a PNG file.

    Use [Gdk.Texture.new_from_bytes] to read it back.

    If you want to serialize a texture, this is a convenient and portable way to
    do that.

    If you need more control over the generated image, such as attaching
    metadata, you should look into an image handling library such as the
    libglycin library.

    If you are dealing with high dynamic range float data, you might also want
    to consider [Gdk.Texture.save_to_tiff_bytes] instead. *)

external save_to_png : t -> string -> bool = "ml_gdk_texture_save_to_png"
(** Store the given [texture] to the [filename] as a PNG file.

    This is a utility function intended for debugging and testing. If you want
    more control over formats, proper error handling or want to store to a
    [Gio.File] or other location, you might want to use
    [Gdk.Texture.save_to_png_bytes] or look into the libglycin library. *)

external get_width : t -> int = "ml_gdk_texture_get_width"
(** Returns the width of [texture], in pixels. *)

external get_height : t -> int = "ml_gdk_texture_get_height"
(** Returns the height of the [texture], in pixels. *)

external get_format : t -> Gdk_enums.memoryformat = "ml_gdk_texture_get_format"
(** Gets the memory format most closely associated with the data of the texture.

    Note that it may not be an exact match for texture data stored on the GPU or
    with compression.

    The format can give an indication about the bit depth and opacity of the
    texture and is useful to determine the best format for downloading the
    texture. *)

external get_color_state : t -> Cicp_params_and__color_state.Color_state.t
  = "ml_gdk_texture_get_color_state"
(** Returns the color state associated with the texture. *)

(* Properties *)
