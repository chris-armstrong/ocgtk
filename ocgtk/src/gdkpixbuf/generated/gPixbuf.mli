class pixbuf : Pixbuf.t ->
  object
    method apply_embedded_orientation : unit -> pixbuf option
    method composite : <as_pixbuf: Pixbuf.t; ..> -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> unit
    method copy : unit -> pixbuf option
    method copy_area : int -> int -> int -> int -> <as_pixbuf: Pixbuf.t; ..> -> int -> int -> unit
    method copy_options : <as_pixbuf: Pixbuf.t; ..> -> bool
    method flip : bool -> pixbuf option
    method get_bits_per_sample : unit -> int
    method get_colorspace : unit -> Gdkpixbuf_enums.colorspace
    method get_has_alpha : unit -> bool
    method get_height : unit -> int
    method get_n_channels : unit -> int
    method get_option : string -> string option
    method get_rowstride : unit -> int
    method get_width : unit -> int
    method new_subpixbuf : int -> int -> int -> int -> pixbuf
    method remove_option : string -> bool
    method rotate_simple : Gdkpixbuf_enums.pixbufrotation -> pixbuf option
    method saturate_and_pixelate : <as_pixbuf: Pixbuf.t; ..> -> float -> bool -> unit
    method savev : string -> string -> string array option -> string array option -> (bool, GError.t) result
    method scale : <as_pixbuf: Pixbuf.t; ..> -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> unit
    method scale_simple : int -> int -> Gdkpixbuf_enums.interptype -> pixbuf option
    method set_option : string -> string -> bool
    method as_pixbuf : Pixbuf.t
  end

