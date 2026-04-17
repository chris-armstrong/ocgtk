class type pixbuf_t = object
    inherit Ocgtk_gio.Gio.Icon.icon_t
    inherit Ocgtk_gio.Gio.Loadable_icon.loadable_icon_t
    method apply_embedded_orientation : unit -> pixbuf_t option
    method composite : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> unit
    method composite_color : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> int -> int -> int -> UInt32.t -> UInt32.t -> unit
    method composite_color_simple : int -> int -> Gdkpixbuf_enums.interptype -> int -> int -> UInt32.t -> UInt32.t -> pixbuf_t option
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
    method save_to_streamv : Ocgtk_gio.Gio.Output_stream.output_stream_t -> string -> string array option -> string array option -> Ocgtk_gio.Gio.Cancellable.cancellable_t option -> (bool, GError.t) result
    method savev : string -> string -> string array option -> string array option -> (bool, GError.t) result
    method scale : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> unit
    method scale_simple : int -> int -> Gdkpixbuf_enums.interptype -> pixbuf_t option
    method set_option : string -> string -> bool
    method pixel_bytes : Glib_bytes.t
    method as_pixbuf : Pixbuf.t
end

(* High-level class for Pixbuf *)
class pixbuf (obj : Pixbuf.t) : pixbuf_t = object (self)
  inherit Ocgtk_gio.Gio.Icon.icon (Ocgtk_gio.Gio.Wrappers.Icon.from_gobject obj)
  inherit Ocgtk_gio.Gio.Loadable_icon.loadable_icon (Ocgtk_gio.Gio.Wrappers.Loadable_icon.from_gobject obj)

  method apply_embedded_orientation : unit -> pixbuf_t option =
    fun () ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.apply_embedded_orientation obj)

  method composite : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> unit =
    fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type overall_alpha ->
      let dest = dest#as_pixbuf in
      (Pixbuf.composite obj dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type overall_alpha)

  method composite_color : pixbuf_t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> int -> int -> int -> UInt32.t -> UInt32.t -> unit =
    fun dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type overall_alpha check_x check_y check_size color1 color2 ->
      let dest = dest#as_pixbuf in
      (Pixbuf.composite_color obj dest dest_x dest_y dest_width dest_height offset_x offset_y scale_x scale_y interp_type overall_alpha check_x check_y check_size color1 color2)

  method composite_color_simple : int -> int -> Gdkpixbuf_enums.interptype -> int -> int -> UInt32.t -> UInt32.t -> pixbuf_t option =
    fun dest_width dest_height interp_type overall_alpha check_size color1 color2 ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.composite_color_simple obj dest_width dest_height interp_type overall_alpha check_size color1 color2)

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

  method fill : UInt32.t -> unit =
    fun pixel ->
      (Pixbuf.fill obj pixel)

  method flip : bool -> pixbuf_t option =
    fun horizontal ->
      Option.map (fun ret -> new pixbuf ret) (Pixbuf.flip obj horizontal)

  method get_bits_per_sample : unit -> int =
    fun () ->
      (Pixbuf.get_bits_per_sample obj)

  method get_byte_length : unit -> Gsize.t =
    fun () ->
      (Pixbuf.get_byte_length obj)

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

  method read_pixel_bytes : unit -> Glib_bytes.t =
    fun () ->
      (Pixbuf.read_pixel_bytes obj)

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

  method save_to_streamv : Ocgtk_gio.Gio.Output_stream.output_stream_t -> string -> string array option -> string array option -> Ocgtk_gio.Gio.Cancellable.cancellable_t option -> (bool, GError.t) result =
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

  method pixel_bytes = Pixbuf.get_pixel_bytes obj

    method as_pixbuf = obj
end

let new_ (colorspace : Gdkpixbuf_enums.colorspace) (has_alpha : bool) (bits_per_sample : int) (width : int) (height : int) : pixbuf_t =
  let obj_ = Pixbuf.new_ colorspace has_alpha bits_per_sample width height in
  new pixbuf obj_

let new_from_bytes (data : Glib_bytes.t) (colorspace : Gdkpixbuf_enums.colorspace) (has_alpha : bool) (bits_per_sample : int) (width : int) (height : int) (rowstride : int) : pixbuf_t =
  let obj_ = Pixbuf.new_from_bytes data colorspace has_alpha bits_per_sample width height rowstride in
  new pixbuf obj_

let new_from_file (filename : string) : (pixbuf_t, GError.t) result =
  let obj_ = Pixbuf.new_from_file filename in
Result.map (fun obj_ ->  new pixbuf obj_) obj_

let new_from_file_at_scale (filename : string) (width : int) (height : int) (preserve_aspect_ratio : bool) : (pixbuf_t, GError.t) result =
  let obj_ = Pixbuf.new_from_file_at_scale filename width height preserve_aspect_ratio in
Result.map (fun obj_ ->  new pixbuf obj_) obj_

let new_from_file_at_size (filename : string) (width : int) (height : int) : (pixbuf_t, GError.t) result =
  let obj_ = Pixbuf.new_from_file_at_size filename width height in
Result.map (fun obj_ ->  new pixbuf obj_) obj_

let new_from_resource (resource_path : string) : (pixbuf_t, GError.t) result =
  let obj_ = Pixbuf.new_from_resource resource_path in
Result.map (fun obj_ ->  new pixbuf obj_) obj_

let new_from_resource_at_scale (resource_path : string) (width : int) (height : int) (preserve_aspect_ratio : bool) : (pixbuf_t, GError.t) result =
  let obj_ = Pixbuf.new_from_resource_at_scale resource_path width height preserve_aspect_ratio in
Result.map (fun obj_ ->  new pixbuf obj_) obj_

let new_from_stream (stream : Ocgtk_gio.Gio.Input_stream.input_stream_t) (cancellable : Ocgtk_gio.Gio.Cancellable.cancellable_t option) : (pixbuf_t, GError.t) result =
  let stream = stream#as_input_stream in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = Pixbuf.new_from_stream stream cancellable in
Result.map (fun obj_ ->  new pixbuf obj_) obj_

let new_from_stream_at_scale (stream : Ocgtk_gio.Gio.Input_stream.input_stream_t) (width : int) (height : int) (preserve_aspect_ratio : bool) (cancellable : Ocgtk_gio.Gio.Cancellable.cancellable_t option) : (pixbuf_t, GError.t) result =
  let stream = stream#as_input_stream in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = Pixbuf.new_from_stream_at_scale stream width height preserve_aspect_ratio cancellable in
Result.map (fun obj_ ->  new pixbuf obj_) obj_

let new_from_stream_finish (async_result : Ocgtk_gio.Gio.Async_result.async_result_t) : (pixbuf_t, GError.t) result =
  let async_result = async_result#as_async_result in
  let obj_ = Pixbuf.new_from_stream_finish async_result in
Result.map (fun obj_ ->  new pixbuf obj_) obj_

let new_from_xpm_data (data : string array) : pixbuf_t =
  let obj_ = Pixbuf.new_from_xpm_data data in
  new pixbuf obj_

