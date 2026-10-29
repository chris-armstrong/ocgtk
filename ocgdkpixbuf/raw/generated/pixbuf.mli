(* GENERATED CODE - DO NOT EDIT *)
(* Pixbuf: Pixbuf *)

[@@@ocaml.text
"A pixel buffer.\n\n\
 [GdkPixbuf] contains information about an image's pixel data,\n\
 its color space, bits per sample, width and height, and the\n\
 rowstride (the number of bytes between the start of one row\n\
 and the start of the next).\n\n\
 {b Creating new [GdkPixbuf]}\n\n\
 The most basic way to create a pixbuf is to wrap an existing pixel\n\
 buffer with a {{!Ocgdkpixbuf.Raw.Pixbuf}[GdkPixbuf.Pixbuf]} instance. You can \
 use the\n\
 [GdkPixbuf.Pixbuf.new_from_data] function to do this.\n\n\
 Every time you create a new [GdkPixbuf] instance for some data, you\n\
 will need to specify the destroy notification function that will be\n\
 called when the data buffer needs to be freed; this will happen when\n\
 a [GdkPixbuf] is finalized by the reference counting functions. If\n\
 you have a chunk of static data compiled into your application, you\n\
 can pass in [None] as the destroy notification function so that the\n\
 data will not be freed.\n\n\
 The {{!Ocgdkpixbuf.Raw.Pixbuf.val-new_}[GdkPixbuf.Pixbuf.new]} constructor \
 function can be used\n\
 as a convenience to create a pixbuf with an empty buffer; this is\n\
 equivalent to allocating a data buffer using [malloc()] and then\n\
 wrapping it with [gdk_pixbuf_new_from_data()]. The [gdk_pixbuf_new()]\n\
 function will compute an optimal rowstride so that rendering can be\n\
 performed with an efficient algorithm.\n\n\
 You can also copy an existing pixbuf with the \
 {{!Ocgdkpixbuf.Raw.Pixbuf.val-copy}[Pixbuf.copy]}\n\
 function. This is not the same as just acquiring a reference to\n\
 the old pixbuf instance: the copy function will actually duplicate\n\
 the pixel data in memory and create a new {{!Ocgdkpixbuf.Raw.Pixbuf}[Pixbuf]} \
 instance\n\
 for it.\n\n\
 {b Reference counting}\n\n\
 [GdkPixbuf] structures are reference counted. This means that an\n\
 application can share a single pixbuf among many parts of the\n\
 code. The resources associated with a\n\
 [GdkPixbuf] will be freed when its reference count drops to zero.\n\
 Newly-created [GdkPixbuf] instances start with a reference count\n\
 of one.\n\n\
 {b Image Data}\n\n\
 Image data in a pixbuf is stored in memory in an uncompressed,\n\
 packed format. Rows in the image are stored top to bottom, and\n\
 in each row pixels are stored from left to right.\n\n\
 There may be padding at the end of a row.\n\n\
 The \"rowstride\" value of a pixbuf, as returned by \
 {{!Ocgdkpixbuf.Raw.Pixbuf.val-get_rowstride}[GdkPixbuf.Pixbuf.get_rowstride]},\n\
 indicates the number of bytes between rows.\n\n\
 {b NOTE}: If you are copying raw pixbuf data with [memcpy()] note that the\n\
 last row in the pixbuf may not be as wide as the full rowstride, but rather\n\
 just as wide as the pixel data needs to be; that is: it is unsafe to do\n\
 [memcpy (dest, pixels, rowstride * height)] to copy a whole pixbuf. Use\n\
 {{!Ocgdkpixbuf.Raw.Pixbuf.val-copy}[GdkPixbuf.Pixbuf.copy]} instead, or \
 compute the width in bytes of the\n\
 last row as:\n\n\
 {[\n\
 last_row = width * ((n_channels * bits_per_sample + 7) / 8);\n\
 ]}\n\n\
 The same rule applies when iterating over each row of a [GdkPixbuf] pixels\n\
 array.\n\n\
 The following code illustrates a simple [put_pixel()]\n\
 function for RGB pixbufs with 8 bits per channel with an alpha\n\
 channel.\n\n\
 {[\n\
 static void\n\
 put_pixel (GdkPixbuf *pixbuf,\n\
\           int x,\n\
 \t   int y,\n\
 \t   guchar red,\n\
 \t   guchar green,\n\
 \t   guchar blue,\n\
 \t   guchar alpha)\n\
 {\n\
\  int n_channels = gdk_pixbuf_get_n_channels (pixbuf);\n\n\
\  // Ensure that the pixbuf is valid\n\
\  g_assert (gdk_pixbuf_get_colorspace (pixbuf) == GDK_COLORSPACE_RGB);\n\
\  g_assert (gdk_pixbuf_get_bits_per_sample (pixbuf) == 8);\n\
\  g_assert (gdk_pixbuf_get_has_alpha (pixbuf));\n\
\  g_assert (n_channels == 4);\n\n\
\  int width = gdk_pixbuf_get_width (pixbuf);\n\
\  int height = gdk_pixbuf_get_height (pixbuf);\n\n\
\  // Ensure that the coordinates are in a valid range\n\
\  g_assert (x >= 0 && x < width);\n\
\  g_assert (y >= 0 && y < height);\n\n\
\  int rowstride = gdk_pixbuf_get_rowstride (pixbuf);\n\n\
\  // The pixel buffer in the GdkPixbuf instance\n\
\  guchar *pixels = gdk_pixbuf_get_pixels (pixbuf);\n\n\
\  // The pixel we wish to modify\n\
\  guchar *p = pixels + y * rowstride + x * n_channels;\n\
\  p[0] = red;\n\
\  p[1] = green;\n\
\  p[2] = blue;\n\
\  p[3] = alpha;\n\
 }\n\
 ]}\n\n\
 {b Loading images}\n\n\
 The [GdkPixBuf] class provides a simple mechanism for loading\n\
 an image from a file in synchronous and asynchronous fashion.\n\n\
 For GUI applications, it is recommended to use the asynchronous\n\
 stream API to avoid blocking the control flow of the application.\n\n\
 Additionally, [GdkPixbuf] provides the [GdkPixbuf.PixbufLoader`]\n\
 API for progressive image loading.\n\n\
 {b Saving images}\n\n\
 The [GdkPixbuf] class provides methods for saving image data in\n\
 a number of file formats. The formatted data can be written to a\n\
 file or to a memory buffer. [GdkPixbuf] can also call a user-defined\n\
 callback on the data, which allows to e.g. write the image\n\
 to a socket or store it in a database.\n\n\
 The class built on this module is in {!Ocgdkpixbuf.Pixbuf}."]

