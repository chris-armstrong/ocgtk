class type text_tag_t = object
  (** {2:methods Methods} *)

  method changed : bool -> unit
  (** Emits the [Gtk.TextTagTable::tag-changed] signal on the [GtkTextTagTable]
      where the tag is included.

      The signal is already emitted when setting a [GtkTextTag] property. This
      function is useful for a [GtkTextTag] subclass. *)

  method get_priority : unit -> int
  (** Get the tag priority. *)

  method set_priority : int -> unit
  (** Sets the priority of a [GtkTextTag].

      Valid priorities start at 0 and go to one less than
      [Gtk.TextTagTable.get_size]. Each tag in a table has a unique priority;
      setting the priority of one tag shifts the priorities of all the other
      tags in the table to maintain a unique priority for each tag.

      Higher priority tags “win” if two tags both set the same text attribute.
      When adding a tag to a tag table, it will be assigned the highest priority
      in the table by default; so normally the precedence of a set of tags is
      the order in which they were added to the table, or created with
      [Gtk.TextBuffer.create_tag], which adds the tag to the buffer’s table
      automatically. *)

  (** {2:properties Properties} *)

  method accumulative_margin : bool
  (** Whether the margins accumulate or override each other.

      When set to [TRUE] the margins of this tag are added to the margins of any
      other non-accumulative margins present. When set to [FALSE] the margins
      override one another (the default). *)

  method set_accumulative_margin : bool -> unit
  (** Whether the margins accumulate or override each other.

      When set to [TRUE] the margins of this tag are added to the margins of any
      other non-accumulative margins present. When set to [FALSE] the margins
      override one another (the default). *)

  method allow_breaks : bool
  (** Whether breaks are allowed. *)

  method set_allow_breaks : bool -> unit
  (** Whether breaks are allowed. *)

  method allow_breaks_set : bool
  (** Whether the [allow-breaks] property is set. *)

  method set_allow_breaks_set : bool -> unit
  (** Whether the [allow-breaks] property is set. *)

  method set_background : string -> unit
  (** Background color as a string. *)

  method background_full_height : bool
  (** Whether the background color fills the entire line height or only the
      height of the tagged characters. *)

  method set_background_full_height : bool -> unit
  (** Whether the background color fills the entire line height or only the
      height of the tagged characters. *)

  method background_full_height_set : bool
  (** Whether the [background-full-height] property is set. *)

  method set_background_full_height_set : bool -> unit
  (** Whether the [background-full-height] property is set. *)

  method background_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** Background color as a [GdkRGBA]. *)

  method set_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Background color as a [GdkRGBA]. *)

  method background_set : bool
  (** Whether the [background] property is set. *)

  method set_background_set : bool -> unit
  (** Whether the [background] property is set. *)

  method direction : Enums.textdirection
  (** Text direction, e.g. right-to-left or left-to-right. *)

  method set_direction : Enums.textdirection -> unit
  (** Text direction, e.g. right-to-left or left-to-right. *)

  method editable : bool
  (** Whether the text can be modified by the user. *)

  method set_editable : bool -> unit
  (** Whether the text can be modified by the user. *)

  method editable_set : bool
  (** Whether the [editable] property is set. *)

  method set_editable_set : bool -> unit
  (** Whether the [editable] property is set. *)

  method fallback : bool
  (** Whether font fallback is enabled.

      When set to [TRUE], other fonts will be substituted where the current font
      is missing glyphs. *)

  method set_fallback : bool -> unit
  (** Whether font fallback is enabled.

      When set to [TRUE], other fonts will be substituted where the current font
      is missing glyphs. *)

  method fallback_set : bool
  (** Whether the [fallback] property is set. *)

  method set_fallback_set : bool -> unit
  (** Whether the [fallback] property is set. *)

  method family : string
  (** Name of the font family, e.g. Sans, Helvetica, Times, Monospace. *)

  method set_family : string -> unit
  (** Name of the font family, e.g. Sans, Helvetica, Times, Monospace. *)

  method family_set : bool
  (** Whether the [family] property is set. *)

  method set_family_set : bool -> unit
  (** Whether the [family] property is set. *)

  method font : string
  [@@ocaml.doc
    "Font description as string, e.g. \\\"Sans Italic 12\\\".\n\n\
     Note that the initial value of this property depends on\n\
     the internals of [PangoFontDescription]."]

  method set_font : string -> unit
  [@@ocaml.doc
    "Font description as string, e.g. \\\"Sans Italic 12\\\".\n\n\
     Note that the initial value of this property depends on\n\
     the internals of [PangoFontDescription]."]

  method font_desc : Ocpango.Font_description.font_description_t
  (** Font description as a [PangoFontDescription]. *)

  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  (** Font description as a [PangoFontDescription]. *)

  method font_features : string
  (** OpenType font features, as a string. *)

  method set_font_features : string -> unit
  (** OpenType font features, as a string. *)

  method font_features_set : bool
  (** Whether the [font-features] property is set. *)

  method set_font_features_set : bool -> unit
  (** Whether the [font-features] property is set. *)

  method set_foreground : string -> unit
  (** Foreground color as a string. *)

  method foreground_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** Foreground color as a [GdkRGBA]. *)

  method set_foreground_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Foreground color as a [GdkRGBA]. *)

  method foreground_set : bool
  (** Whether the [foreground] property is set. *)

  method set_foreground_set : bool -> unit
  (** Whether the [foreground] property is set. *)

  method indent : int
  (** Amount to indent the paragraph, in pixels.

      A negative value of indent will produce a hanging indentation. That is,
      the first line will have the full width, and subsequent lines will be
      indented by the absolute value of indent. *)

  method set_indent : int -> unit
  (** Amount to indent the paragraph, in pixels.

      A negative value of indent will produce a hanging indentation. That is,
      the first line will have the full width, and subsequent lines will be
      indented by the absolute value of indent. *)

  method indent_set : bool
  (** Whether the [indent] property is set. *)

  method set_indent_set : bool -> unit
  (** Whether the [indent] property is set. *)

  method insert_hyphens : bool
  (** Whether to insert hyphens at breaks. *)

  method set_insert_hyphens : bool -> unit
  (** Whether to insert hyphens at breaks. *)

  method insert_hyphens_set : bool
  (** Whether the [insert-hyphens] property is set. *)

  method set_insert_hyphens_set : bool -> unit
  (** Whether the [insert-hyphens] property is set. *)

  method invisible : bool
  (** Whether this text is hidden.

      Note that there may still be problems with the support for invisible text,
      in particular when navigating programmatically inside a buffer containing
      invisible segments. *)

  method set_invisible : bool -> unit
  (** Whether this text is hidden.

      Note that there may still be problems with the support for invisible text,
      in particular when navigating programmatically inside a buffer containing
      invisible segments. *)

  method invisible_set : bool
  (** Whether the [invisible] property is set. *)

  method set_invisible_set : bool -> unit
  (** Whether the [invisible] property is set. *)

  method justification : Enums.justification
  (** Left, right, or center justification. *)

  method set_justification : Enums.justification -> unit
  (** Left, right, or center justification. *)

  method justification_set : bool
  (** Whether the [justification] property is set. *)

  method set_justification_set : bool -> unit
  (** Whether the [justification] property is set. *)

  method language : string
  (** The language this text is in, as an ISO code.

      Pango can use this as a hint when rendering the text. If not set, an
      appropriate default will be used.

      Note that the initial value of this property depends on the current
      locale, see also [Gtk.get_default_language]. *)

  method set_language : string -> unit
  (** The language this text is in, as an ISO code.

      Pango can use this as a hint when rendering the text. If not set, an
      appropriate default will be used.

      Note that the initial value of this property depends on the current
      locale, see also [Gtk.get_default_language]. *)

  method language_set : bool
  (** Whether the [language] property is set. *)

  method set_language_set : bool -> unit
  (** Whether the [language] property is set. *)

  method left_margin : int
  (** Width of the left margin in pixels. *)

  method set_left_margin : int -> unit
  (** Width of the left margin in pixels. *)

  method left_margin_set : bool
  (** Whether the [left-margin] property is set. *)

  method set_left_margin_set : bool -> unit
  (** Whether the [left-margin] property is set. *)

  method letter_spacing : int
  (** Extra spacing between graphemes, in Pango units. *)

  method set_letter_spacing : int -> unit
  (** Extra spacing between graphemes, in Pango units. *)

  method letter_spacing_set : bool
  (** Whether the [letter-spacing] property is set. *)

  method set_letter_spacing_set : bool -> unit
  (** Whether the [letter-spacing] property is set. *)

  method line_height : float
  (** Factor to scale line height by. *)

  method set_line_height : float -> unit
  (** Factor to scale line height by. *)

  method line_height_set : bool
  (** Whether the [line-height] property is set. *)

  method set_line_height_set : bool -> unit
  (** Whether the [line-height] property is set. *)

  method name : string
  (** The name used to refer to the tag.

      [NULL] for anonymous tags. *)

  method overline : Ocpango.Enums.overline
  (** Style of overline for this text. *)

  method set_overline : Ocpango.Enums.overline -> unit
  (** Style of overline for this text. *)

  method overline_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** This property modifies the color of overlines.

      If not set, overlines will use the foreground color. *)

  method set_overline_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** This property modifies the color of overlines.

      If not set, overlines will use the foreground color. *)

  method overline_rgba_set : bool
  (** Whether the [overline-rgba] property is set. *)

  method set_overline_rgba_set : bool -> unit
  (** Whether the [overline-rgba] property is set. *)

  method overline_set : bool
  (** Whether the [overline] property is set. *)

  method set_overline_set : bool -> unit
  (** Whether the [overline] property is set. *)

  method set_paragraph_background : string -> unit
  (** The paragraph background color as a string. *)

  method paragraph_background_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** The paragraph background color as a [GdkRGBA]. *)

  method set_paragraph_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** The paragraph background color as a [GdkRGBA]. *)

  method paragraph_background_set : bool
  (** Whether the [paragraph-background] property is set. *)

  method set_paragraph_background_set : bool -> unit
  (** Whether the [paragraph-background] property is set. *)

  method pixels_above_lines : int
  (** Pixels of blank space above paragraphs. *)

  method set_pixels_above_lines : int -> unit
  (** Pixels of blank space above paragraphs. *)

  method pixels_above_lines_set : bool
  (** Whether the [pixels-above-lines] property is set. *)

  method set_pixels_above_lines_set : bool -> unit
  (** Whether the [pixels-above-lines] property is set. *)

  method pixels_below_lines : int
  (** Pixels of blank space below paragraphs. *)

  method set_pixels_below_lines : int -> unit
  (** Pixels of blank space below paragraphs. *)

  method pixels_below_lines_set : bool
  (** Whether the [pixels-below-lines] property is set. *)

  method set_pixels_below_lines_set : bool -> unit
  (** Whether the [pixels-below-lines] property is set. *)

  method pixels_inside_wrap : int
  (** Pixels of blank space between wrapped lines in a paragraph. *)

  method set_pixels_inside_wrap : int -> unit
  (** Pixels of blank space between wrapped lines in a paragraph. *)

  method pixels_inside_wrap_set : bool
  (** Whether the [pixels-inside-wrap] property is set. *)

  method set_pixels_inside_wrap_set : bool -> unit
  (** Whether the [pixels-inside-wrap] property is set. *)

  method right_margin : int
  (** Width of the right margin, in pixels. *)

  method set_right_margin : int -> unit
  (** Width of the right margin, in pixels. *)

  method right_margin_set : bool
  (** Whether the [right-margin] property is set. *)

  method set_right_margin_set : bool -> unit
  (** Whether the [right-margin] property is set. *)

  method rise : int
  (** Offset of text above the baseline, in Pango units.

      Negative values go below the baseline. *)

  method set_rise : int -> unit
  (** Offset of text above the baseline, in Pango units.

      Negative values go below the baseline. *)

  method rise_set : bool
  (** Whether the [rise] property is set. *)

  method set_rise_set : bool -> unit
  (** Whether the [rise] property is set. *)

  method scale : float
  (** Font size as a scale factor relative to the default font size.

      This properly adapts to theme changes, etc. so is recommended. Pango
      predefines some scales such as [PANGO_SCALE_X_LARGE]. *)

  method set_scale : float -> unit
  (** Font size as a scale factor relative to the default font size.

      This properly adapts to theme changes, etc. so is recommended. Pango
      predefines some scales such as [PANGO_SCALE_X_LARGE]. *)

  method scale_set : bool
  (** Whether the [scale] property is set. *)

  method set_scale_set : bool -> unit
  (** Whether the [scale] property is set. *)

  method sentence : bool
  (** Whether this tag represents a single sentence.

      This affects cursor movement. *)

  method set_sentence : bool -> unit
  (** Whether this tag represents a single sentence.

      This affects cursor movement. *)

  method sentence_set : bool
  (** Whether the [sentence] property is set. *)

  method set_sentence_set : bool -> unit
  (** Whether the [sentence] property is set. *)

  method show_spaces : Ocpango.Enums.showflags
  (** How to render invisible characters. *)

  method set_show_spaces : Ocpango.Enums.showflags -> unit
  (** How to render invisible characters. *)

  method show_spaces_set : bool
  (** Whether the [show-spaces] property is set. *)

  method set_show_spaces_set : bool -> unit
  (** Whether the [show-spaces] property is set. *)

  method size : int
  (** Font size in Pango units. *)

  method set_size : int -> unit
  (** Font size in Pango units. *)

  method size_points : float
  (** Font size in points. *)

  method set_size_points : float -> unit
  (** Font size in points. *)

  method size_set : bool
  (** Whether the [size] property is set. *)

  method set_size_set : bool -> unit
  (** Whether the [size] property is set. *)

  method stretch : Ocpango.Enums.stretch
  (** Font stretch as a [PangoStretch], e.g. [PANGO_STRETCH_CONDENSED]. *)

  method set_stretch : Ocpango.Enums.stretch -> unit
  (** Font stretch as a [PangoStretch], e.g. [PANGO_STRETCH_CONDENSED]. *)

  method stretch_set : bool
  (** Whether the [stretch] property is set. *)

  method set_stretch_set : bool -> unit
  (** Whether the [stretch] property is set. *)

  method strikethrough : bool
  (** Whether to strike through the text. *)

  method set_strikethrough : bool -> unit
  (** Whether to strike through the text. *)

  method strikethrough_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** This property modifies the color of strikeouts.

      If not set, strikeouts will use the foreground color. *)

  method set_strikethrough_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** This property modifies the color of strikeouts.

      If not set, strikeouts will use the foreground color. *)

  method strikethrough_rgba_set : bool
  (** If the [strikethrough-rgba] property has been set. *)

  method set_strikethrough_rgba_set : bool -> unit
  (** If the [strikethrough-rgba] property has been set. *)

  method strikethrough_set : bool
  (** Whether the [strikethrough] property is set. *)

  method set_strikethrough_set : bool -> unit
  (** Whether the [strikethrough] property is set. *)

  method style : Ocpango.Enums.style
  (** Font style as a [PangoStyle], e.g. [PANGO_STYLE_ITALIC]. *)

  method set_style : Ocpango.Enums.style -> unit
  (** Font style as a [PangoStyle], e.g. [PANGO_STYLE_ITALIC]. *)

  method style_set : bool
  (** Whether the [style] property is set. *)

  method set_style_set : bool -> unit
  (** Whether the [style] property is set. *)

  method tabs : Ocpango.Tab_array.tab_array_t
  (** Custom tabs for this text. *)

  method set_tabs : Ocpango.Tab_array.tab_array_t -> unit
  (** Custom tabs for this text. *)

  method tabs_set : bool
  (** Whether the [tabs] property is set. *)

  method set_tabs_set : bool -> unit
  (** Whether the [tabs] property is set. *)

  method text_transform : Ocpango.Enums.texttransform
  (** How to transform the text for display. *)

  method set_text_transform : Ocpango.Enums.texttransform -> unit
  (** How to transform the text for display. *)

  method text_transform_set : bool
  (** Whether the [text-transform] property is set. *)

  method set_text_transform_set : bool -> unit
  (** Whether the [text-transform] property is set. *)

  method underline : Ocpango.Enums.underline
  (** Style of underline for this text. *)

  method set_underline : Ocpango.Enums.underline -> unit
  (** Style of underline for this text. *)

  method underline_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** This property modifies the color of underlines.

      If not set, underlines will use the foreground color.

      If [Gtk.TextTag:underline] is set to [PANGO_UNDERLINE_ERROR], an alternate
      color may be applied instead of the foreground. Setting this property will
      always override those defaults. *)

  method set_underline_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** This property modifies the color of underlines.

      If not set, underlines will use the foreground color.

      If [Gtk.TextTag:underline] is set to [PANGO_UNDERLINE_ERROR], an alternate
      color may be applied instead of the foreground. Setting this property will
      always override those defaults. *)

  method underline_rgba_set : bool
  (** If the [underline-rgba] property has been set. *)

  method set_underline_rgba_set : bool -> unit
  (** If the [underline-rgba] property has been set. *)

  method underline_set : bool
  (** Whether the [underline] property is set. *)

  method set_underline_set : bool -> unit
  (** Whether the [underline] property is set. *)

  method variant : Ocpango.Enums.variant
  (** Font variant as a [PangoVariant], e.g. [PANGO_VARIANT_SMALL_CAPS]. *)

  method set_variant : Ocpango.Enums.variant -> unit
  (** Font variant as a [PangoVariant], e.g. [PANGO_VARIANT_SMALL_CAPS]. *)

  method variant_set : bool
  (** Whether the [variant] property is set. *)

  method set_variant_set : bool -> unit
  (** Whether the [variant] property is set. *)

  method weight : int
  (** Font weight as an integer. *)

  method set_weight : int -> unit
  (** Font weight as an integer. *)

  method weight_set : bool
  (** Whether the [weight] property is set. *)

  method set_weight_set : bool -> unit
  (** Whether the [weight] property is set. *)

  method word : bool
  (** Whether this tag represents a single word.

      This affects line breaks and cursor movement. *)

  method set_word : bool -> unit
  (** Whether this tag represents a single word.

      This affects line breaks and cursor movement. *)

  method word_set : bool
  (** Whether the [word] property is set. *)

  method set_word_set : bool -> unit
  (** Whether the [word] property is set. *)

  method wrap_mode : Enums.wrapmode
  (** Whether to wrap lines never, at word boundaries, or at character
      boundaries. *)

  method set_wrap_mode : Enums.wrapmode -> unit
  (** Whether to wrap lines never, at word boundaries, or at character
      boundaries. *)

  method wrap_mode_set : bool
  (** Whether the [wrap-mode] property is set. *)

  method set_wrap_mode_set : bool -> unit
  (** Whether the [wrap-mode] property is set. *)

  (** {2:conversions Conversions} *)

  method as_text_tag : Raw.Text_tag.t
