class type text_tag_t = object
  method changed : bool -> unit
  method get_priority : unit -> int
  method set_priority : int -> unit
  method accumulative_margin : bool
  method set_accumulative_margin : bool -> unit
  method allow_breaks : bool
  method set_allow_breaks : bool -> unit
  method allow_breaks_set : bool
  method set_allow_breaks_set : bool -> unit
  method set_background : string -> unit
  method background_full_height : bool
  method set_background_full_height : bool -> unit
  method background_full_height_set : bool
  method set_background_full_height_set : bool -> unit
  method background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
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
  method font_desc : Ocgtk_pango.Pango.Font_description.font_description_t

  method set_font_desc :
    Ocgtk_pango.Pango.Font_description.font_description_t -> unit

  method font_features : string
  method set_font_features : string -> unit
  method font_features_set : bool
  method set_font_features_set : bool -> unit
  method set_foreground : string -> unit
  method foreground_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_foreground_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
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
  method overline : Ocgtk_pango.Pango.overline
  method set_overline : Ocgtk_pango.Pango.overline -> unit
  method overline_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_overline_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method overline_rgba_set : bool
  method set_overline_rgba_set : bool -> unit
  method overline_set : bool
  method set_overline_set : bool -> unit
  method set_paragraph_background : string -> unit
  method paragraph_background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_paragraph_background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
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
  method show_spaces : Ocgtk_pango.Pango.showflags
  method set_show_spaces : Ocgtk_pango.Pango.showflags -> unit
  method show_spaces_set : bool
  method set_show_spaces_set : bool -> unit
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
  method strikethrough_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_strikethrough_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method strikethrough_rgba_set : bool
  method set_strikethrough_rgba_set : bool -> unit
  method strikethrough_set : bool
  method set_strikethrough_set : bool -> unit
  method style : Ocgtk_pango.Pango.style
  method set_style : Ocgtk_pango.Pango.style -> unit
  method style_set : bool
  method set_style_set : bool -> unit
  method tabs : Ocgtk_pango.Pango.Tab_array.tab_array_t
  method set_tabs : Ocgtk_pango.Pango.Tab_array.tab_array_t -> unit
  method tabs_set : bool
  method set_tabs_set : bool -> unit
  method text_transform : Ocgtk_pango.Pango.texttransform
  method set_text_transform : Ocgtk_pango.Pango.texttransform -> unit
  method text_transform_set : bool
  method set_text_transform_set : bool -> unit
  method underline : Ocgtk_pango.Pango.underline
  method set_underline : Ocgtk_pango.Pango.underline -> unit
  method underline_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_underline_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method underline_rgba_set : bool
  method set_underline_rgba_set : bool -> unit
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

