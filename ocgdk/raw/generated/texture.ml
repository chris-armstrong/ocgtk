(* GENERATED CODE - DO NOT EDIT *)
(* Texture: Texture *)

(** Refers to pixel data in various forms.

    It is primarily meant for pixel data that will not change over multiple
    frames, and will be used for a long time.

    There are various ways to create [GdkTexture] objects from a
    {{!Ocgdkpixbuf.Raw.Pixbuf}[GdkPixbuf.Pixbuf]}, or from bytes stored in
    memory, a file, or a {{!Ocgio.Raw.Resource}[Gio.Resource]}.

    The ownership of the pixel data is transferred to the [GdkTexture] instance;
    you can only make a copy of it, via [Gdk.Texture.download].

    [GdkTexture] is an immutable object: That means you cannot change anything
    about it other than increasing the reference count via [GObject.Object.ref],
    and consequently, it is a threadsafe object.

    GDK provides a number of threadsafe texture loading functions:
    {{!Ocgdk.Raw.Texture.val-new_from_resource}[Gdk.Texture.new_from_resource]},
    {{!Ocgdk.Raw.Texture.val-new_from_bytes}[Gdk.Texture.new_from_bytes]},
    {{!Ocgdk.Raw.Texture.val-new_from_file}[Gdk.Texture.new_from_file]},
    {{!Ocgdk.Raw.Texture.val-new_from_filename}[Gdk.Texture.new_from_filename]},
    {{!Ocgdk.Raw.Texture.val-new_for_pixbuf}[Gdk.Texture.new_for_pixbuf]}. Note
    that these are meant for loading icons and resources that are shipped with
    the toolkit or application. It is recommended that you use a dedicated image
    loading framework such as {{:https://lib.rs/crates/glycin}glycin}, if you
    need to load untrusted image data.

    The class built on this module is in {!Ocgdk.Texture}. *)

type t = [ `texture | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_texture_get_type"

external new_for_pixbuf : Ocgdkpixbuf_raw.Pixbuf.t -> t
  = "ml_gdk_texture_new_for_pixbuf"
(** Creates a new texture object representing the [GdkPixbuf].

    This function is threadsafe, so that you can e.g. use GTask and
    [Gio.Task.run_in_thread] to avoid blocking the main thread while loading a
    big image. *)

external new_from_bytes : Glib_bytes.t -> (t, GError.t) result
  = "ml_gdk_texture_new_from_bytes"
(** Creates a new texture by loading an image from memory,

    The file format is detected automatically. The supported formats are PNG,
    JPEG and TIFF, though more formats might be available.

    If [None] is returned, then [error] will be set.

    This function is threadsafe, so that you can e.g. use GTask and
    [Gio.Task.run_in_thread] to avoid blocking the main thread while loading a
    big image.

    Note that this function should not be used with untrusted data. Use a proper
    image loading framework such as libglycin, which can load many image formats
    into a [GdkTexture]. *)

external new_from_file : Ocgio_raw.File.t -> (t, GError.t) result
  = "ml_gdk_texture_new_from_file"
(** Creates a new texture by loading an image from a file.

    The file format is detected automatically. The supported formats are PNG,
    JPEG and TIFF, though more formats might be available.

    If [None] is returned, then [error] will be set.

    This function is threadsafe, so that you can e.g. use GTask and
    [Gio.Task.run_in_thread] to avoid blocking the main thread while loading a
    big image.

    Note that this function should not be used with untrusted data. Use a proper
    image loading framework such as libglycin, which can load many image formats
    into a [GdkTexture]. *)

external new_from_filename : string -> (t, GError.t) result
  = "ml_gdk_texture_new_from_filename"
(** Creates a new texture by loading an image from a file.

    The file format is detected automatically. The supported formats are PNG,
    JPEG and TIFF, though more formats might be available.

    If [None] is returned, then [error] will be set.

    This function is threadsafe, so that you can e.g. use GTask and
    [Gio.Task.run_in_thread] to avoid blocking the main thread while loading a
    big image.

    Note that this function should not be used with untrusted data. Use a proper
    image loading framework such as libglycin, which can load many image formats
    into a [GdkTexture]. *)

external new_from_resource : string -> t = "ml_gdk_texture_new_from_resource"
(** Creates a new texture by loading an image from a resource.

    The file format is detected automatically. The supported formats are PNG,
    JPEG and TIFF, though more formats might be available.

    It is a fatal error if [resource_path] does not specify a valid image
    resource and the program will abort if that happens. If you are unsure about
    the validity of a resource, use
    {{!Ocgdk.Raw.Texture.val-new_from_file}[Gdk.Texture.new_from_file]} to load
    it.

    This function is threadsafe, so that you can e.g. use GTask and
    [Gio.Task.run_in_thread] to avoid blocking the main thread while loading a
    big image. *)

(* Methods *)

external save_to_tiff_bytes : t -> Glib_bytes.t
  = "ml_gdk_texture_save_to_tiff_bytes"
(** Store the given [texture] in memory as a TIFF file.

    Use {{!Ocgdk.Raw.Texture.val-new_from_bytes}[Gdk.Texture.new_from_bytes]} to
    read it back.

    This function is intended to store a representation of the texture's data
    that is as accurate as possible. This is particularly relevant when working
    with high dynamic range images and floating-point texture data.

    If that is not your concern and you are interested in a smaller size and a
    more portable format, you might want to use
    {{!Ocgdk.Raw.Texture.val-save_to_png_bytes}[Gdk.Texture.save_to_png_bytes]}.
*)

external save_to_tiff : t -> string -> bool = "ml_gdk_texture_save_to_tiff"
(** Store the given [texture] to the [filename] as a TIFF file.

    GTK will attempt to store data without loss. *)

external save_to_png_bytes : t -> Glib_bytes.t
  = "ml_gdk_texture_save_to_png_bytes"
(** Store the given [texture] in memory as a PNG file.

    Use {{!Ocgdk.Raw.Texture.val-new_from_bytes}[Gdk.Texture.new_from_bytes]} to
    read it back.

    If you want to serialize a texture, this is a convenient and portable way to
    do that.

    If you need more control over the generated image, such as attaching
    metadata, you should look into an image handling library such as the
    libglycin library.

    If you are dealing with high dynamic range float data, you might also want
    to consider
    {{!Ocgdk.Raw.Texture.val-save_to_tiff_bytes}[Gdk.Texture.save_to_tiff_bytes]}
    instead. *)

external save_to_png : t -> string -> bool = "ml_gdk_texture_save_to_png"
(** Store the given [texture] to the [filename] as a PNG file.

    This is a utility function intended for debugging and testing. If you want
    more control over formats, proper error handling or want to store to a
    {{!Ocgio.Raw.File}[Gio.File]} or other location, you might want to use
    {{!Ocgdk.Raw.Texture.val-save_to_png_bytes}[Gdk.Texture.save_to_png_bytes]}
    or look into the libglycin library. *)

external get_width : t -> int = "ml_gdk_texture_get_width"
(** Returns the width of [texture], in pixels. *)

external get_height : t -> int = "ml_gdk_texture_get_height"
(** Returns the height of the [texture], in pixels. *)

external get_format : t -> Ocgdk_enums.memoryformat
  = "ml_gdk_texture_get_format"
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
