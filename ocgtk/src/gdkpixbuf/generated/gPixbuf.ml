(* High-level class for Pixbuf *)
class pixbuf (obj : Pixbuf.t) = object (self)

  method apply_embedded_orientation : unit -> pixbuf option =
    fun () ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.apply_embedded_orientation obj)

  method composite : 'p1. (<as_pixbuf: Pixbuf.t; ..> as 'p1) -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> unit =
    fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type overall_alpha ->
      let dest = dest#as_pixbuf in
      (Pixbuf.composite obj dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type overall_alpha)

  method copy : unit -> pixbuf option =
    fun () ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.copy obj)

  method copy_area : 'p1. int -> int -> int -> int -> (<as_pixbuf: Pixbuf.t; ..> as 'p1) -> int -> int -> unit =
    fun src_x src_y width height dest_pixbuf dest_x dest_y ->
      let dest_pixbuf = dest_pixbuf#as_pixbuf in
      (Pixbuf.copy_area obj src_x src_y width height dest_pixbuf dest_x dest_y)

  method copy_options : 'p1. (<as_pixbuf: Pixbuf.t; ..> as 'p1) -> bool =
    fun dest_pixbuf ->
      let dest_pixbuf = dest_pixbuf#as_pixbuf in
      (Pixbuf.copy_options obj dest_pixbuf)

  method flip : bool -> pixbuf option =
    fun horizontal ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.flip obj horizontal)

  method get_bits_per_sample : unit -> int =
    fun () ->
      (Pixbuf.get_bits_per_sample obj)

  method get_colorspace : unit -> Gdkpixbuf_enums.colorspace =
    fun () ->
      (Pixbuf.get_colorspace obj)

  method get_has_alpha : unit -> bool =
    fun () ->
      (Pixbuf.get_has_alpha obj)

  method get_height : unit -> int =
    fun () ->
      (Pixbuf.get_height obj)

  method get_n_channels : unit -> int =
    fun () ->
      (Pixbuf.get_n_channels obj)

  method get_option : string -> string option =
    fun key ->
      (Pixbuf.get_option obj key)

  method get_rowstride : unit -> int =
    fun () ->
      (Pixbuf.get_rowstride obj)

  method get_width : unit -> int =
    fun () ->
      (Pixbuf.get_width obj)

  method new_subpixbuf : int -> int -> int -> int -> pixbuf =
    fun src_x src_y width height ->
      new  pixbuf(Pixbuf.new_subpixbuf obj src_x src_y width height)

  method remove_option : string -> bool =
    fun key ->
      (Pixbuf.remove_option obj key)

  method rotate_simple : Gdkpixbuf_enums.pixbufrotation -> pixbuf option =
    fun angle ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.rotate_simple obj angle)

  method saturate_and_pixelate : 'p1. (<as_pixbuf: Pixbuf.t; ..> as 'p1) -> float -> bool -> unit =
    fun dest saturation pixelate ->
      let dest = dest#as_pixbuf in
      (Pixbuf.saturate_and_pixelate obj dest saturation pixelate)

  method save_to_streamv : 'p1 'p2. (#Ocgtk_gio.Gio.output_stream as 'p1) -> string -> string array option -> string array option -> (#Ocgtk_gio.Gio.cancellable as 'p2) option -> (bool, GError.t) result =
    fun stream type_ option_keys option_values cancellable ->
      let stream = stream#as_output_stream in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Pixbuf.save_to_streamv obj stream type_ option_keys option_values cancellable)

  method savev : string -> string -> string array option -> string array option -> (bool, GError.t) result =
    fun filename type_ option_keys option_values ->
      (Pixbuf.savev obj filename type_ option_keys option_values)

  method scale : 'p1. (<as_pixbuf: Pixbuf.t; ..> as 'p1) -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> unit =
    fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type ->
      let dest = dest#as_pixbuf in
      (Pixbuf.scale obj dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type)

  method scale_simple : int -> int -> Gdkpixbuf_enums.interptype -> pixbuf option =
    fun dest_width dest_height interp_type ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.scale_simple obj dest_width dest_height interp_type)

  method set_option : string -> string -> bool =
    fun key value ->
      (Pixbuf.set_option obj key value)

    method as_pixbuf = obj
end

