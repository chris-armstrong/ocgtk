class type pixbuf_t = object
  inherit Ocgio.Icon.icon_t
  inherit Ocgio.Loadable_icon.loadable_icon_t

  (** {2:methods Methods} *)

  method apply_embedded_orientation : unit -> pixbuf_t option
  [@@ocaml.doc
    "Takes an existing pixbuf and checks for the presence of an\n\
     associated \"orientation\" option.\n\n\
     The orientation option may be provided by the JPEG loader (which\n\
     reads the exif orientation tag) or the TIFF loader (which reads\n\
     the TIFF orientation tag, and compensates it for the partial\n\
     transforms performed by libtiff).\n\n\
     If an orientation option/tag is present, the appropriate transform\n\
     will be performed so that the pixbuf is oriented correctly."]

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
  (** Creates a transformation of the source image [src] by scaling by [scale_x]
      and [scale_y] then translating by [offset_x] and [offset_y].

      This gives an image in the coordinates of the destination pixbuf. The
      rectangle ([dest_x], [dest_y], [dest_width], [dest_height]) is then alpha
      blended onto the corresponding rectangle of the original destination
      image.

      When the destination rectangle contains parts not in the source image, the
      data at the edges of the source image is replicated to infinity. *)

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
  (** Creates a transformation of the source image [src] by scaling by [scale_x]
      and [scale_y] then translating by [offset_x] and [offset_y], then alpha
      blends the rectangle ([dest_x] ,[dest_y], [dest_width], [dest_height]) of
      the resulting image with a checkboard of the colors [color1] and [color2]
      and renders it onto the destination image.

      If the source image has no alpha channel, and [overall_alpha] is 255, a
      fast path is used which omits the alpha blending and just performs the
      scaling.

      See [gdk_pixbuf_composite_color_simple ()] for a simpler variant of this
      function suitable for many tasks. *)

  method composite_color_simple :
    int ->
    int ->
    Enums.interptype ->
    int ->
    int ->
    UInt32.t ->
    UInt32.t ->
    pixbuf_t option
  (** Creates a new pixbuf by scaling [src] to [dest_width] x [dest_height] and
      alpha blending the result with a checkboard of colors [color1] and
      [color2]. *)

  method copy : unit -> pixbuf_t option
  (** Creates a new [GdkPixbuf] with a copy of the information in the specified
      [pixbuf].

      Note that this does not copy the options set on the original [GdkPixbuf],
      use [gdk_pixbuf_copy_options ()] for this. *)

  method copy_area : int -> int -> int -> int -> pixbuf_t -> int -> int -> unit
  (** Copies a rectangular area from [src_pixbuf] to [dest_pixbuf].

      Conversion of pixbuf formats is done automatically.

      If the source rectangle overlaps the destination rectangle on the same
      pixbuf, it will be overwritten during the copy operation. Therefore, you
      can not use this function to scroll a pixbuf. *)

  method copy_options : pixbuf_t -> bool
  [@@ocaml.doc
    "Copies the key/value pair options attached to a [GdkPixbuf] to another\n\
     [GdkPixbuf].\n\n\
     This is useful to keep original metadata after having manipulated\n\
     a file. However be careful to remove metadata which you've already\n\
     applied, such as the \"orientation\" option after rotating the image."]

  method fill : UInt32.t -> unit
  (** Clears a pixbuf to the given RGBA value, converting the RGBA value into
      the pixbuf's pixel format.

      The alpha component will be ignored if the pixbuf doesn't have an alpha
      channel. *)

  method flip : bool -> pixbuf_t option
  (** Flips a pixbuf horizontally or vertically and returns the result in a new
      pixbuf. *)

  method get_bits_per_sample : unit -> int
  (** Queries the number of bits per color sample in a pixbuf. *)

  method get_byte_length : unit -> Gsize.t
  (** Returns the length of the pixel data, in bytes. *)

  method get_colorspace : unit -> Enums.colorspace
  (** Queries the color space of a pixbuf. *)

  method get_has_alpha : unit -> bool
  (** Queries whether a pixbuf has an alpha channel (opacity information). *)

  method get_height : unit -> int
  (** Queries the height of a pixbuf. *)

  method get_n_channels : unit -> int
  (** Queries the number of channels of a pixbuf. *)

  method get_option : string -> string option
  [@@ocaml.doc
    "Looks up [key] in the list of options that may have been attached to the\n\
     [pixbuf] when it was loaded, or that may have been attached by another\n\
     function using [gdk_pixbuf_set_option ()].\n\n\
     For instance, the ANI loader provides \"Title\" and \"Artist\" options.\n\
     The ICO, XBM, and XPM loaders provide \"x_hot\" and \"y_hot\" hot-spot\n\
     options for cursor definitions. The PNG loader provides the tEXt ancillary\n\
     chunk key/value pairs as options. Since 2.12, the TIFF and JPEG loaders\n\
     return an \"orientation\" option string that corresponds to the embedded\n\
     TIFF/Exif orientation tag (if present). Since 2.32, the TIFF loader sets\n\
     the \"multipage\" option string to \"yes\" when a multi-page TIFF is \
     loaded.\n\
     Since 2.32 the JPEG and PNG loaders set \"x-dpi\" and \"y-dpi\" if the file\n\
     contains image density information in dots per inch.\n\
     Since 2.36.6, the JPEG loader sets the \"comment\" option with the comment\n\
     EXIF tag."]

  method get_rowstride : unit -> int
  (** Queries the rowstride of a pixbuf, which is the number of bytes between
      the start of a row and the start of the next row. *)

  method get_width : unit -> int
  (** Queries the width of a pixbuf. *)

  method new_subpixbuf : int -> int -> int -> int -> pixbuf_t
  (** Creates a new pixbuf which represents a sub-region of [src_pixbuf].

      The new pixbuf shares its pixels with the original pixbuf, so writing to
      one affects both. The new pixbuf holds a reference to [src_pixbuf], so
      [src_pixbuf] will not be finalized until the new pixbuf is finalized.

      Note that if [src_pixbuf] is read-only, this function will force it to be
      mutable. *)

  method read_pixel_bytes : unit -> Glib_bytes.t
  (** Provides a [GBytes] buffer containing the raw pixel data; the data must
      not be modified.

      This function allows skipping the implicit copy that must be made if
      [gdk_pixbuf_get_pixels ()] is called on a read-only pixbuf. *)

  method remove_option : string -> bool
  (** Removes the key/value pair option attached to a [GdkPixbuf]. *)

  method rotate_simple : Enums.pixbufrotation -> pixbuf_t option
  (** Rotates a pixbuf by a multiple of 90 degrees, and returns the result in a
      new pixbuf.

      If [angle] is 0, this function will return a copy of [src]. *)

  method saturate_and_pixelate : pixbuf_t -> float -> bool -> unit
  (** Modifies saturation and optionally pixelates [src], placing the result in
      [dest].

      The [src] and [dest] pixbufs must have the same image format, size, and
      rowstride.

      The [src] and [dest] arguments may be the same pixbuf with no ill effects.

      If [saturation] is 1.0 then saturation is not changed. If it's less than
      1.0, saturation is reduced (the image turns toward grayscale); if greater
      than 1.0, saturation is increased (the image gets more vivid colors).

      If [pixelate] is [true], then pixels are faded in a checkerboard pattern
      to create a pixelated image. *)

  method save_to_streamv :
    Ocgio.Output_stream.output_stream_t ->
    string ->
    string array option ->
    string array option ->
    Ocgio.Cancellable.cancellable_t option ->
    (bool, GError.t) result
  [@@ocaml.doc
    "Saves [pixbuf] to an output stream.\n\n\
     Supported file formats are currently \"jpeg\", \"tiff\", \"png\", \"ico\" \
     or\n\
     \"bmp\".\n\n\
     See [GdkPixbuf.Pixbuf.save_to_stream] for more details."]

  method savev :
    string ->
    string ->
    string array option ->
    string array option ->
    (bool, GError.t) result
  [@@ocaml.doc
    "Vector version of [gdk_pixbuf_save()].\n\n\
     Saves pixbuf to a file in [type], which is currently \"jpeg\", \"png\", \
     \"tiff\", \"ico\" or \"bmp\".\n\n\
     If [error] is set, [false] will be returned.\n\n\
     See [GdkPixbuf.Pixbuf.save] for more details."]

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
  (** Creates a transformation of the source image [src] by scaling by [scale_x]
      and [scale_y] then translating by [offset_x] and [offset_y], then renders
      the rectangle ([dest_x], [dest_y], [dest_width], [dest_height]) of the
      resulting image onto the destination image replacing the previous
      contents.

      Try to use [gdk_pixbuf_scale_simple ()] first; this function is the
      industrial-strength power tool you can fall back to, if
      [gdk_pixbuf_scale_simple ()] isn't powerful enough.

      If the source rectangle overlaps the destination rectangle on the same
      pixbuf, it will be overwritten during the scaling which results in
      rendering artifacts. *)

  method scale_simple : int -> int -> Enums.interptype -> pixbuf_t option
  (** Create a new pixbuf containing a copy of [src] scaled to [dest_width] x
      [dest_height].

      This function leaves [src] unaffected.

      The [interp_type] should be [GDK_INTERP_NEAREST] if you want maximum speed
      (but when scaling down [GDK_INTERP_NEAREST] is usually unusably ugly). The
      default [interp_type] should be [GDK_INTERP_BILINEAR] which offers
      reasonable quality and speed.

      You can scale a sub-portion of [src] by creating a sub-pixbuf pointing
      into [src]; see [GdkPixbuf.Pixbuf.new_subpixbuf].

      If [dest_width] and [dest_height] are equal to the width and height of
      [src], this function will return an unscaled copy of [src].

      For more complicated scaling/alpha blending see [GdkPixbuf.Pixbuf.scale]
      and [GdkPixbuf.Pixbuf.composite]. *)

  method set_option : string -> string -> bool
  (** Attaches a key/value pair as an option to a [GdkPixbuf].

      If [key] already exists in the list of options attached to the [pixbuf],
      the new value is ignored and [false] is returned. *)

  (** {2:properties Properties} *)

  method pixel_bytes : Glib_bytes.t
  (** Get property: pixel-bytes *)

  (** {2:conversions Conversions} *)

  method as_pixbuf : Raw.Pixbuf.t
