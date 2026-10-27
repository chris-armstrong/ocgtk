class type cell_renderer_text_t = object
  inherit Cell_renderer.cell_renderer_t

  method on_edited :
    ?after:bool ->
    callback:(path:string -> new_text:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method set_fixed_height_from_font : int -> unit
  (** Sets the height of a renderer to explicitly be determined by the “font”
      and “y_pad” property set on it. Further changes in these properties do not
      affect the height, so they must be accompanied by a subsequent call to
      this function. Using this function is inflexible, and should really only
      be used if calculating the size of a cell is too slow (ie, a massive
      number of cells displayed). If [number_of_rows] is -1, then the fixed
      height is unset, and the height is determined by the properties again. *)

  method align_set : bool
  method set_align_set : bool -> unit
  method alignment : Ocpango.Enums.alignment
  method attributes : Ocpango.Attr_list.attr_list_t
  method set_attributes : Ocpango.Attr_list.attr_list_t -> unit
  method set_background : string -> unit
  method background_rgba : Ocgdk.Rgb_a.rgb_a_t
  method set_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method background_set : bool
  method set_background_set : bool -> unit
  method editable : bool
  method set_editable : bool -> unit
  method editable_set : bool
  method set_editable_set : bool -> unit
  method ellipsize : Ocpango.Enums.ellipsizemode
  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  method ellipsize_set : bool
  method set_ellipsize_set : bool -> unit
  method family : string
  method set_family : string -> unit
  method family_set : bool
  method set_family_set : bool -> unit
  method font : string
  method set_font : string -> unit
  method font_desc : Ocpango.Font_description.font_description_t
  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  method set_foreground : string -> unit
  method foreground_rgba : Ocgdk.Rgb_a.rgb_a_t
  method set_foreground_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method foreground_set : bool
  method set_foreground_set : bool -> unit
  method language : string
  method set_language : string -> unit
  method language_set : bool
  method set_language_set : bool -> unit
  method set_markup : string -> unit
  method max_width_chars : int
  method set_max_width_chars : int -> unit
  method placeholder_text : string
  method set_placeholder_text : string -> unit
  method rise : int
  method set_rise : int -> unit
  method rise_set : bool
  method set_rise_set : bool -> unit
  method scale : float
  method set_scale : float -> unit
  method scale_set : bool
  method set_scale_set : bool -> unit
  method single_paragraph_mode : bool
  method set_single_paragraph_mode : bool -> unit
  method size : int
  method set_size : int -> unit
  method size_points : float
  method set_size_points : float -> unit
  method size_set : bool
  method set_size_set : bool -> unit
  method stretch : Ocpango.Enums.stretch
  method set_stretch : Ocpango.Enums.stretch -> unit
  method stretch_set : bool
  method set_stretch_set : bool -> unit
  method strikethrough : bool
  method set_strikethrough : bool -> unit
  method strikethrough_set : bool
  method set_strikethrough_set : bool -> unit
  method style : Ocpango.Enums.style
  method set_style : Ocpango.Enums.style -> unit
  method style_set : bool
  method set_style_set : bool -> unit
  method text : string
  method set_text : string -> unit
  method underline : Ocpango.Enums.underline
  method set_underline : Ocpango.Enums.underline -> unit
  method underline_set : bool
  method set_underline_set : bool -> unit
  method variant : Ocpango.Enums.variant
  method set_variant : Ocpango.Enums.variant -> unit
  method variant_set : bool
  method set_variant_set : bool -> unit
  method weight : int
  method set_weight : int -> unit
  method weight_set : bool
  method set_weight_set : bool -> unit
  method width_chars : int
  method set_width_chars : int -> unit
  method wrap_mode : Ocpango.Enums.wrapmode
  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  method wrap_width : int
  method set_wrap_width : int -> unit
  method as_cell_renderer_text : Raw.Cell_renderer_text.t
end

(* High-level class for CellRendererText *)
class cell_renderer_text (obj : Raw.Cell_renderer_text.t) : cell_renderer_text_t
  =
  object (self)
    inherit Cell_renderer.cell_renderer (obj :> Raw.Cell_renderer.t)

    method on_edited ?(after = false) ~callback () =
      Raw.Cell_renderer_text.on_edited ~after self#as_cell_renderer_text
        ~callback

    method set_fixed_height_from_font : int -> unit =
      fun number_of_rows ->
        Raw.Cell_renderer_text.set_fixed_height_from_font obj number_of_rows

    method align_set = Raw.Cell_renderer_text.get_align_set obj
    method set_align_set v = Raw.Cell_renderer_text.set_align_set obj v
    method alignment = Raw.Cell_renderer_text.get_alignment obj

    method attributes =
      new Ocpango.Attr_list.attr_list
        (Raw.Cell_renderer_text.get_attributes obj)

    method set_attributes : Ocpango.Attr_list.attr_list_t -> unit =
      fun v -> Raw.Cell_renderer_text.set_attributes obj v#as_attr_list

    method set_background v = Raw.Cell_renderer_text.set_background obj v

    method background_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Cell_renderer_text.get_background_rgba obj)

    method set_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Cell_renderer_text.set_background_rgba obj v#as_rgb_a

    method background_set = Raw.Cell_renderer_text.get_background_set obj

    method set_background_set v =
      Raw.Cell_renderer_text.set_background_set obj v

    method editable = Raw.Cell_renderer_text.get_editable obj
    method set_editable v = Raw.Cell_renderer_text.set_editable obj v
    method editable_set = Raw.Cell_renderer_text.get_editable_set obj
    method set_editable_set v = Raw.Cell_renderer_text.set_editable_set obj v
    method ellipsize = Raw.Cell_renderer_text.get_ellipsize obj
    method set_ellipsize v = Raw.Cell_renderer_text.set_ellipsize obj v
    method ellipsize_set = Raw.Cell_renderer_text.get_ellipsize_set obj
    method set_ellipsize_set v = Raw.Cell_renderer_text.set_ellipsize_set obj v
    method family = Raw.Cell_renderer_text.get_family obj
    method set_family v = Raw.Cell_renderer_text.set_family obj v
    method family_set = Raw.Cell_renderer_text.get_family_set obj
    method set_family_set v = Raw.Cell_renderer_text.set_family_set obj v
    method font = Raw.Cell_renderer_text.get_font obj
    method set_font v = Raw.Cell_renderer_text.set_font obj v

    method font_desc =
      new Ocpango.Font_description.font_description
        (Raw.Cell_renderer_text.get_font_desc obj)

    method set_font_desc : Ocpango.Font_description.font_description_t -> unit =
      fun v -> Raw.Cell_renderer_text.set_font_desc obj v#as_font_description

    method set_foreground v = Raw.Cell_renderer_text.set_foreground obj v

    method foreground_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Cell_renderer_text.get_foreground_rgba obj)

    method set_foreground_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Cell_renderer_text.set_foreground_rgba obj v#as_rgb_a

    method foreground_set = Raw.Cell_renderer_text.get_foreground_set obj

    method set_foreground_set v =
      Raw.Cell_renderer_text.set_foreground_set obj v

    method language = Raw.Cell_renderer_text.get_language obj
    method set_language v = Raw.Cell_renderer_text.set_language obj v
    method language_set = Raw.Cell_renderer_text.get_language_set obj
    method set_language_set v = Raw.Cell_renderer_text.set_language_set obj v
    method set_markup v = Raw.Cell_renderer_text.set_markup obj v
    method max_width_chars = Raw.Cell_renderer_text.get_max_width_chars obj

    method set_max_width_chars v =
      Raw.Cell_renderer_text.set_max_width_chars obj v

    method placeholder_text = Raw.Cell_renderer_text.get_placeholder_text obj

    method set_placeholder_text v =
      Raw.Cell_renderer_text.set_placeholder_text obj v

    method rise = Raw.Cell_renderer_text.get_rise obj
    method set_rise v = Raw.Cell_renderer_text.set_rise obj v
    method rise_set = Raw.Cell_renderer_text.get_rise_set obj
    method set_rise_set v = Raw.Cell_renderer_text.set_rise_set obj v
    method scale = Raw.Cell_renderer_text.get_scale obj
    method set_scale v = Raw.Cell_renderer_text.set_scale obj v
    method scale_set = Raw.Cell_renderer_text.get_scale_set obj
    method set_scale_set v = Raw.Cell_renderer_text.set_scale_set obj v

    method single_paragraph_mode =
      Raw.Cell_renderer_text.get_single_paragraph_mode obj

    method set_single_paragraph_mode v =
      Raw.Cell_renderer_text.set_single_paragraph_mode obj v

    method size = Raw.Cell_renderer_text.get_size obj
    method set_size v = Raw.Cell_renderer_text.set_size obj v
    method size_points = Raw.Cell_renderer_text.get_size_points obj
    method set_size_points v = Raw.Cell_renderer_text.set_size_points obj v
    method size_set = Raw.Cell_renderer_text.get_size_set obj
    method set_size_set v = Raw.Cell_renderer_text.set_size_set obj v
    method stretch = Raw.Cell_renderer_text.get_stretch obj
    method set_stretch v = Raw.Cell_renderer_text.set_stretch obj v
    method stretch_set = Raw.Cell_renderer_text.get_stretch_set obj
    method set_stretch_set v = Raw.Cell_renderer_text.set_stretch_set obj v
    method strikethrough = Raw.Cell_renderer_text.get_strikethrough obj
    method set_strikethrough v = Raw.Cell_renderer_text.set_strikethrough obj v
    method strikethrough_set = Raw.Cell_renderer_text.get_strikethrough_set obj

    method set_strikethrough_set v =
      Raw.Cell_renderer_text.set_strikethrough_set obj v

    method style = Raw.Cell_renderer_text.get_style obj
    method set_style v = Raw.Cell_renderer_text.set_style obj v
    method style_set = Raw.Cell_renderer_text.get_style_set obj
    method set_style_set v = Raw.Cell_renderer_text.set_style_set obj v
    method text = Raw.Cell_renderer_text.get_text obj
    method set_text v = Raw.Cell_renderer_text.set_text obj v
    method underline = Raw.Cell_renderer_text.get_underline obj
    method set_underline v = Raw.Cell_renderer_text.set_underline obj v
    method underline_set = Raw.Cell_renderer_text.get_underline_set obj
    method set_underline_set v = Raw.Cell_renderer_text.set_underline_set obj v
    method variant = Raw.Cell_renderer_text.get_variant obj
    method set_variant v = Raw.Cell_renderer_text.set_variant obj v
    method variant_set = Raw.Cell_renderer_text.get_variant_set obj
    method set_variant_set v = Raw.Cell_renderer_text.set_variant_set obj v
    method weight = Raw.Cell_renderer_text.get_weight obj
    method set_weight v = Raw.Cell_renderer_text.set_weight obj v
    method weight_set = Raw.Cell_renderer_text.get_weight_set obj
    method set_weight_set v = Raw.Cell_renderer_text.set_weight_set obj v
    method width_chars = Raw.Cell_renderer_text.get_width_chars obj
    method set_width_chars v = Raw.Cell_renderer_text.set_width_chars obj v
    method wrap_mode = Raw.Cell_renderer_text.get_wrap_mode obj
    method set_wrap_mode v = Raw.Cell_renderer_text.set_wrap_mode obj v
    method wrap_width = Raw.Cell_renderer_text.get_wrap_width obj
    method set_wrap_width v = Raw.Cell_renderer_text.set_wrap_width obj v
    method as_cell_renderer_text = obj
  end

let new_ () : cell_renderer_text_t =
  new cell_renderer_text (Raw.Cell_renderer_text.new_ ())
