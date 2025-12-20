class text_tag : Text_tag.t ->
  object
    method changed : bool -> unit
    method get_priority : unit -> int
    method set_priority : int -> unit
    method accumulative_margin : bool
    method set_accumulative_margin : bool -> unit
    method allow_breaks : bool
    method set_allow_breaks : bool -> unit
    method allow_breaks_set : bool
    method set_allow_breaks_set : bool -> unit
    method background : string
    method set_background : string -> unit
    method background_full_height : bool
    method set_background_full_height : bool -> unit
    method background_full_height_set : bool
    method set_background_full_height_set : bool -> unit
    method background_set : bool
    method set_background_set : bool -> unit
    method direction : Gtk_enums.textdirection
    method set_direction : Gtk_enums.textdirection -> unit
    method editable : bool
    method set_editable : bool -> unit
    method editable_set : bool
    method set_editable_set : bool -> unit
    method fallback : bool
    method set_fallback : bool -> unit
    method fallback_set : bool
    method set_fallback_set : bool -> unit
    method family : string
    method set_family : string -> unit
    method family_set : bool
    method set_family_set : bool -> unit
    method font : string
    method set_font : string -> unit
    method font_features : string
    method set_font_features : string -> unit
    method font_features_set : bool
    method set_font_features_set : bool -> unit
    method foreground : string
    method set_foreground : string -> unit
    method foreground_set : bool
    method set_foreground_set : bool -> unit
    method indent : int
    method set_indent : int -> unit
    method indent_set : bool
    method set_indent_set : bool -> unit
    method insert_hyphens : bool
    method set_insert_hyphens : bool -> unit
    method insert_hyphens_set : bool
    method set_insert_hyphens_set : bool -> unit
    method invisible : bool
    method set_invisible : bool -> unit
    method invisible_set : bool
    method set_invisible_set : bool -> unit
    method justification : Gtk_enums.justification
    method set_justification : Gtk_enums.justification -> unit
    method justification_set : bool
    method set_justification_set : bool -> unit
    method language : string
    method set_language : string -> unit
    method language_set : bool
    method set_language_set : bool -> unit
    method left_margin : int
    method set_left_margin : int -> unit
    method left_margin_set : bool
    method set_left_margin_set : bool -> unit
    method letter_spacing : int
    method set_letter_spacing : int -> unit
    method letter_spacing_set : bool
    method set_letter_spacing_set : bool -> unit
    method line_height : float
    method set_line_height : float -> unit
    method line_height_set : bool
    method set_line_height_set : bool -> unit
    method name : string
    method overline_rgba_set : bool
    method set_overline_rgba_set : bool -> unit
    method overline_set : bool
    method set_overline_set : bool -> unit
    method paragraph_background : string
    method set_paragraph_background : string -> unit
    method paragraph_background_set : bool
    method set_paragraph_background_set : bool -> unit
    method pixels_above_lines : int
    method set_pixels_above_lines : int -> unit
    method pixels_above_lines_set : bool
    method set_pixels_above_lines_set : bool -> unit
    method pixels_below_lines : int
    method set_pixels_below_lines : int -> unit
    method pixels_below_lines_set : bool
    method set_pixels_below_lines_set : bool -> unit
    method pixels_inside_wrap : int
    method set_pixels_inside_wrap : int -> unit
    method pixels_inside_wrap_set : bool
    method set_pixels_inside_wrap_set : bool -> unit
    method right_margin : int
    method set_right_margin : int -> unit
    method right_margin_set : bool
    method set_right_margin_set : bool -> unit
    method rise : int
    method set_rise : int -> unit
    method rise_set : bool
    method set_rise_set : bool -> unit
    method scale : float
    method set_scale : float -> unit
    method scale_set : bool
    method set_scale_set : bool -> unit
    method sentence : bool
    method set_sentence : bool -> unit
    method sentence_set : bool
    method set_sentence_set : bool -> unit
    method show_spaces_set : bool
    method set_show_spaces_set : bool -> unit
    method size : int
    method set_size : int -> unit
    method size_points : float
    method set_size_points : float -> unit
    method size_set : bool
    method set_size_set : bool -> unit
    method stretch_set : bool
    method set_stretch_set : bool -> unit
    method strikethrough : bool
    method set_strikethrough : bool -> unit
    method strikethrough_rgba_set : bool
    method set_strikethrough_rgba_set : bool -> unit
    method strikethrough_set : bool
    method set_strikethrough_set : bool -> unit
    method style_set : bool
    method set_style_set : bool -> unit
    method tabs_set : bool
    method set_tabs_set : bool -> unit
    method text_transform_set : bool
    method set_text_transform_set : bool -> unit
    method underline_rgba_set : bool
    method set_underline_rgba_set : bool -> unit
    method underline_set : bool
    method set_underline_set : bool -> unit
    method variant_set : bool
    method set_variant_set : bool -> unit
    method weight : int
    method set_weight : int -> unit
    method weight_set : bool
    method set_weight_set : bool -> unit
    method word : bool
    method set_word : bool -> unit
    method word_set : bool
    method set_word_set : bool -> unit
    method wrap_mode : Gtk_enums.wrapmode
    method set_wrap_mode : Gtk_enums.wrapmode -> unit
    method wrap_mode_set : bool
    method set_wrap_mode_set : bool -> unit
    method as_text_tag : Text_tag.t
  end