end

(* High-level class for TextTag *)
class text_tag (obj : Raw.Text_tag.t) : text_tag_t =
  object (self)
    method changed : bool -> unit =
      fun size_changed -> Raw.Text_tag.changed obj size_changed

    method get_priority : unit -> int = fun () -> Raw.Text_tag.get_priority obj

    method set_priority : int -> unit =
      fun priority -> Raw.Text_tag.set_priority obj priority

    method accumulative_margin = Raw.Text_tag.get_accumulative_margin obj

    method set_accumulative_margin v =
      Raw.Text_tag.set_accumulative_margin obj v

    method allow_breaks = Raw.Text_tag.get_allow_breaks obj
    method set_allow_breaks v = Raw.Text_tag.set_allow_breaks obj v
    method allow_breaks_set = Raw.Text_tag.get_allow_breaks_set obj
    method set_allow_breaks_set v = Raw.Text_tag.set_allow_breaks_set obj v
    method set_background v = Raw.Text_tag.set_background obj v
    method background_full_height = Raw.Text_tag.get_background_full_height obj

    method set_background_full_height v =
      Raw.Text_tag.set_background_full_height obj v

    method background_full_height_set =
      Raw.Text_tag.get_background_full_height_set obj

    method set_background_full_height_set v =
      Raw.Text_tag.set_background_full_height_set obj v

    method background_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Text_tag.get_background_rgba obj)

    method set_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Text_tag.set_background_rgba obj v#as_rgb_a

    method background_set = Raw.Text_tag.get_background_set obj
    method set_background_set v = Raw.Text_tag.set_background_set obj v
    method direction = Raw.Text_tag.get_direction obj
    method set_direction v = Raw.Text_tag.set_direction obj v
    method editable = Raw.Text_tag.get_editable obj
    method set_editable v = Raw.Text_tag.set_editable obj v
    method editable_set = Raw.Text_tag.get_editable_set obj
    method set_editable_set v = Raw.Text_tag.set_editable_set obj v
    method fallback = Raw.Text_tag.get_fallback obj
    method set_fallback v = Raw.Text_tag.set_fallback obj v
    method fallback_set = Raw.Text_tag.get_fallback_set obj
    method set_fallback_set v = Raw.Text_tag.set_fallback_set obj v
    method family = Raw.Text_tag.get_family obj
    method set_family v = Raw.Text_tag.set_family obj v
    method family_set = Raw.Text_tag.get_family_set obj
    method set_family_set v = Raw.Text_tag.set_family_set obj v
    method font = Raw.Text_tag.get_font obj
    method set_font v = Raw.Text_tag.set_font obj v

    method font_desc =
      new Ocpango.Font_description.font_description
        (Raw.Text_tag.get_font_desc obj)

    method set_font_desc : Ocpango.Font_description.font_description_t -> unit =
      fun v -> Raw.Text_tag.set_font_desc obj v#as_font_description

    method font_features = Raw.Text_tag.get_font_features obj
    method set_font_features v = Raw.Text_tag.set_font_features obj v
    method font_features_set = Raw.Text_tag.get_font_features_set obj
    method set_font_features_set v = Raw.Text_tag.set_font_features_set obj v
    method set_foreground v = Raw.Text_tag.set_foreground obj v

    method foreground_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Text_tag.get_foreground_rgba obj)

    method set_foreground_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Text_tag.set_foreground_rgba obj v#as_rgb_a

    method foreground_set = Raw.Text_tag.get_foreground_set obj
    method set_foreground_set v = Raw.Text_tag.set_foreground_set obj v
    method indent = Raw.Text_tag.get_indent obj
    method set_indent v = Raw.Text_tag.set_indent obj v
    method indent_set = Raw.Text_tag.get_indent_set obj
    method set_indent_set v = Raw.Text_tag.set_indent_set obj v
    method insert_hyphens = Raw.Text_tag.get_insert_hyphens obj
    method set_insert_hyphens v = Raw.Text_tag.set_insert_hyphens obj v
    method insert_hyphens_set = Raw.Text_tag.get_insert_hyphens_set obj
    method set_insert_hyphens_set v = Raw.Text_tag.set_insert_hyphens_set obj v
    method invisible = Raw.Text_tag.get_invisible obj
    method set_invisible v = Raw.Text_tag.set_invisible obj v
    method invisible_set = Raw.Text_tag.get_invisible_set obj
    method set_invisible_set v = Raw.Text_tag.set_invisible_set obj v
    method justification = Raw.Text_tag.get_justification obj
    method set_justification v = Raw.Text_tag.set_justification obj v
    method justification_set = Raw.Text_tag.get_justification_set obj
    method set_justification_set v = Raw.Text_tag.set_justification_set obj v
    method language = Raw.Text_tag.get_language obj
    method set_language v = Raw.Text_tag.set_language obj v
    method language_set = Raw.Text_tag.get_language_set obj
    method set_language_set v = Raw.Text_tag.set_language_set obj v
    method left_margin = Raw.Text_tag.get_left_margin obj
    method set_left_margin v = Raw.Text_tag.set_left_margin obj v
    method left_margin_set = Raw.Text_tag.get_left_margin_set obj
    method set_left_margin_set v = Raw.Text_tag.set_left_margin_set obj v
    method letter_spacing = Raw.Text_tag.get_letter_spacing obj
    method set_letter_spacing v = Raw.Text_tag.set_letter_spacing obj v
    method letter_spacing_set = Raw.Text_tag.get_letter_spacing_set obj
    method set_letter_spacing_set v = Raw.Text_tag.set_letter_spacing_set obj v
    method line_height = Raw.Text_tag.get_line_height obj
    method set_line_height v = Raw.Text_tag.set_line_height obj v
    method line_height_set = Raw.Text_tag.get_line_height_set obj
    method set_line_height_set v = Raw.Text_tag.set_line_height_set obj v
    method name = Raw.Text_tag.get_name obj
    method overline = Raw.Text_tag.get_overline obj
    method set_overline v = Raw.Text_tag.set_overline obj v

    method overline_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Text_tag.get_overline_rgba obj)

    method set_overline_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Text_tag.set_overline_rgba obj v#as_rgb_a

    method overline_rgba_set = Raw.Text_tag.get_overline_rgba_set obj
    method set_overline_rgba_set v = Raw.Text_tag.set_overline_rgba_set obj v
    method overline_set = Raw.Text_tag.get_overline_set obj
    method set_overline_set v = Raw.Text_tag.set_overline_set obj v

    method set_paragraph_background v =
      Raw.Text_tag.set_paragraph_background obj v

    method paragraph_background_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Text_tag.get_paragraph_background_rgba obj)

    method set_paragraph_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Text_tag.set_paragraph_background_rgba obj v#as_rgb_a

    method paragraph_background_set =
      Raw.Text_tag.get_paragraph_background_set obj

    method set_paragraph_background_set v =
      Raw.Text_tag.set_paragraph_background_set obj v

    method pixels_above_lines = Raw.Text_tag.get_pixels_above_lines obj
    method set_pixels_above_lines v = Raw.Text_tag.set_pixels_above_lines obj v
    method pixels_above_lines_set = Raw.Text_tag.get_pixels_above_lines_set obj

    method set_pixels_above_lines_set v =
      Raw.Text_tag.set_pixels_above_lines_set obj v

    method pixels_below_lines = Raw.Text_tag.get_pixels_below_lines obj
    method set_pixels_below_lines v = Raw.Text_tag.set_pixels_below_lines obj v
    method pixels_below_lines_set = Raw.Text_tag.get_pixels_below_lines_set obj

    method set_pixels_below_lines_set v =
      Raw.Text_tag.set_pixels_below_lines_set obj v

    method pixels_inside_wrap = Raw.Text_tag.get_pixels_inside_wrap obj
    method set_pixels_inside_wrap v = Raw.Text_tag.set_pixels_inside_wrap obj v
    method pixels_inside_wrap_set = Raw.Text_tag.get_pixels_inside_wrap_set obj

    method set_pixels_inside_wrap_set v =
      Raw.Text_tag.set_pixels_inside_wrap_set obj v

    method right_margin = Raw.Text_tag.get_right_margin obj
    method set_right_margin v = Raw.Text_tag.set_right_margin obj v
    method right_margin_set = Raw.Text_tag.get_right_margin_set obj
    method set_right_margin_set v = Raw.Text_tag.set_right_margin_set obj v
    method rise = Raw.Text_tag.get_rise obj
    method set_rise v = Raw.Text_tag.set_rise obj v
    method rise_set = Raw.Text_tag.get_rise_set obj
    method set_rise_set v = Raw.Text_tag.set_rise_set obj v
    method scale = Raw.Text_tag.get_scale obj
    method set_scale v = Raw.Text_tag.set_scale obj v
    method scale_set = Raw.Text_tag.get_scale_set obj
    method set_scale_set v = Raw.Text_tag.set_scale_set obj v
    method sentence = Raw.Text_tag.get_sentence obj
    method set_sentence v = Raw.Text_tag.set_sentence obj v
    method sentence_set = Raw.Text_tag.get_sentence_set obj
    method set_sentence_set v = Raw.Text_tag.set_sentence_set obj v
    method show_spaces = Raw.Text_tag.get_show_spaces obj
    method set_show_spaces v = Raw.Text_tag.set_show_spaces obj v
    method show_spaces_set = Raw.Text_tag.get_show_spaces_set obj
    method set_show_spaces_set v = Raw.Text_tag.set_show_spaces_set obj v
    method size = Raw.Text_tag.get_size obj
    method set_size v = Raw.Text_tag.set_size obj v
    method size_points = Raw.Text_tag.get_size_points obj
    method set_size_points v = Raw.Text_tag.set_size_points obj v
    method size_set = Raw.Text_tag.get_size_set obj
    method set_size_set v = Raw.Text_tag.set_size_set obj v
    method stretch = Raw.Text_tag.get_stretch obj
    method set_stretch v = Raw.Text_tag.set_stretch obj v
    method stretch_set = Raw.Text_tag.get_stretch_set obj
    method set_stretch_set v = Raw.Text_tag.set_stretch_set obj v
    method strikethrough = Raw.Text_tag.get_strikethrough obj
    method set_strikethrough v = Raw.Text_tag.set_strikethrough obj v

    method strikethrough_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Text_tag.get_strikethrough_rgba obj)

    method set_strikethrough_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Text_tag.set_strikethrough_rgba obj v#as_rgb_a

    method strikethrough_rgba_set = Raw.Text_tag.get_strikethrough_rgba_set obj

    method set_strikethrough_rgba_set v =
      Raw.Text_tag.set_strikethrough_rgba_set obj v

    method strikethrough_set = Raw.Text_tag.get_strikethrough_set obj
    method set_strikethrough_set v = Raw.Text_tag.set_strikethrough_set obj v
    method style = Raw.Text_tag.get_style obj
    method set_style v = Raw.Text_tag.set_style obj v
    method style_set = Raw.Text_tag.get_style_set obj
    method set_style_set v = Raw.Text_tag.set_style_set obj v
    method tabs = new Ocpango.Tab_array.tab_array (Raw.Text_tag.get_tabs obj)

    method set_tabs : Ocpango.Tab_array.tab_array_t -> unit =
      fun v -> Raw.Text_tag.set_tabs obj v#as_tab_array

    method tabs_set = Raw.Text_tag.get_tabs_set obj
    method set_tabs_set v = Raw.Text_tag.set_tabs_set obj v
    method text_transform = Raw.Text_tag.get_text_transform obj
    method set_text_transform v = Raw.Text_tag.set_text_transform obj v
    method text_transform_set = Raw.Text_tag.get_text_transform_set obj
    method set_text_transform_set v = Raw.Text_tag.set_text_transform_set obj v
    method underline = Raw.Text_tag.get_underline obj
    method set_underline v = Raw.Text_tag.set_underline obj v

    method underline_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Text_tag.get_underline_rgba obj)

    method set_underline_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Text_tag.set_underline_rgba obj v#as_rgb_a

    method underline_rgba_set = Raw.Text_tag.get_underline_rgba_set obj
    method set_underline_rgba_set v = Raw.Text_tag.set_underline_rgba_set obj v
    method underline_set = Raw.Text_tag.get_underline_set obj
    method set_underline_set v = Raw.Text_tag.set_underline_set obj v
    method variant = Raw.Text_tag.get_variant obj
    method set_variant v = Raw.Text_tag.set_variant obj v
    method variant_set = Raw.Text_tag.get_variant_set obj
    method set_variant_set v = Raw.Text_tag.set_variant_set obj v
    method weight = Raw.Text_tag.get_weight obj
    method set_weight v = Raw.Text_tag.set_weight obj v
    method weight_set = Raw.Text_tag.get_weight_set obj
    method set_weight_set v = Raw.Text_tag.set_weight_set obj v
    method word = Raw.Text_tag.get_word obj
    method set_word v = Raw.Text_tag.set_word obj v
    method word_set = Raw.Text_tag.get_word_set obj
    method set_word_set v = Raw.Text_tag.set_word_set obj v
    method wrap_mode = Raw.Text_tag.get_wrap_mode obj
    method set_wrap_mode v = Raw.Text_tag.set_wrap_mode obj v
    method wrap_mode_set = Raw.Text_tag.get_wrap_mode_set obj
    method set_wrap_mode_set v = Raw.Text_tag.set_wrap_mode_set obj v
    method as_text_tag = obj
  end

let new_ (name : string option) : text_tag_t =
  let obj_ = Raw.Text_tag.new_ name in
  new text_tag obj_
