(** Refers to pixel data in various forms.

    Its methods, signals and properties are on {!class-type-texture_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Texture}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Texture].}

    Implements:
    - {{!Ocgdk.Paintable.class-type-paintable_t}Ocgdk.Paintable}
    - {{!Ocgio.Icon.class-type-icon_t}Ocgio.Icon}
    - {{!Ocgio.Loadable_icon.class-type-loadable_icon_t}Ocgio.Loadable_icon}

    Refers to pixel data in various forms.

    It is primarily meant for pixel data that will not change over multiple
    frames, and will be used for a long time.

    There are various ways to create [GdkTexture] objects from a
    {{!Ocgdkpixbuf.Pixbuf.class-type-pixbuf_t}[GdkPixbuf.Pixbuf]}, or from bytes
    stored in memory, a file, or a
    {{!Ocgio.Resource.class-type-resource_t}[Gio.Resource]}.

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
class type texture_t = object
  inherit Paintable.paintable_t
  inherit Ocgio.Icon.icon_t
  inherit Ocgio.Loadable_icon.loadable_icon_t

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_texture : Raw.Texture.t
end

class texture : Raw.Texture.t -> texture_t
(** Wraps a raw handle of {!Ocgdk.Raw.Texture.t}. *)

(** {1:description Description}

    Refers to pixel data in various forms.

    It is primarily meant for pixel data that will not change over multiple
    frames, and will be used for a long time.

    There are various ways to create [GdkTexture] objects from a
    {{!Ocgdkpixbuf.Pixbuf.class-type-pixbuf_t}[GdkPixbuf.Pixbuf]}, or from bytes
    stored in memory, a file, or a
    {{!Ocgio.Resource.class-type-resource_t}[Gio.Resource]}.

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

(** {1:constructors Constructors} *)

val new_for_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t -> texture_t
(** Creates a new texture object representing the [GdkPixbuf].

    This function is threadsafe, so that you can e.g. use GTask and
    [Gio.Task.run_in_thread] to avoid blocking the main thread while loading a
    big image. *)

val new_from_bytes : Glib_bytes.t -> (texture_t, GError.t) result
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

val new_from_file : Ocgio.File.file_t -> (texture_t, GError.t) result
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

val new_from_filename : string -> (texture_t, GError.t) result
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

val new_from_resource : string -> texture_t
(** Creates a new texture by loading an image from a resource.

    The file format is detected automatically. The supported formats are PNG,
    JPEG and TIFF, though more formats might be available.

    It is a fatal error if [resource_path] does not specify a valid image
    resource and the program will abort if that happens. If you are unsure about
    the validity of a resource, use [Gdk.Texture.new_from_file] to load it.

    This function is threadsafe, so that you can e.g. use GTask and
    [Gio.Task.run_in_thread] to avoid blocking the main thread while loading a
    big image. *)
