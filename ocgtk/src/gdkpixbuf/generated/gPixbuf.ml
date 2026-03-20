class type pixbuf_t = object
    method apply_embedded_orientation : unit -> pixbuf_t option
    method composite : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> unit
    method copy : unit -> pixbuf_t option
    method copy_area : int -> int -> int -> int -> pixbuf_t -> int -> int -> unit
    method copy_options : pixbuf_t -> bool
    method flip : bool -> pixbuf_t option
    method get_bits_per_sample : unit -> int
    method get_colorspace : unit -> Gdkpixbuf_enums.colorspace
    method get_has_alpha : unit -> bool
    method get_height : unit -> int
    method get_n_channels : unit -> int
    method get_option : string -> string option
    method get_rowstride : unit -> int
    method get_width : unit -> int
    method new_subpixbuf : int -> int -> int -> int -> pixbuf_t
    method remove_option : string -> bool
    method rotate_simple : Gdkpixbuf_enums.pixbufrotation -> pixbuf_t option
    method saturate_and_pixelate : pixbuf_t -> float -> bool -> unit
    method save_to_streamv : Ocgtk_gio.Gio.output_stream_t -> string -> string array option -> string array option -> Ocgtk_gio.Gio.cancellable_t option -> (bool, GError.t) result
    method savev : string -> string -> string array option -> string array option -> (bool, GError.t) result
    method scale : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> unit
    method scale_simple : int -> int -> Gdkpixbuf_enums.interptype -> pixbuf_t option
    method set_option : string -> string -> bool
    method as_pixbuf : Pixbuf.t
end

(* High-level class for Pixbuf *)
class pixbuf (obj : Pixbuf.t) : pixbuf_t = object (self)

  method apply_embedded_orientation : unit -> pixbuf_t option =
    fun () ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.apply_embedded_orientation obj)

  method composite : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> unit =
    fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type overall_alpha ->
      let dest = dest#as_pixbuf in
      (Pixbuf.composite obj dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type overall_alpha)

  method copy : unit -> pixbuf_t option =
    fun () ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.copy obj)

  method copy_area : int -> int -> int -> int -> pixbuf_t -> int -> int -> unit =
    fun src_x src_y width height dest_pixbuf dest_x dest_y ->
      let dest_pixbuf = dest_pixbuf#as_pixbuf in
      (Pixbuf.copy_area obj src_x src_y width height dest_pixbuf dest_x dest_y)

  method copy_options : pixbuf_t -> bool =
    fun dest_pixbuf ->
      let dest_pixbuf = dest_pixbuf#as_pixbuf in
      (Pixbuf.copy_options obj dest_pixbuf)

  method flip : bool -> pixbuf_t option =
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

  method new_subpixbuf : int -> int -> int -> int -> pixbuf_t =
    fun src_x src_y width height ->
      new  pixbuf(Pixbuf.new_subpixbuf obj src_x src_y width height)

  method remove_option : string -> bool =
    fun key ->
      (Pixbuf.remove_option obj key)

  method rotate_simple : Gdkpixbuf_enums.pixbufrotation -> pixbuf_t option =
    fun angle ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.rotate_simple obj angle)

  method saturate_and_pixelate : pixbuf_t -> float -> bool -> unit =
    fun dest saturation pixelate ->
      let dest = dest#as_pixbuf in
      (Pixbuf.saturate_and_pixelate obj dest saturation pixelate)

  method save_to_streamv : Ocgtk_gio.Gio.output_stream_t -> string -> string array option -> string array option -> Ocgtk_gio.Gio.cancellable_t option -> (bool, GError.t) result =
    fun stream type_ option_keys option_values cancellable ->
      let stream = stream#as_output_stream in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Pixbuf.save_to_streamv obj stream type_ option_keys option_values cancellable)

  method savev : string -> string -> string array option -> string array option -> (bool, GError.t) result =
    fun filename type_ option_keys option_values ->
      (Pixbuf.savev obj filename type_ option_keys option_values)

  method scale : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> unit =
    fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type ->
      let dest = dest#as_pixbuf in
      (Pixbuf.scale obj dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type)

  method scale_simple : int -> int -> Gdkpixbuf_enums.interptype -> pixbuf_t option =
    fun dest_width dest_height interp_type ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.scale_simple obj dest_width dest_height interp_type)

  method set_option : string -> string -> bool =
    fun key value ->
      (Pixbuf.set_option obj key value)

    method as_pixbuf = obj
end