end

(* High-level class for Pixbuf *)
class pixbuf (obj : Raw.Pixbuf.t) : pixbuf_t =
  object (self)
    inherit Ocgio.Icon.icon (Ocgio.Raw.Icon.from_gobject obj)

    inherit
      Ocgio.Loadable_icon.loadable_icon
        (Ocgio.Raw.Loadable_icon.from_gobject obj)

    method apply_embedded_orientation : unit -> pixbuf_t option =
      fun () ->
        Option.map
          (fun ret -> new pixbuf ret)
          (Raw.Pixbuf.apply_embedded_orientation obj)

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
        unit =
      fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x
          scale_y interp_type overall_alpha ->
        let dest = dest#as_pixbuf in
        Raw.Pixbuf.composite obj dest dest_x dest_y dest_width dest_height
          offset_x offset_y scale_x scale_y interp_type overall_alpha

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
        unit =
      fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x
          scale_y interp_type overall_alpha check_x check_y check_size color1
          color2 ->
        let dest = dest#as_pixbuf in
        Raw.Pixbuf.composite_color obj dest dest_x dest_y dest_width dest_height
          offset_x offset_y scale_x scale_y interp_type overall_alpha check_x
          check_y check_size color1 color2

    method composite_color_simple :
        int ->
        int ->
        Enums.interptype ->
        int ->
        int ->
        UInt32.t ->
        UInt32.t ->
        pixbuf_t option =
      fun dest_width dest_height interp_type overall_alpha check_size color1
          color2 ->
        Option.map
          (fun ret -> new pixbuf ret)
          (Raw.Pixbuf.composite_color_simple obj dest_width dest_height
             interp_type overall_alpha check_size color1 color2)

    method copy : unit -> pixbuf_t option =
      fun () -> Option.map (fun ret -> new pixbuf ret) (Raw.Pixbuf.copy obj)

    method copy_area :
        int -> int -> int -> int -> pixbuf_t -> int -> int -> unit =
      fun src_x src_y width height dest_pixbuf dest_x dest_y ->
        let dest_pixbuf = dest_pixbuf#as_pixbuf in
        Raw.Pixbuf.copy_area obj src_x src_y width height dest_pixbuf dest_x
          dest_y

    method copy_options : pixbuf_t -> bool =
      fun dest_pixbuf ->
        let dest_pixbuf = dest_pixbuf#as_pixbuf in
        Raw.Pixbuf.copy_options obj dest_pixbuf

    method fill : UInt32.t -> unit = fun pixel -> Raw.Pixbuf.fill obj pixel

    method flip : bool -> pixbuf_t option =
      fun horizontal ->
        Option.map (fun ret -> new pixbuf ret) (Raw.Pixbuf.flip obj horizontal)

    method get_bits_per_sample : unit -> int =
      fun () -> Raw.Pixbuf.get_bits_per_sample obj

    method get_byte_length : unit -> Gsize.t =
      fun () -> Raw.Pixbuf.get_byte_length obj

    method get_colorspace : unit -> Enums.colorspace =
      fun () -> Raw.Pixbuf.get_colorspace obj

    method get_has_alpha : unit -> bool = fun () -> Raw.Pixbuf.get_has_alpha obj
    method get_height : unit -> int = fun () -> Raw.Pixbuf.get_height obj

    method get_n_channels : unit -> int =
      fun () -> Raw.Pixbuf.get_n_channels obj

    method get_option : string -> string option =
      fun key -> Raw.Pixbuf.get_option obj key

    method get_rowstride : unit -> int = fun () -> Raw.Pixbuf.get_rowstride obj
    method get_width : unit -> int = fun () -> Raw.Pixbuf.get_width obj

    method new_subpixbuf : int -> int -> int -> int -> pixbuf_t =
      fun src_x src_y width height ->
        new pixbuf (Raw.Pixbuf.new_subpixbuf obj src_x src_y width height)

    method read_pixel_bytes : unit -> Glib_bytes.t =
      fun () -> Raw.Pixbuf.read_pixel_bytes obj

    method remove_option : string -> bool =
      fun key -> Raw.Pixbuf.remove_option obj key

    method rotate_simple : Enums.pixbufrotation -> pixbuf_t option =
      fun angle ->
        Option.map
          (fun ret -> new pixbuf ret)
          (Raw.Pixbuf.rotate_simple obj angle)

    method saturate_and_pixelate : pixbuf_t -> float -> bool -> unit =
      fun dest saturation pixelate ->
        let dest = dest#as_pixbuf in
        Raw.Pixbuf.saturate_and_pixelate obj dest saturation pixelate

    method save_to_streamv :
        Ocgio.Output_stream.output_stream_t ->
        string ->
        string array option ->
        string array option ->
        Ocgio.Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun stream type_ option_keys option_values cancellable ->
        let stream = stream#as_output_stream in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Pixbuf.save_to_streamv obj stream type_ option_keys option_values
          cancellable

    method savev :
        string ->
        string ->
        string array option ->
        string array option ->
        (bool, GError.t) result =
      fun filename type_ option_keys option_values ->
        Raw.Pixbuf.savev obj filename type_ option_keys option_values

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
        unit =
      fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x
          scale_y interp_type ->
        let dest = dest#as_pixbuf in
        Raw.Pixbuf.scale obj dest dest_x dest_y dest_width dest_height offset_x
          offset_y scale_x scale_y interp_type

    method scale_simple : int -> int -> Enums.interptype -> pixbuf_t option =
      fun dest_width dest_height interp_type ->
        Option.map
          (fun ret -> new pixbuf ret)
          (Raw.Pixbuf.scale_simple obj dest_width dest_height interp_type)

    method set_option : string -> string -> bool =
      fun key value -> Raw.Pixbuf.set_option obj key value

    method pixel_bytes = Raw.Pixbuf.get_pixel_bytes obj
    method as_pixbuf = obj
  end

