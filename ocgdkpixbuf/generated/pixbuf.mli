class type pixbuf_t = object
  inherit Ocgtk_gio.Gio.Icon.icon_t
  inherit Ocgtk_gio.Gio.Loadable_icon.loadable_icon_t
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
    Gdkpixbuf_enums.interptype ->
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
    Gdkpixbuf_enums.interptype ->
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
    Gdkpixbuf_enums.interptype ->
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
  method get_colorspace : unit -> Gdkpixbuf_enums.colorspace
  method get_has_alpha : unit -> bool
  method get_height : unit -> int
  method get_n_channels : unit -> int
  method get_option : string -> string option
  method get_rowstride : unit -> int
  method get_width : unit -> int
  method new_subpixbuf : int -> int -> int -> int -> pixbuf_t
  method read_pixel_bytes : unit -> Glib_bytes.t
  method remove_option : string -> bool
  method rotate_simple : Gdkpixbuf_enums.pixbufrotation -> pixbuf_t option
  method saturate_and_pixelate : pixbuf_t -> float -> bool -> unit

  method save_to_streamv :
    Ocgtk_gio.Gio.Output_stream.output_stream_t ->
    string ->
    string array option ->
    string array option ->
    Ocgtk_gio.Gio.Cancellable.cancellable_t option ->
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
    Gdkpixbuf_enums.interptype ->
    unit

  method scale_simple :
    int -> int -> Gdkpixbuf_enums.interptype -> pixbuf_t option

  method set_option : string -> string -> bool
  method pixel_bytes : Glib_bytes.t
  method as_pixbuf : Pixbuf.t
end

class pixbuf : Pixbuf.t -> pixbuf_t

val new_ : Gdkpixbuf_enums.colorspace -> bool -> int -> int -> int -> pixbuf_t

val new_from_bytes :
  Glib_bytes.t ->
  Gdkpixbuf_enums.colorspace ->
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
  Ocgtk_gio.Gio.Input_stream.input_stream_t ->
  Ocgtk_gio.Gio.Cancellable.cancellable_t option ->
  (pixbuf_t, GError.t) result

val new_from_stream_at_scale :
  Ocgtk_gio.Gio.Input_stream.input_stream_t ->
  int ->
  int ->
  bool ->
  Ocgtk_gio.Gio.Cancellable.cancellable_t option ->
  (pixbuf_t, GError.t) result

val new_from_stream_finish :
  Ocgtk_gio.Gio.Async_result.async_result_t -> (pixbuf_t, GError.t) result

val new_from_xpm_data : string array -> pixbuf_t