(* High-level class for TextTag *)
class text_tag (obj : Text_tag.t) : text_tag_t =
  object (self)
    method changed : bool -> unit =
      fun size_changed -> Text_tag.changed obj size_changed

    method get_priority : unit -> int = fun () -> Text_tag.get_priority obj

    method set_priority : int -> unit =
      fun priority -> Text_tag.set_priority obj priority

    method accumulative_margin = Text_tag.get_accumulative_margin obj
    method set_accumulative_margin v = Text_tag.set_accumulative_margin obj v
    method allow_breaks = Text_tag.get_allow_breaks obj
    method set_allow_breaks v = Text_tag.set_allow_breaks obj v
    method allow_breaks_set = Text_tag.get_allow_breaks_set obj
    method set_allow_breaks_set v = Text_tag.set_allow_breaks_set obj v
    method set_background v = Text_tag.set_background obj v
    method background_full_height = Text_tag.get_background_full_height obj

    method set_background_full_height v =
      Text_tag.set_background_full_height obj v

    method background_full_height_set =
      Text_tag.get_background_full_height_set obj

    method set_background_full_height_set v =
      Text_tag.set_background_full_height_set obj v

    method background_rgba =
      new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Text_tag.get_background_rgba obj)

    method set_background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Text_tag.set_background_rgba obj v#as_rgb_a

    method background_set = Text_tag.get_background_set obj
    method set_background_set v = Text_tag.set_background_set obj v
    method direction = Text_tag.get_direction obj
    method set_direction v = Text_tag.set_direction obj v
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

    method font_desc =
      new Ocgtk_pango.Pango.Font_description.font_description
        (Text_tag.get_font_desc obj)

    method set_font_desc :
        Ocgtk_pango.Pango.Font_description.font_description_t -> unit =
      fun v -> Text_tag.set_font_desc obj v#as_font_description

    method font_features = Text_tag.get_font_features obj
    method set_font_features v = Text_tag.set_font_features obj v
    method font_features_set = Text_tag.get_font_features_set obj
    method set_font_features_set v = Text_tag.set_font_features_set obj v
    method set_foreground v = Text_tag.set_foreground obj v

    method foreground_rgba =
      new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Text_tag.get_foreground_rgba obj)

    method set_foreground_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Text_tag.set_foreground_rgba obj v#as_rgb_a

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
    method justification = Text_tag.get_justification obj
    method set_justification v = Text_tag.set_justification obj v
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
    method overline = Text_tag.get_overline obj
    method set_overline v = Text_tag.set_overline obj v

    method overline_rgba =
      new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Text_tag.get_overline_rgba obj)

    method set_overline_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Text_tag.set_overline_rgba obj v#as_rgb_a

    method overline_rgba_set = Text_tag.get_overline_rgba_set obj
    method set_overline_rgba_set v = Text_tag.set_overline_rgba_set obj v
    method overline_set = Text_tag.get_overline_set obj
    method set_overline_set v = Text_tag.set_overline_set obj v
    method set_paragraph_background v = Text_tag.set_paragraph_background obj v

    method paragraph_background_rgba =
      new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Text_tag.get_paragraph_background_rgba obj)

    method set_paragraph_background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Text_tag.set_paragraph_background_rgba obj v#as_rgb_a

    method paragraph_background_set = Text_tag.get_paragraph_background_set obj

    method set_paragraph_background_set v =
      Text_tag.set_paragraph_background_set obj v

    method pixels_above_lines = Text_tag.get_pixels_above_lines obj
    method set_pixels_above_lines v = Text_tag.set_pixels_above_lines obj v
    method pixels_above_lines_set = Text_tag.get_pixels_above_lines_set obj

    method set_pixels_above_lines_set v =
      Text_tag.set_pixels_above_lines_set obj v

    method pixels_below_lines = Text_tag.get_pixels_below_lines obj
    method set_pixels_below_lines v = Text_tag.set_pixels_below_lines obj v
    method pixels_below_lines_set = Text_tag.get_pixels_below_lines_set obj

    method set_pixels_below_lines_set v =
      Text_tag.set_pixels_below_lines_set obj v

    method pixels_inside_wrap = Text_tag.get_pixels_inside_wrap obj
    method set_pixels_inside_wrap v = Text_tag.set_pixels_inside_wrap obj v
    method pixels_inside_wrap_set = Text_tag.get_pixels_inside_wrap_set obj

    method set_pixels_inside_wrap_set v =
      Text_tag.set_pixels_inside_wrap_set obj v

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
    method show_spaces = Text_tag.get_show_spaces obj
    method set_show_spaces v = Text_tag.set_show_spaces obj v
    method show_spaces_set = Text_tag.get_show_spaces_set obj
    method set_show_spaces_set v = Text_tag.set_show_spaces_set obj v
    method size = Text_tag.get_size obj
    method set_size v = Text_tag.set_size obj v
    method size_points = Text_tag.get_size_points obj
    method set_size_points v = Text_tag.set_size_points obj v
    method size_set = Text_tag.get_size_set obj
    method set_size_set v = Text_tag.set_size_set obj v
    method stretch = Text_tag.get_stretch obj
    method set_stretch v = Text_tag.set_stretch obj v
    method stretch_set = Text_tag.get_stretch_set obj
    method set_stretch_set v = Text_tag.set_stretch_set obj v
    method strikethrough = Text_tag.get_strikethrough obj
    method set_strikethrough v = Text_tag.set_strikethrough obj v

    method strikethrough_rgba =
      new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Text_tag.get_strikethrough_rgba obj)

    method set_strikethrough_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Text_tag.set_strikethrough_rgba obj v#as_rgb_a

    method strikethrough_rgba_set = Text_tag.get_strikethrough_rgba_set obj

    method set_strikethrough_rgba_set v =
      Text_tag.set_strikethrough_rgba_set obj v

    method strikethrough_set = Text_tag.get_strikethrough_set obj
    method set_strikethrough_set v = Text_tag.set_strikethrough_set obj v
    method style = Text_tag.get_style obj
    method set_style v = Text_tag.set_style obj v
    method style_set = Text_tag.get_style_set obj
    method set_style_set v = Text_tag.set_style_set obj v

    method tabs =
      new Ocgtk_pango.Pango.Tab_array.tab_array (Text_tag.get_tabs obj)

    method set_tabs : Ocgtk_pango.Pango.Tab_array.tab_array_t -> unit =
      fun v -> Text_tag.set_tabs obj v#as_tab_array

    method tabs_set = Text_tag.get_tabs_set obj
    method set_tabs_set v = Text_tag.set_tabs_set obj v
    method text_transform = Text_tag.get_text_transform obj
    method set_text_transform v = Text_tag.set_text_transform obj v
    method text_transform_set = Text_tag.get_text_transform_set obj
    method set_text_transform_set v = Text_tag.set_text_transform_set obj v
    method underline = Text_tag.get_underline obj
    method set_underline v = Text_tag.set_underline obj v

    method underline_rgba =
      new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Text_tag.get_underline_rgba obj)

    method set_underline_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Text_tag.set_underline_rgba obj v#as_rgb_a

    method underline_rgba_set = Text_tag.get_underline_rgba_set obj
    method set_underline_rgba_set v = Text_tag.set_underline_rgba_set obj v
    method underline_set = Text_tag.get_underline_set obj
    method set_underline_set v = Text_tag.set_underline_set obj v
    method variant = Text_tag.get_variant obj
    method set_variant v = Text_tag.set_variant obj v
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
    method wrap_mode = Text_tag.get_wrap_mode obj
    method set_wrap_mode v = Text_tag.set_wrap_mode obj v
    method wrap_mode_set = Text_tag.get_wrap_mode_set obj
    method set_wrap_mode_set v = Text_tag.set_wrap_mode_set obj v
    method as_text_tag = obj
  end

let new_ (name : string option) : text_tag_t =
  let obj_ = Text_tag.new_ name in
  new text_tag obj_