let new_ (colorspace : Enums.colorspace) (has_alpha : bool)
    (bits_per_sample : int) (width : int) (height : int) : pixbuf_t =
  let obj_ =
    Raw.Pixbuf.new_ colorspace has_alpha bits_per_sample width height
  in
  new pixbuf obj_

let new_from_bytes (data : Glib_bytes.t) (colorspace : Enums.colorspace)
    (has_alpha : bool) (bits_per_sample : int) (width : int) (height : int)
    (rowstride : int) : pixbuf_t =
  let obj_ =
    Raw.Pixbuf.new_from_bytes data colorspace has_alpha bits_per_sample width
      height rowstride
  in
  new pixbuf obj_

let new_from_file (filename : string) : (pixbuf_t, GError.t) result =
  let obj_ = Raw.Pixbuf.new_from_file filename in
  Result.map (fun obj_ -> new pixbuf obj_) obj_

let new_from_file_at_scale (filename : string) (width : int) (height : int)
    (preserve_aspect_ratio : bool) : (pixbuf_t, GError.t) result =
  let obj_ =
    Raw.Pixbuf.new_from_file_at_scale filename width height
      preserve_aspect_ratio
  in
  Result.map (fun obj_ -> new pixbuf obj_) obj_

let new_from_file_at_size (filename : string) (width : int) (height : int) :
    (pixbuf_t, GError.t) result =
  let obj_ = Raw.Pixbuf.new_from_file_at_size filename width height in
  Result.map (fun obj_ -> new pixbuf obj_) obj_

