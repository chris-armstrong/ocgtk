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
