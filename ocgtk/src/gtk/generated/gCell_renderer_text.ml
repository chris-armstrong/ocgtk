(* Signal class defined in gcell_renderer_text_signals.ml *)

class type cell_renderer_text_t = object
    inherit GCell_renderer.cell_renderer_t
    inherit Gcell_renderer_text_signals.cell_renderer_text_signals
    method set_fixed_height_from_font : int -> unit
    method align_set : bool
    method set_align_set : bool -> unit
    method alignment : Ocgtk_pango.Pango.alignment
    method attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t
    method set_attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t -> unit
    method background : string
    method set_background : string -> unit
    method background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method set_background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
    method background_set : bool
    method set_background_set : bool -> unit
    method editable : bool
    method set_editable : bool -> unit
    method editable_set : bool
    method set_editable_set : bool -> unit
    method ellipsize : Ocgtk_pango.Pango.ellipsizemode
    method set_ellipsize : Ocgtk_pango.Pango.ellipsizemode -> unit
    method ellipsize_set : bool
    method set_ellipsize_set : bool -> unit
    method family : string
    method set_family : string -> unit
    method family_set : bool
    method set_family_set : bool -> unit
    method font : string
    method set_font : string -> unit
    method font_desc : Ocgtk_pango.Pango.Font_description.font_description_t
    method set_font_desc : Ocgtk_pango.Pango.Font_description.font_description_t -> unit
    method foreground : string
    method set_foreground : string -> unit
    method foreground_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method set_foreground_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
    method foreground_set : bool
    method set_foreground_set : bool -> unit
    method language : string
    method set_language : string -> unit
    method language_set : bool
    method set_language_set : bool -> unit
    method markup : string
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
    method stretch : Ocgtk_pango.Pango.stretch
    method set_stretch : Ocgtk_pango.Pango.stretch -> unit
    method stretch_set : bool
    method set_stretch_set : bool -> unit
    method strikethrough : bool
    method set_strikethrough : bool -> unit
    method strikethrough_set : bool
    method set_strikethrough_set : bool -> unit
    method style : Ocgtk_pango.Pango.style
    method set_style : Ocgtk_pango.Pango.style -> unit
    method style_set : bool
    method set_style_set : bool -> unit
    method text : string
    method set_text : string -> unit
    method underline : Ocgtk_pango.Pango.underline
    method set_underline : Ocgtk_pango.Pango.underline -> unit
    method underline_set : bool
    method set_underline_set : bool -> unit
    method variant : Ocgtk_pango.Pango.variant
    method set_variant : Ocgtk_pango.Pango.variant -> unit
    method variant_set : bool
    method set_variant_set : bool -> unit
    method weight : int
    method set_weight : int -> unit
    method weight_set : bool
    method set_weight_set : bool -> unit
    method width_chars : int
    method set_width_chars : int -> unit
    method wrap_mode : Ocgtk_pango.Pango.wrapmode
    method set_wrap_mode : Ocgtk_pango.Pango.wrapmode -> unit
    method wrap_width : int
    method set_wrap_width : int -> unit
    method as_cell_renderer_text : Cell_renderer_text.t
end

