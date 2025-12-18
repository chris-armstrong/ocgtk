(* High-level class for TextTag *)
class text_tag (obj : Text_tag.t) = object (self)

  method accumulative_margin = Text_tag.get_accumulative_margin obj
  method set_accumulative_margin v = Text_tag.set_accumulative_margin obj v

  method allow_breaks = Text_tag.get_allow_breaks obj
  method set_allow_breaks v = Text_tag.set_allow_breaks obj v

  method allow_breaks_set = Text_tag.get_allow_breaks_set obj
  method set_allow_breaks_set v = Text_tag.set_allow_breaks_set obj v

  method background = Text_tag.get_background obj
  method set_background v = Text_tag.set_background obj v

  method background_full_height = Text_tag.get_background_full_height obj
  method set_background_full_height v = Text_tag.set_background_full_height obj v

  method background_full_height_set = Text_tag.get_background_full_height_set obj
  method set_background_full_height_set v = Text_tag.set_background_full_height_set obj v

  method background_set = Text_tag.get_background_set obj
  method set_background_set v = Text_tag.set_background_set obj v

  method editable = Text_tag.get_editable obj
  method set_editable v = Text_tag.set_editable obj v

  method editable_set = Text_tag.get_editable_set obj
  method set_editable_set v = Text_tag.set_editable_set obj v

  method fallback = Text_tag.get_fallback obj
  method set_fallback v = Text_tag.set_fallback obj v

  method fallback_set = Text_tag.get_fallback_set obj
  method set_fallback_set v = Text_tag.set_fallback_set obj v

  method family = Text_tag.get_family obj
  method set_family v = Text_tag.set_family obj v

  method family_set = Text_tag.get_family_set obj
  method set_family_set v = Text_tag.set_family_set obj v

  method font = Text_tag.get_font obj
  method set_font v = Text_tag.set_font obj v

  method font_features = Text_tag.get_font_features obj
  method set_font_features v = Text_tag.set_font_features obj v

  method font_features_set = Text_tag.get_font_features_set obj
  method set_font_features_set v = Text_tag.set_font_features_set obj v

  method foreground = Text_tag.get_foreground obj
  method set_foreground v = Text_tag.set_foreground obj v

  method foreground_set = Text_tag.get_foreground_set obj
  method set_foreground_set v = Text_tag.set_foreground_set obj v

  method indent = Text_tag.get_indent obj
  method set_indent v = Text_tag.set_indent obj v

  method indent_set = Text_tag.get_indent_set obj
  method set_indent_set v = Text_tag.set_indent_set obj v

  method insert_hyphens = Text_tag.get_insert_hyphens obj
  method set_insert_hyphens v = Text_tag.set_insert_hyphens obj v

  method insert_hyphens_set = Text_tag.get_insert_hyphens_set obj
  method set_insert_hyphens_set v = Text_tag.set_insert_hyphens_set obj v

  method invisible = Text_tag.get_invisible obj
  method set_invisible v = Text_tag.set_invisible obj v

  method invisible_set = Text_tag.get_invisible_set obj
  method set_invisible_set v = Text_tag.set_invisible_set obj v

  method justification_set = Text_tag.get_justification_set obj
  method set_justification_set v = Text_tag.set_justification_set obj v

  method language = Text_tag.get_language obj
  method set_language v = Text_tag.set_language obj v

  method language_set = Text_tag.get_language_set obj
  method set_language_set v = Text_tag.set_language_set obj v

  method left_margin = Text_tag.get_left_margin obj
  method set_left_margin v = Text_tag.set_left_margin obj v

  method left_margin_set = Text_tag.get_left_margin_set obj
  method set_left_margin_set v = Text_tag.set_left_margin_set obj v

  method letter_spacing = Text_tag.get_letter_spacing obj
  method set_letter_spacing v = Text_tag.set_letter_spacing obj v

  method letter_spacing_set = Text_tag.get_letter_spacing_set obj
  method set_letter_spacing_set v = Text_tag.set_letter_spacing_set obj v

  method line_height = Text_tag.get_line_height obj
  method set_line_height v = Text_tag.set_line_height obj v

  method line_height_set = Text_tag.get_line_height_set obj
  method set_line_height_set v = Text_tag.set_line_height_set obj v

  method name = Text_tag.get_name obj

  method overline_rgba_set = Text_tag.get_overline_rgba_set obj
  method set_overline_rgba_set v = Text_tag.set_overline_rgba_set obj v

  method overline_set = Text_tag.get_overline_set obj
  method set_overline_set v = Text_tag.set_overline_set obj v

  method paragraph_background = Text_tag.get_paragraph_background obj
  method set_paragraph_background v = Text_tag.set_paragraph_background obj v

  method paragraph_background_set = Text_tag.get_paragraph_background_set obj
  method set_paragraph_background_set v = Text_tag.set_paragraph_background_set obj v

  method pixels_above_lines = Text_tag.get_pixels_above_lines obj
  method set_pixels_above_lines v = Text_tag.set_pixels_above_lines obj v

  method pixels_above_lines_set = Text_tag.get_pixels_above_lines_set obj
  method set_pixels_above_lines_set v = Text_tag.set_pixels_above_lines_set obj v

  method pixels_below_lines = Text_tag.get_pixels_below_lines obj
  method set_pixels_below_lines v = Text_tag.set_pixels_below_lines obj v

  method pixels_below_lines_set = Text_tag.get_pixels_below_lines_set obj
  method set_pixels_below_lines_set v = Text_tag.set_pixels_below_lines_set obj v

  method pixels_inside_wrap = Text_tag.get_pixels_inside_wrap obj
  method set_pixels_inside_wrap v = Text_tag.set_pixels_inside_wrap obj v

  method pixels_inside_wrap_set = Text_tag.get_pixels_inside_wrap_set obj
  method set_pixels_inside_wrap_set v = Text_tag.set_pixels_inside_wrap_set obj v

  method right_margin = Text_tag.get_right_margin obj
  method set_right_margin v = Text_tag.set_right_margin obj v

  method right_margin_set = Text_tag.get_right_margin_set obj
  method set_right_margin_set v = Text_tag.set_right_margin_set obj v

  method rise = Text_tag.get_rise obj
  method set_rise v = Text_tag.set_rise obj v

  method rise_set = Text_tag.get_rise_set obj
  method set_rise_set v = Text_tag.set_rise_set obj v

  method scale = Text_tag.get_scale obj
  method set_scale v = Text_tag.set_scale obj v

  method scale_set = Text_tag.get_scale_set obj
  method set_scale_set v = Text_tag.set_scale_set obj v

  method sentence = Text_tag.get_sentence obj
  method set_sentence v = Text_tag.set_sentence obj v

  method sentence_set = Text_tag.get_sentence_set obj
  method set_sentence_set v = Text_tag.set_sentence_set obj v

  method show_spaces_set = Text_tag.get_show_spaces_set obj
  method set_show_spaces_set v = Text_tag.set_show_spaces_set obj v

  method size = Text_tag.get_size obj
  method set_size v = Text_tag.set_size obj v

  method size_points = Text_tag.get_size_points obj
  method set_size_points v = Text_tag.set_size_points obj v

  method size_set = Text_tag.get_size_set obj
  method set_size_set v = Text_tag.set_size_set obj v

  method stretch_set = Text_tag.get_stretch_set obj
  method set_stretch_set v = Text_tag.set_stretch_set obj v

  method strikethrough = Text_tag.get_strikethrough obj
  method set_strikethrough v = Text_tag.set_strikethrough obj v

  method strikethrough_rgba_set = Text_tag.get_strikethrough_rgba_set obj
  method set_strikethrough_rgba_set v = Text_tag.set_strikethrough_rgba_set obj v

  method strikethrough_set = Text_tag.get_strikethrough_set obj
  method set_strikethrough_set v = Text_tag.set_strikethrough_set obj v

  method style_set = Text_tag.get_style_set obj
  method set_style_set v = Text_tag.set_style_set obj v

  method tabs_set = Text_tag.get_tabs_set obj
  method set_tabs_set v = Text_tag.set_tabs_set obj v

  method text_transform_set = Text_tag.get_text_transform_set obj
  method set_text_transform_set v = Text_tag.set_text_transform_set obj v

  method underline_rgba_set = Text_tag.get_underline_rgba_set obj
  method set_underline_rgba_set v = Text_tag.set_underline_rgba_set obj v

  method underline_set = Text_tag.get_underline_set obj
  method set_underline_set v = Text_tag.set_underline_set obj v

  method variant_set = Text_tag.get_variant_set obj
  method set_variant_set v = Text_tag.set_variant_set obj v

  method weight = Text_tag.get_weight obj
  method set_weight v = Text_tag.set_weight obj v

  method weight_set = Text_tag.get_weight_set obj
  method set_weight_set v = Text_tag.set_weight_set obj v

  method word = Text_tag.get_word obj
  method set_word v = Text_tag.set_word obj v

  method word_set = Text_tag.get_word_set obj
  method set_word_set v = Text_tag.set_word_set obj v

  method wrap_mode_set = Text_tag.get_wrap_mode_set obj
  method set_wrap_mode_set v = Text_tag.set_wrap_mode_set obj v

  method changed : bool -> unit = fun size_changed -> (Text_tag.changed obj size_changed)

  method get_priority : unit -> int = fun () -> (Text_tag.get_priority obj )

  method set_priority : int -> unit = fun priority -> (Text_tag.set_priority obj priority)

    method as_text_tag = obj
end

