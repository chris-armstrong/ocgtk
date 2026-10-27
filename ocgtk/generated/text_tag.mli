(** Can be applied to text contained in a [GtkTextBuffer].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together.

    Tags should be in the [Gtk.TextTagTable] for a given [GtkTextBuffer] before
    using them with that buffer.

    [Gtk.TextBuffer.create_tag] is the best way to create tags. See “gtk4-demo”
    for numerous examples.

    For each property of [GtkTextTag], there is a “set” property, e.g.
    “font-set” corresponds to “font”. These “set” properties reflect whether a
    property has been set or not.

    They are maintained by GTK and you should not set them independently.

    Its methods, signals and properties are on {!class-type-text_tag_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Text_tag}. *)

(** The methods, signals and properties of a [TextTag]. *)
class type text_tag_t = object
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

  method as_text_tag : Raw.Text_tag.t
end

class text_tag : Raw.Text_tag.t -> text_tag_t
(** Wraps a raw handle of {!Ocgtk.Raw.Text_tag.t}. *)

(** {2:constructors Constructors} *)

val new_ : string option -> text_tag_t
(** Creates a [GtkTextTag]. *)