type t = [ `pixbuf | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_pixbuf_pixbuf_get_type"

external new_ : Ocgdkpixbuf_enums.colorspace -> bool -> int -> int -> int -> t
  = "ml_gdk_pixbuf_new"
(** Creates a new [GdkPixbuf] structure and allocates a buffer for it.

    If the allocation of the buffer failed, this function will return [None].

    The buffer has an optimal rowstride. Note that the buffer is not cleared;
    you will have to fill it completely yourself. *)

external new_from_bytes :
  Glib_bytes.t ->
  Ocgdkpixbuf_enums.colorspace ->
  bool ->
  int ->
  int ->
  int ->
  int ->
  t
  = "ml_gdk_pixbuf_new_from_bytes_bytecode"
    "ml_gdk_pixbuf_new_from_bytes_native"
(** Creates a new [GdkPixbuf] out of in-memory readonly image data.

    Currently only RGB images with 8 bits per sample are supported.

    This is the [GBytes] variant of gdk_pixbuf_new_from_data(), useful for
    language bindings. *)

external new_from_file : string -> (t, GError.t) result
  = "ml_gdk_pixbuf_new_from_file"
(** Creates a new pixbuf by loading an image from a file.

    The file format is detected automatically.

    If [None] is returned, then [error] will be set. Possible errors are:

    - the file could not be opened
    - there is no loader for the file's format
    - there is not enough memory to allocate the image buffer
    - the image buffer contains invalid data

    The error domains are [GDK_PIXBUF_ERROR] and [G_FILE_ERROR]. *)

external new_from_file_at_scale :
  string -> int -> int -> bool -> (t, GError.t) result
  = "ml_gdk_pixbuf_new_from_file_at_scale"
(** Creates a new pixbuf by loading an image from a file.

    The file format is detected automatically.

    If [None] is returned, then [error] will be set. Possible errors are:

    - the file could not be opened
    - there is no loader for the file's format
    - there is not enough memory to allocate the image buffer
    - the image buffer contains invalid data

    The error domains are [GDK_PIXBUF_ERROR] and [G_FILE_ERROR].

    The image will be scaled to fit in the requested size, optionally preserving
    the image's aspect ratio.

    When preserving the aspect ratio, a [width] of -1 will cause the image to be
    scaled to the exact given height, and a [height] of -1 will cause the image
    to be scaled to the exact given width. When not preserving aspect ratio, a
    [width] or [height] of -1 means to not scale the image at all in that
    dimension. Negative values for [width] and [height] are allowed since 2.8.
*)

external new_from_file_at_size : string -> int -> int -> (t, GError.t) result
  = "ml_gdk_pixbuf_new_from_file_at_size"
(** Creates a new pixbuf by loading an image from a file.

    The file format is detected automatically.

    If [None] is returned, then [error] will be set. Possible errors are:

    - the file could not be opened
    - there is no loader for the file's format
    - there is not enough memory to allocate the image buffer
    - the image buffer contains invalid data

    The error domains are [GDK_PIXBUF_ERROR] and [G_FILE_ERROR].

    The image will be scaled to fit in the requested size, preserving the
    image's aspect ratio. Note that the returned pixbuf may be smaller than
    [width] x [height], if the aspect ratio requires it. To load and image at
    the requested size, regardless of aspect ratio, use
    {{!Ocgdkpixbuf.Raw.Pixbuf.val-new_from_file_at_scale}[GdkPixbuf.Pixbuf.new_from_file_at_scale]}.
*)

external new_from_resource : string -> (t, GError.t) result
  = "ml_gdk_pixbuf_new_from_resource"
(** Creates a new pixbuf by loading an image from an resource.

    The file format is detected automatically. If [None] is returned, then
    [error] will be set. *)

external new_from_resource_at_scale :
  string -> int -> int -> bool -> (t, GError.t) result
  = "ml_gdk_pixbuf_new_from_resource_at_scale"
(** Creates a new pixbuf by loading an image from an resource.

    The file format is detected automatically. If [None] is returned, then
    [error] will be set.

    The image will be scaled to fit in the requested size, optionally preserving
    the image's aspect ratio. When preserving the aspect ratio, a [width] of -1
    will cause the image to be scaled to the exact given height, and a [height]
    of -1 will cause the image to be scaled to the exact given width. When not
    preserving aspect ratio, a [width] or [height] of -1 means to not scale the
    image at all in that dimension.

    The stream is not closed. *)

external new_from_stream :
  Ocgio_raw.Input_stream.t ->
  Ocgio_raw.Cancellable.t option ->
  (t, GError.t) result = "ml_gdk_pixbuf_new_from_stream"
(** Creates a new pixbuf by loading an image from an input stream.

    The file format is detected automatically.

    If [None] is returned, then [error] will be set.

    The [cancellable] can be used to abort the operation from another thread. If
    the operation was cancelled, the error [G_IO_ERROR_CANCELLED] will be
    returned. Other possible errors are in the [GDK_PIXBUF_ERROR] and
    [G_IO_ERROR] domains.

    The stream is not closed. *)

external new_from_stream_at_scale :
  Ocgio_raw.Input_stream.t ->
  int ->
  int ->
  bool ->
  Ocgio_raw.Cancellable.t option ->
  (t, GError.t) result = "ml_gdk_pixbuf_new_from_stream_at_scale"
(** Creates a new pixbuf by loading an image from an input stream.

    The file format is detected automatically. If [None] is returned, then
    [error] will be set. The [cancellable] can be used to abort the operation
    from another thread. If the operation was cancelled, the error
    [G_IO_ERROR_CANCELLED] will be returned. Other possible errors are in the
    [GDK_PIXBUF_ERROR] and [G_IO_ERROR] domains.

    The image will be scaled to fit in the requested size, optionally preserving
    the image's aspect ratio.

    When preserving the aspect ratio, a [width] of -1 will cause the image to be
    scaled to the exact given height, and a [height] of -1 will cause the image
    to be scaled to the exact given width. If both [width] and [height] are
    given, this function will behave as if the smaller of the two values is
    passed as -1.

    When not preserving aspect ratio, a [width] or [height] of -1 means to not
    scale the image at all in that dimension.

    The stream is not closed. *)

external new_from_stream_finish :
  Ocgio_raw.Async_result.t -> (t, GError.t) result
  = "ml_gdk_pixbuf_new_from_stream_finish"
(** Finishes an asynchronous pixbuf creation operation started with
    gdk_pixbuf_new_from_stream_async(). *)

external new_from_xpm_data : string array -> t
  = "ml_gdk_pixbuf_new_from_xpm_data"
(** Creates a new pixbuf by parsing XPM data in memory.

    This data is commonly the result of including an XPM file into a program's C
    source. *)

(* Methods *)

external set_option : t -> string -> string -> bool = "ml_gdk_pixbuf_set_option"
(** Attaches a key/value pair as an option to a [GdkPixbuf].

    If [key] already exists in the list of options attached to the [pixbuf], the
    new value is ignored and [false] is returned. *)

external scale_simple :
  t -> int -> int -> Ocgdkpixbuf_enums.interptype -> t option
  = "ml_gdk_pixbuf_scale_simple"
(** Create a new pixbuf containing a copy of [src] scaled to [dest_width] x
    [dest_height].

    This function leaves [src] unaffected.

    The [interp_type] should be [GDK_INTERP_NEAREST] if you want maximum speed
    (but when scaling down [GDK_INTERP_NEAREST] is usually unusably ugly). The
    default [interp_type] should be [GDK_INTERP_BILINEAR] which offers
    reasonable quality and speed.

    You can scale a sub-portion of [src] by creating a sub-pixbuf pointing into
    [src]; see
    {{!Ocgdkpixbuf.Raw.Pixbuf.val-new_subpixbuf}[GdkPixbuf.Pixbuf.new_subpixbuf]}.

    If [dest_width] and [dest_height] are equal to the width and height of
    [src], this function will return an unscaled copy of [src].

    For more complicated scaling/alpha blending see
    {{!Ocgdkpixbuf.Raw.Pixbuf.val-scale}[GdkPixbuf.Pixbuf.scale]} and
    {{!Ocgdkpixbuf.Raw.Pixbuf.val-composite}[GdkPixbuf.Pixbuf.composite]}. *)

external scale :
  t ->
  t ->
  int ->
  int ->
  int ->
  int ->
  float ->
  float ->
  float ->
  float ->
  Ocgdkpixbuf_enums.interptype ->
  unit = "ml_gdk_pixbuf_scale_bytecode" "ml_gdk_pixbuf_scale_native"
(** Creates a transformation of the source image [src] by scaling by [scale_x]
    and [scale_y] then translating by [offset_x] and [offset_y], then renders
    the rectangle ([dest_x], [dest_y], [dest_width], [dest_height]) of the
    resulting image onto the destination image replacing the previous contents.

    Try to use gdk_pixbuf_scale_simple() first; this function is the
    industrial-strength power tool you can fall back to, if
    gdk_pixbuf_scale_simple() isn't powerful enough.

    If the source rectangle overlaps the destination rectangle on the same
    pixbuf, it will be overwritten during the scaling which results in rendering
    artifacts. *)

external savev :
  t ->
  string ->
  string ->
  string array option ->
  string array option ->
  (bool, GError.t) result = "ml_gdk_pixbuf_savev"
[@@ocaml.doc
  "Vector version of [gdk_pixbuf_save()].\n\n\
   Saves pixbuf to a file in [type], which is currently \"jpeg\", \"png\", \
   \"tiff\", \"ico\" or \"bmp\".\n\n\
   If [error] is set, [false] will be returned.\n\n\
   See [GdkPixbuf.Pixbuf.save] for more details."]

external save_to_streamv :
  t ->
  Ocgio_raw.Output_stream.t ->
  string ->
  string array option ->
  string array option ->
  Ocgio_raw.Cancellable.t option ->
  (bool, GError.t) result
  = "ml_gdk_pixbuf_save_to_streamv_bytecode"
    "ml_gdk_pixbuf_save_to_streamv_native"
[@@ocaml.doc
  "Saves [pixbuf] to an output stream.\n\n\
   Supported file formats are currently \"jpeg\", \"tiff\", \"png\", \"ico\" or\n\
   \"bmp\".\n\n\
   See [GdkPixbuf.Pixbuf.save_to_stream] for more details."]

external saturate_and_pixelate : t -> t -> float -> bool -> unit
  = "ml_gdk_pixbuf_saturate_and_pixelate"
(** Modifies saturation and optionally pixelates [src], placing the result in
    [dest].

    The [src] and [dest] pixbufs must have the same image format, size, and
    rowstride.

    The [src] and [dest] arguments may be the same pixbuf with no ill effects.

    If [saturation] is 1.0 then saturation is not changed. If it's less than
    1.0, saturation is reduced (the image turns toward grayscale); if greater
    than 1.0, saturation is increased (the image gets more vivid colors).

    If [pixelate] is [true], then pixels are faded in a checkerboard pattern to
    create a pixelated image. *)

external rotate_simple : t -> Ocgdkpixbuf_enums.pixbufrotation -> t option
  = "ml_gdk_pixbuf_rotate_simple"
(** Rotates a pixbuf by a multiple of 90 degrees, and returns the result in a
    new pixbuf.

    If [angle] is 0, this function will return a copy of [src]. *)

external remove_option : t -> string -> bool = "ml_gdk_pixbuf_remove_option"
(** Removes the key/value pair option attached to a [GdkPixbuf]. *)

external read_pixel_bytes : t -> Glib_bytes.t = "ml_gdk_pixbuf_read_pixel_bytes"
(** Provides a [GBytes] buffer containing the raw pixel data; the data must not
    be modified.

    This function allows skipping the implicit copy that must be made if
    gdk_pixbuf_get_pixels() is called on a read-only pixbuf. *)

external new_subpixbuf : t -> int -> int -> int -> int -> t
  = "ml_gdk_pixbuf_new_subpixbuf"
(** Creates a new pixbuf which represents a sub-region of [src_pixbuf].

    The new pixbuf shares its pixels with the original pixbuf, so writing to one
    affects both. The new pixbuf holds a reference to [src_pixbuf], so
    [src_pixbuf] will not be finalized until the new pixbuf is finalized.

    Note that if [src_pixbuf] is read-only, this function will force it to be
    mutable. *)

external get_width : t -> int = "ml_gdk_pixbuf_get_width"
(** Queries the width of a pixbuf. *)

external get_rowstride : t -> int = "ml_gdk_pixbuf_get_rowstride"
(** Queries the rowstride of a pixbuf, which is the number of bytes between the
    start of a row and the start of the next row. *)

external get_option : t -> string -> string option = "ml_gdk_pixbuf_get_option"
[@@ocaml.doc
  "Looks up [key] in the list of options that may have been attached to the\n\
   [pixbuf] when it was loaded, or that may have been attached by another\n\
   function using gdk_pixbuf_set_option().\n\n\
   For instance, the ANI loader provides \"Title\" and \"Artist\" options.\n\
   The ICO, XBM, and XPM loaders provide \"x_hot\" and \"y_hot\" hot-spot\n\
   options for cursor definitions. The PNG loader provides the tEXt ancillary\n\
   chunk key/value pairs as options. Since 2.12, the TIFF and JPEG loaders\n\
   return an \"orientation\" option string that corresponds to the embedded\n\
   TIFF/Exif orientation tag (if present). Since 2.32, the TIFF loader sets\n\
   the \"multipage\" option string to \"yes\" when a multi-page TIFF is loaded.\n\
   Since 2.32 the JPEG and PNG loaders set \"x-dpi\" and \"y-dpi\" if the file\n\
   contains image density information in dots per inch.\n\
   Since 2.36.6, the JPEG loader sets the \"comment\" option with the comment\n\
   EXIF tag."]

external get_n_channels : t -> int = "ml_gdk_pixbuf_get_n_channels"
(** Queries the number of channels of a pixbuf. *)

external get_height : t -> int = "ml_gdk_pixbuf_get_height"
(** Queries the height of a pixbuf. *)

external get_has_alpha : t -> bool = "ml_gdk_pixbuf_get_has_alpha"
(** Queries whether a pixbuf has an alpha channel (opacity information). *)

external get_colorspace : t -> Ocgdkpixbuf_enums.colorspace
  = "ml_gdk_pixbuf_get_colorspace"
(** Queries the color space of a pixbuf. *)

external get_byte_length : t -> Gsize.t = "ml_gdk_pixbuf_get_byte_length"
(** Returns the length of the pixel data, in bytes. *)

external get_bits_per_sample : t -> int = "ml_gdk_pixbuf_get_bits_per_sample"
(** Queries the number of bits per color sample in a pixbuf. *)

external flip : t -> bool -> t option = "ml_gdk_pixbuf_flip"
(** Flips a pixbuf horizontally or vertically and returns the result in a new
    pixbuf. *)

external fill : t -> UInt32.t -> unit = "ml_gdk_pixbuf_fill"
(** Clears a pixbuf to the given RGBA value, converting the RGBA value into the
    pixbuf's pixel format.

    The alpha component will be ignored if the pixbuf doesn't have an alpha
    channel. *)

external copy_options : t -> t -> bool = "ml_gdk_pixbuf_copy_options"
[@@ocaml.doc
  "Copies the key/value pair options attached to a [GdkPixbuf] to another\n\
   [GdkPixbuf].\n\n\
   This is useful to keep original metadata after having manipulated\n\
   a file. However be careful to remove metadata which you've already\n\
   applied, such as the \"orientation\" option after rotating the image."]

external copy_area : t -> int -> int -> int -> int -> t -> int -> int -> unit
  = "ml_gdk_pixbuf_copy_area_bytecode" "ml_gdk_pixbuf_copy_area_native"
(** Copies a rectangular area from [src_pixbuf] to [dest_pixbuf].

    Conversion of pixbuf formats is done automatically.

    If the source rectangle overlaps the destination rectangle on the same
    pixbuf, it will be overwritten during the copy operation. Therefore, you can
    not use this function to scroll a pixbuf. *)

external copy : t -> t option = "ml_gdk_pixbuf_copy"
(** Creates a new [GdkPixbuf] with a copy of the information in the specified
    [pixbuf].

    Note that this does not copy the options set on the original [GdkPixbuf],
    use gdk_pixbuf_copy_options() for this. *)

external composite_color_simple :
  t ->
  int ->
  int ->
  Ocgdkpixbuf_enums.interptype ->
  int ->
  int ->
  UInt32.t ->
  UInt32.t ->
  t option
  = "ml_gdk_pixbuf_composite_color_simple_bytecode"
    "ml_gdk_pixbuf_composite_color_simple_native"
(** Creates a new pixbuf by scaling [src] to [dest_width] x [dest_height] and
    alpha blending the result with a checkboard of colors [color1] and [color2].
*)

external composite_color :
  t ->
  t ->
  int ->
  int ->
  int ->
  int ->
  float ->
  float ->
  float ->
  float ->
  Ocgdkpixbuf_enums.interptype ->
  int ->
  int ->
  int ->
  int ->
  UInt32.t ->
  UInt32.t ->
  unit
  = "ml_gdk_pixbuf_composite_color_bytecode"
    "ml_gdk_pixbuf_composite_color_native"
(** Creates a transformation of the source image [src] by scaling by [scale_x]
    and [scale_y] then translating by [offset_x] and [offset_y], then alpha
    blends the rectangle ([dest_x] ,[dest_y], [dest_width], [dest_height]) of
    the resulting image with a checkboard of the colors [color1] and [color2]
    and renders it onto the destination image.

    If the source image has no alpha channel, and [overall_alpha] is 255, a fast
    path is used which omits the alpha blending and just performs the scaling.

    See gdk_pixbuf_composite_color_simple() for a simpler variant of this
    function suitable for many tasks. *)

external composite :
  t ->
  t ->
  int ->
  int ->
  int ->
  int ->
  float ->
  float ->
  float ->
  float ->
  Ocgdkpixbuf_enums.interptype ->
  int ->
  unit = "ml_gdk_pixbuf_composite_bytecode" "ml_gdk_pixbuf_composite_native"
(** Creates a transformation of the source image [src] by scaling by [scale_x]
    and [scale_y] then translating by [offset_x] and [offset_y].

    This gives an image in the coordinates of the destination pixbuf. The
    rectangle ([dest_x], [dest_y], [dest_width], [dest_height]) is then alpha
    blended onto the corresponding rectangle of the original destination image.

    When the destination rectangle contains parts not in the source image, the
    data at the edges of the source image is replicated to infinity. *)

external apply_embedded_orientation : t -> t option
  = "ml_gdk_pixbuf_apply_embedded_orientation"
[@@ocaml.doc
  "Takes an existing pixbuf and checks for the presence of an\n\
   associated \"orientation\" option.\n\n\
   The orientation option may be provided by the JPEG loader (which\n\
   reads the exif orientation tag) or the TIFF loader (which reads\n\
   the TIFF orientation tag, and compensates it for the partial\n\
   transforms performed by libtiff).\n\n\
   If an orientation option/tag is present, the appropriate transform\n\
   will be performed so that the pixbuf is oriented correctly."]

(* Properties *)

external get_pixel_bytes : t -> Glib_bytes.t = "ml_gdk_pixbuf_get_pixel_bytes"
(** Get property: pixel-bytes *)
