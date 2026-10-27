[@@@ocaml.text
"A pixel buffer.\n\n\
 [GdkPixbuf] contains information about an image's pixel data,\n\
 its color space, bits per sample, width and height, and the\n\
 rowstride (the number of bytes between the start of one row\n\
 and the start of the next).\n\n\
 {b Creating new [GdkPixbuf]}\n\n\
 The most basic way to create a pixbuf is to wrap an existing pixel\n\
 buffer with a [GdkPixbuf.Pixbuf] instance. You can use the\n\
 [GdkPixbuf.Pixbuf.new_from_data] function to do this.\n\n\
 Every time you create a new [GdkPixbuf] instance for some data, you\n\
 will need to specify the destroy notification function that will be\n\
 called when the data buffer needs to be freed; this will happen when\n\
 a [GdkPixbuf] is finalized by the reference counting functions. If\n\
 you have a chunk of static data compiled into your application, you\n\
 can pass in [NULL] as the destroy notification function so that the\n\
 data will not be freed.\n\n\
 The [GdkPixbuf.Pixbuf.new] constructor function can be used\n\
 as a convenience to create a pixbuf with an empty buffer; this is\n\
 equivalent to allocating a data buffer using [malloc()] and then\n\
 wrapping it with [gdk_pixbuf_new_from_data()]. The [gdk_pixbuf_new()]\n\
 function will compute an optimal rowstride so that rendering can be\n\
 performed with an efficient algorithm.\n\n\
 You can also copy an existing pixbuf with the [Pixbuf.copy]\n\
 function. This is not the same as just acquiring a reference to\n\
 the old pixbuf instance: the copy function will actually duplicate\n\
 the pixel data in memory and create a new [Pixbuf] instance\n\
 for it.\n\n\
 {b Reference counting}\n\n\
 [GdkPixbuf] structures are reference counted. This means that an\n\
 application can share a single pixbuf among many parts of the\n\
 code. When a piece of the program needs to use a pixbuf, it should\n\
 acquire a reference to it by calling [g_object_ref()]; when it no\n\
 longer needs the pixbuf, it should release the reference it acquired\n\
 by calling [g_object_unref()]. The resources associated with a\n\
 [GdkPixbuf] will be freed when its reference count drops to zero.\n\
 Newly-created [GdkPixbuf] instances start with a reference count\n\
 of one.\n\n\
 {b Image Data}\n\n\
 Image data in a pixbuf is stored in memory in an uncompressed,\n\
 packed format. Rows in the image are stored top to bottom, and\n\
 in each row pixels are stored from left to right.\n\n\
 There may be padding at the end of a row.\n\n\
 The \"rowstride\" value of a pixbuf, as returned by \
 [GdkPixbuf.Pixbuf.get_rowstride],\n\
 indicates the number of bytes between rows.\n\n\
 {b NOTE}: If you are copying raw pixbuf data with [memcpy()] note that the\n\
 last row in the pixbuf may not be as wide as the full rowstride, but rather\n\
 just as wide as the pixel data needs to be; that is: it is unsafe to do\n\
 [memcpy (dest, pixels, rowstride * height)] to copy a whole pixbuf. Use\n\
 [GdkPixbuf.Pixbuf.copy] instead, or compute the width in bytes of the\n\
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
 Its methods, signals and properties are on {!class-type-pixbuf_t}. The \
 functions it is built on are in {!Ocgdkpixbuf.Raw.Pixbuf}."]

(** The methods, signals and properties of a [GdkPixbuf]. *)
class type pixbuf_t = object
  inherit Ocgio.Icon.icon_t
  inherit Ocgio.Loadable_icon.loadable_icon_t
  method apply_embedded_orientation : unit -> pixbuf_t option

  method composite :
    pixbuf_t ->
    int ->
    int ->
    int ->
    int ->
    float ->
    float ->
    float ->
    float ->
    Enums.interptype ->
    int ->
    unit

  method composite_color :
    pixbuf_t ->
    int ->
    int ->
    int ->
    int ->
    float ->
    float ->
    float ->
    float ->
    Enums.interptype ->
    int ->
    int ->
    int ->
    int ->
    UInt32.t ->
    UInt32.t ->
    unit

  method composite_color_simple :
    int ->
    int ->
    Enums.interptype ->
    int ->
    int ->
    UInt32.t ->
    UInt32.t ->
    pixbuf_t option

  method copy : unit -> pixbuf_t option
  method copy_area : int -> int -> int -> int -> pixbuf_t -> int -> int -> unit
  method copy_options : pixbuf_t -> bool
  method fill : UInt32.t -> unit
  method flip : bool -> pixbuf_t option
  method get_bits_per_sample : unit -> int
  method get_byte_length : unit -> Gsize.t
  method get_colorspace : unit -> Enums.colorspace
  method get_has_alpha : unit -> bool
  method get_height : unit -> int
  method get_n_channels : unit -> int
  method get_option : string -> string option
  method get_rowstride : unit -> int
  method get_width : unit -> int
  method new_subpixbuf : int -> int -> int -> int -> pixbuf_t
  method read_pixel_bytes : unit -> Glib_bytes.t
  method remove_option : string -> bool
  method rotate_simple : Enums.pixbufrotation -> pixbuf_t option
  method saturate_and_pixelate : pixbuf_t -> float -> bool -> unit

  method save_to_streamv :
    Ocgio.Output_stream.output_stream_t ->
    string ->
    string array option ->
    string array option ->
    Ocgio.Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method savev :
    string ->
    string ->
    string array option ->
    string array option ->
    (bool, GError.t) result

  method scale :
    pixbuf_t ->
    int ->
    int ->
    int ->
    int ->
    float ->
    float ->
    float ->
    float ->
    Enums.interptype ->
    unit

  method scale_simple : int -> int -> Enums.interptype -> pixbuf_t option
  method set_option : string -> string -> bool
  method pixel_bytes : Glib_bytes.t
  method as_pixbuf : Raw.Pixbuf.t
end

class pixbuf : Raw.Pixbuf.t -> pixbuf_t
(** Wraps a layer 1 handle, {!Ocgdkpixbuf.Raw.Pixbuf.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkPixbuf], give one already wrapped. *)

val new_ : Enums.colorspace -> bool -> int -> int -> int -> pixbuf_t

val new_from_bytes :
  Glib_bytes.t ->
  Enums.colorspace ->
  bool ->
  int ->
  int ->
  int ->
  int ->
  pixbuf_t

val new_from_file : string -> (pixbuf_t, GError.t) result

val new_from_file_at_scale :
  string -> int -> int -> bool -> (pixbuf_t, GError.t) result

val new_from_file_at_size : string -> int -> int -> (pixbuf_t, GError.t) result
val new_from_resource : string -> (pixbuf_t, GError.t) result

val new_from_resource_at_scale :
  string -> int -> int -> bool -> (pixbuf_t, GError.t) result

val new_from_stream :
  Ocgio.Input_stream.input_stream_t ->
  Ocgio.Cancellable.cancellable_t option ->
  (pixbuf_t, GError.t) result

val new_from_stream_at_scale :
  Ocgio.Input_stream.input_stream_t ->
  int ->
  int ->
  bool ->
  Ocgio.Cancellable.cancellable_t option ->
  (pixbuf_t, GError.t) result

val new_from_stream_finish :
  Ocgio.Async_result.async_result_t -> (pixbuf_t, GError.t) result

val new_from_xpm_data : string array -> pixbuf_t