let new_from_resource (resource_path : string) : (pixbuf_t, GError.t) result =
  let obj_ = Raw.Pixbuf.new_from_resource resource_path in
  Result.map (fun obj_ -> new pixbuf obj_) obj_

let new_from_resource_at_scale (resource_path : string) (width : int)
    (height : int) (preserve_aspect_ratio : bool) : (pixbuf_t, GError.t) result
    =
  let obj_ =
    Raw.Pixbuf.new_from_resource_at_scale resource_path width height
      preserve_aspect_ratio
  in
  Result.map (fun obj_ -> new pixbuf obj_) obj_

let new_from_stream (stream : Ocgio.Input_stream.input_stream_t)
    (cancellable : Ocgio.Cancellable.cancellable_t option) :
    (pixbuf_t, GError.t) result =
  let stream = stream#as_input_stream in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = Raw.Pixbuf.new_from_stream stream cancellable in
  Result.map (fun obj_ -> new pixbuf obj_) obj_

let new_from_stream_at_scale (stream : Ocgio.Input_stream.input_stream_t)
    (width : int) (height : int) (preserve_aspect_ratio : bool)
    (cancellable : Ocgio.Cancellable.cancellable_t option) :
    (pixbuf_t, GError.t) result =
  let stream = stream#as_input_stream in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ =
    Raw.Pixbuf.new_from_stream_at_scale stream width height
      preserve_aspect_ratio cancellable
  in
  Result.map (fun obj_ -> new pixbuf obj_) obj_

let new_from_stream_finish (async_result : Ocgio.Async_result.async_result_t) :
    (pixbuf_t, GError.t) result =
  let async_result = async_result#as_async_result in
  let obj_ = Raw.Pixbuf.new_from_stream_finish async_result in
  Result.map (fun obj_ -> new pixbuf obj_) obj_

let new_from_xpm_data (data : string array) : pixbuf_t =
  let obj_ = Raw.Pixbuf.new_from_xpm_data data in
  new pixbuf obj_