(* High-level class for CellRendererText *)
class cell_renderer_text (obj : Cell_renderer_text.t) : cell_renderer_text_t = object (self)
  inherit GCell_renderer.cell_renderer (Obj.magic obj : Cell_renderer.t)
  inherit Gcell_renderer_text_signals.cell_renderer_text_signals obj

  method set_fixed_height_from_font : int -> unit =
    fun number_of_rows ->
      (Cell_renderer_text.set_fixed_height_from_font obj number_of_rows)

  method align_set = Cell_renderer_text.get_align_set obj
  method set_align_set v =  Cell_renderer_text.set_align_set obj v

  method alignment = Cell_renderer_text.get_alignment obj

  method attributes = new Ocgtk_pango.Pango.Attr_list.attr_list (Cell_renderer_text.get_attributes obj)
  method set_attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t -> unit  = fun v ->  Cell_renderer_text.set_attributes obj v#as_attr_list

  method background = Cell_renderer_text.get_background obj
  method set_background v =  Cell_renderer_text.set_background obj v

  method background_rgba = new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Cell_renderer_text.get_background_rgba obj)
  method set_background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit  = fun v ->  Cell_renderer_text.set_background_rgba obj v#as_rgb_a

  method background_set = Cell_renderer_text.get_background_set obj
  method set_background_set v =  Cell_renderer_text.set_background_set obj v

  method editable = Cell_renderer_text.get_editable obj
  method set_editable v =  Cell_renderer_text.set_editable obj v

  method editable_set = Cell_renderer_text.get_editable_set obj
  method set_editable_set v =  Cell_renderer_text.set_editable_set obj v

  method ellipsize = Cell_renderer_text.get_ellipsize obj
  method set_ellipsize v =  Cell_renderer_text.set_ellipsize obj v

  method ellipsize_set = Cell_renderer_text.get_ellipsize_set obj
  method set_ellipsize_set v =  Cell_renderer_text.set_ellipsize_set obj v

  method family = Cell_renderer_text.get_family obj
  method set_family v =  Cell_renderer_text.set_family obj v

  method family_set = Cell_renderer_text.get_family_set obj
  method set_family_set v =  Cell_renderer_text.set_family_set obj v

  method font = Cell_renderer_text.get_font obj
  method set_font v =  Cell_renderer_text.set_font obj v

  method font_desc = new Ocgtk_pango.Pango.Font_description.font_description (Cell_renderer_text.get_font_desc obj)
  method set_font_desc : Ocgtk_pango.Pango.Font_description.font_description_t -> unit  = fun v ->  Cell_renderer_text.set_font_desc obj v#as_font_description

  method foreground = Cell_renderer_text.get_foreground obj
  method set_foreground v =  Cell_renderer_text.set_foreground obj v

  method foreground_rgba = new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Cell_renderer_text.get_foreground_rgba obj)
  method set_foreground_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit  = fun v ->  Cell_renderer_text.set_foreground_rgba obj v#as_rgb_a

  method foreground_set = Cell_renderer_text.get_foreground_set obj
  method set_foreground_set v =  Cell_renderer_text.set_foreground_set obj v

  method language = Cell_renderer_text.get_language obj
  method set_language v =  Cell_renderer_text.set_language obj v

  method language_set = Cell_renderer_text.get_language_set obj
  method set_language_set v =  Cell_renderer_text.set_language_set obj v

  method markup = Cell_renderer_text.get_markup obj
  method set_markup v =  Cell_renderer_text.set_markup obj v

  method max_width_chars = Cell_renderer_text.get_max_width_chars obj
  method set_max_width_chars v =  Cell_renderer_text.set_max_width_chars obj v

  method placeholder_text = Cell_renderer_text.get_placeholder_text obj
  method set_placeholder_text v =  Cell_renderer_text.set_placeholder_text obj v

  method rise = Cell_renderer_text.get_rise obj
  method set_rise v =  Cell_renderer_text.set_rise obj v

  method rise_set = Cell_renderer_text.get_rise_set obj
  method set_rise_set v =  Cell_renderer_text.set_rise_set obj v

  method scale = Cell_renderer_text.get_scale obj
  method set_scale v =  Cell_renderer_text.set_scale obj v

  method scale_set = Cell_renderer_text.get_scale_set obj
  method set_scale_set v =  Cell_renderer_text.set_scale_set obj v

  method single_paragraph_mode = Cell_renderer_text.get_single_paragraph_mode obj
  method set_single_paragraph_mode v =  Cell_renderer_text.set_single_paragraph_mode obj v

  method size = Cell_renderer_text.get_size obj
  method set_size v =  Cell_renderer_text.set_size obj v

  method size_points = Cell_renderer_text.get_size_points obj
  method set_size_points v =  Cell_renderer_text.set_size_points obj v

  method size_set = Cell_renderer_text.get_size_set obj
  method set_size_set v =  Cell_renderer_text.set_size_set obj v

  method stretch = Cell_renderer_text.get_stretch obj
  method set_stretch v =  Cell_renderer_text.set_stretch obj v

  method stretch_set = Cell_renderer_text.get_stretch_set obj
  method set_stretch_set v =  Cell_renderer_text.set_stretch_set obj v

  method strikethrough = Cell_renderer_text.get_strikethrough obj
  method set_strikethrough v =  Cell_renderer_text.set_strikethrough obj v

  method strikethrough_set = Cell_renderer_text.get_strikethrough_set obj
  method set_strikethrough_set v =  Cell_renderer_text.set_strikethrough_set obj v

  method style = Cell_renderer_text.get_style obj
  method set_style v =  Cell_renderer_text.set_style obj v

  method style_set = Cell_renderer_text.get_style_set obj
  method set_style_set v =  Cell_renderer_text.set_style_set obj v

  method text = Cell_renderer_text.get_text obj
  method set_text v =  Cell_renderer_text.set_text obj v

  method underline = Cell_renderer_text.get_underline obj
  method set_underline v =  Cell_renderer_text.set_underline obj v

  method underline_set = Cell_renderer_text.get_underline_set obj
  method set_underline_set v =  Cell_renderer_text.set_underline_set obj v

  method variant = Cell_renderer_text.get_variant obj
  method set_variant v =  Cell_renderer_text.set_variant obj v

  method variant_set = Cell_renderer_text.get_variant_set obj
  method set_variant_set v =  Cell_renderer_text.set_variant_set obj v

  method weight = Cell_renderer_text.get_weight obj
  method set_weight v =  Cell_renderer_text.set_weight obj v

  method weight_set = Cell_renderer_text.get_weight_set obj
  method set_weight_set v =  Cell_renderer_text.set_weight_set obj v

  method width_chars = Cell_renderer_text.get_width_chars obj
  method set_width_chars v =  Cell_renderer_text.set_width_chars obj v

  method wrap_mode = Cell_renderer_text.get_wrap_mode obj
  method set_wrap_mode v =  Cell_renderer_text.set_wrap_mode obj v

  method wrap_width = Cell_renderer_text.get_wrap_width obj
  method set_wrap_width v =  Cell_renderer_text.set_wrap_width obj v

    method as_cell_renderer_text = obj
end

let new_ () : cell_renderer_text_t =
  new cell_renderer_text (Cell_renderer_text.new_ ())

