(* Signal class defined in gcell_renderer_text_signals.ml *)

(* High-level class for CellRendererText *)
class cell_renderer_text (obj : Cell_renderer_text.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_text.as_cell_renderer obj)
  inherit Gcell_renderer_text_signals.cell_renderer_text_signals obj

  method align_set = Cell_renderer_text.get_align_set obj
  method set_align_set v = Cell_renderer_text.set_align_set obj v

  method background = Cell_renderer_text.get_background obj
  method set_background v = Cell_renderer_text.set_background obj v

  method background_set = Cell_renderer_text.get_background_set obj
  method set_background_set v = Cell_renderer_text.set_background_set obj v

  method editable = Cell_renderer_text.get_editable obj
  method set_editable v = Cell_renderer_text.set_editable obj v

  method editable_set = Cell_renderer_text.get_editable_set obj
  method set_editable_set v = Cell_renderer_text.set_editable_set obj v

  method ellipsize_set = Cell_renderer_text.get_ellipsize_set obj
  method set_ellipsize_set v = Cell_renderer_text.set_ellipsize_set obj v

  method family = Cell_renderer_text.get_family obj
  method set_family v = Cell_renderer_text.set_family obj v

  method family_set = Cell_renderer_text.get_family_set obj
  method set_family_set v = Cell_renderer_text.set_family_set obj v

  method font = Cell_renderer_text.get_font obj
  method set_font v = Cell_renderer_text.set_font obj v

  method foreground = Cell_renderer_text.get_foreground obj
  method set_foreground v = Cell_renderer_text.set_foreground obj v

  method foreground_set = Cell_renderer_text.get_foreground_set obj
  method set_foreground_set v = Cell_renderer_text.set_foreground_set obj v

  method language = Cell_renderer_text.get_language obj
  method set_language v = Cell_renderer_text.set_language obj v

  method language_set = Cell_renderer_text.get_language_set obj
  method set_language_set v = Cell_renderer_text.set_language_set obj v

  method markup = Cell_renderer_text.get_markup obj
  method set_markup v = Cell_renderer_text.set_markup obj v

  method max_width_chars = Cell_renderer_text.get_max_width_chars obj
  method set_max_width_chars v = Cell_renderer_text.set_max_width_chars obj v

  method placeholder_text = Cell_renderer_text.get_placeholder_text obj
  method set_placeholder_text v = Cell_renderer_text.set_placeholder_text obj v

  method rise = Cell_renderer_text.get_rise obj
  method set_rise v = Cell_renderer_text.set_rise obj v

  method rise_set = Cell_renderer_text.get_rise_set obj
  method set_rise_set v = Cell_renderer_text.set_rise_set obj v

  method scale = Cell_renderer_text.get_scale obj
  method set_scale v = Cell_renderer_text.set_scale obj v

  method scale_set = Cell_renderer_text.get_scale_set obj
  method set_scale_set v = Cell_renderer_text.set_scale_set obj v

  method single_paragraph_mode = Cell_renderer_text.get_single_paragraph_mode obj
  method set_single_paragraph_mode v = Cell_renderer_text.set_single_paragraph_mode obj v

  method size = Cell_renderer_text.get_size obj
  method set_size v = Cell_renderer_text.set_size obj v

  method size_points = Cell_renderer_text.get_size_points obj
  method set_size_points v = Cell_renderer_text.set_size_points obj v

  method size_set = Cell_renderer_text.get_size_set obj
  method set_size_set v = Cell_renderer_text.set_size_set obj v

  method stretch_set = Cell_renderer_text.get_stretch_set obj
  method set_stretch_set v = Cell_renderer_text.set_stretch_set obj v

  method strikethrough = Cell_renderer_text.get_strikethrough obj
  method set_strikethrough v = Cell_renderer_text.set_strikethrough obj v

  method strikethrough_set = Cell_renderer_text.get_strikethrough_set obj
  method set_strikethrough_set v = Cell_renderer_text.set_strikethrough_set obj v

  method style_set = Cell_renderer_text.get_style_set obj
  method set_style_set v = Cell_renderer_text.set_style_set obj v

  method text = Cell_renderer_text.get_text obj
  method set_text v = Cell_renderer_text.set_text obj v

  method underline_set = Cell_renderer_text.get_underline_set obj
  method set_underline_set v = Cell_renderer_text.set_underline_set obj v

  method variant_set = Cell_renderer_text.get_variant_set obj
  method set_variant_set v = Cell_renderer_text.set_variant_set obj v

  method weight = Cell_renderer_text.get_weight obj
  method set_weight v = Cell_renderer_text.set_weight obj v

  method weight_set = Cell_renderer_text.get_weight_set obj
  method set_weight_set v = Cell_renderer_text.set_weight_set obj v

  method width_chars = Cell_renderer_text.get_width_chars obj
  method set_width_chars v = Cell_renderer_text.set_width_chars obj v

  method wrap_width = Cell_renderer_text.get_wrap_width obj
  method set_wrap_width v = Cell_renderer_text.set_wrap_width obj v

  method set_fixed_height_from_font : int -> unit = fun number_of_rows -> (Cell_renderer_text.set_fixed_height_from_font obj number_of_rows)

  method as_cell_renderer = (Cell_renderer_text.as_cell_renderer obj)
    method as_cell_renderer_text = obj
end

