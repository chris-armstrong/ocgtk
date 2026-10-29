(* GENERATED CODE - DO NOT EDIT *)
(* TextTag: TextTag *)

(** Can be applied to text contained in a [GtkTextBuffer].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together.

    Tags should be in the {{!Ocgtk.Raw.Text_tag_table}[Gtk.TextTagTable]} for a
    given [GtkTextBuffer] before using them with that buffer.

    [Gtk.TextBuffer.create_tag] is the best way to create tags. See “gtk4-demo”
    for numerous examples.

    For each property of [GtkTextTag], there is a “set” property, e.g.
    “font-set” corresponds to “font”. These “set” properties reflect whether a
    property has been set or not.

    They are maintained by GTK and you should not set them independently.

    The class built on this module is in {!Ocgtk.Text_tag}. *)

type t = [ `text_tag | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_text_tag_get_type"

external new_ : string option -> t = "ml_gtk_text_tag_new"
(** Creates a [GtkTextTag]. *)

(* Methods *)

external set_priority : t -> int -> unit = "ml_gtk_text_tag_set_priority"
(** Sets the priority of a [GtkTextTag].

    Valid priorities start at 0 and go to one less than
    [Gtk.TextTagTable.get_size]. Each tag in a table has a unique priority;
    setting the priority of one tag shifts the priorities of all the other tags
    in the table to maintain a unique priority for each tag.

    Higher priority tags “win” if two tags both set the same text attribute.
    When adding a tag to a tag table, it will be assigned the highest priority
    in the table by default; so normally the precedence of a set of tags is the
    order in which they were added to the table, or created with
    [Gtk.TextBuffer.create_tag], which adds the tag to the buffer’s table
    automatically. *)

external get_priority : t -> int = "ml_gtk_text_tag_get_priority"
(** Get the tag priority. *)

external changed : t -> bool -> unit = "ml_gtk_text_tag_changed"
(** Emits the [Gtk.TextTagTable::tag-changed] signal on the [GtkTextTagTable]
    where the tag is included.

    The signal is already emitted when setting a [GtkTextTag] property. This
    function is useful for a [GtkTextTag] subclass. *)

(* Properties *)

external get_accumulative_margin : t -> bool
  = "ml_gtk_text_tag_get_accumulative_margin"
(** Whether the margins accumulate or override each other.

    When set to [true] the margins of this tag are added to the margins of any
    other non-accumulative margins present. When set to [false] the margins
    override one another (the default). *)

external set_accumulative_margin : t -> bool -> unit
  = "ml_gtk_text_tag_set_accumulative_margin"
(** Whether the margins accumulate or override each other.

    When set to [true] the margins of this tag are added to the margins of any
    other non-accumulative margins present. When set to [false] the margins
    override one another (the default). *)

external get_allow_breaks : t -> bool = "ml_gtk_text_tag_get_allow_breaks"
(** Whether breaks are allowed. *)

external set_allow_breaks : t -> bool -> unit
  = "ml_gtk_text_tag_set_allow_breaks"
(** Whether breaks are allowed. *)

external get_allow_breaks_set : t -> bool
  = "ml_gtk_text_tag_get_allow_breaks_set"
(** Whether the [allow-breaks] property is set. *)

external set_allow_breaks_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_allow_breaks_set"
(** Whether the [allow-breaks] property is set. *)

external set_background : t -> string -> unit = "ml_gtk_text_tag_set_background"
(** Background color as a string. *)

external get_background_full_height : t -> bool
  = "ml_gtk_text_tag_get_background_full_height"
(** Whether the background color fills the entire line height or only the height
    of the tagged characters. *)

external set_background_full_height : t -> bool -> unit
  = "ml_gtk_text_tag_set_background_full_height"
(** Whether the background color fills the entire line height or only the height
    of the tagged characters. *)

external get_background_full_height_set : t -> bool
  = "ml_gtk_text_tag_get_background_full_height_set"
(** Whether the [background-full-height] property is set. *)

external set_background_full_height_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_background_full_height_set"
(** Whether the [background-full-height] property is set. *)

external get_background_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_text_tag_get_background_rgba"
(** Background color as a [GdkRGBA]. *)

external set_background_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_text_tag_set_background_rgba"
(** Background color as a [GdkRGBA]. *)

external get_background_set : t -> bool = "ml_gtk_text_tag_get_background_set"
(** Whether the [background] property is set. *)

external set_background_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_background_set"
(** Whether the [background] property is set. *)

external get_direction : t -> Ocgtk_enums.textdirection
  = "ml_gtk_text_tag_get_direction"
(** Text direction, e.g. right-to-left or left-to-right. *)

external set_direction : t -> Ocgtk_enums.textdirection -> unit
  = "ml_gtk_text_tag_set_direction"
(** Text direction, e.g. right-to-left or left-to-right. *)

external get_editable : t -> bool = "ml_gtk_text_tag_get_editable"
(** Whether the text can be modified by the user. *)

external set_editable : t -> bool -> unit = "ml_gtk_text_tag_set_editable"
(** Whether the text can be modified by the user. *)

external get_editable_set : t -> bool = "ml_gtk_text_tag_get_editable_set"
(** Whether the [editable] property is set. *)

external set_editable_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_editable_set"
(** Whether the [editable] property is set. *)

external get_fallback : t -> bool = "ml_gtk_text_tag_get_fallback"
(** Whether font fallback is enabled.

    When set to [true], other fonts will be substituted where the current font
    is missing glyphs. *)

external set_fallback : t -> bool -> unit = "ml_gtk_text_tag_set_fallback"
(** Whether font fallback is enabled.

    When set to [true], other fonts will be substituted where the current font
    is missing glyphs. *)

external get_fallback_set : t -> bool = "ml_gtk_text_tag_get_fallback_set"
(** Whether the [fallback] property is set. *)

external set_fallback_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_fallback_set"
(** Whether the [fallback] property is set. *)

external get_family : t -> string = "ml_gtk_text_tag_get_family"
(** Name of the font family, e.g. Sans, Helvetica, Times, Monospace. *)

external set_family : t -> string -> unit = "ml_gtk_text_tag_set_family"
(** Name of the font family, e.g. Sans, Helvetica, Times, Monospace. *)

external get_family_set : t -> bool = "ml_gtk_text_tag_get_family_set"
(** Whether the [family] property is set. *)

external set_family_set : t -> bool -> unit = "ml_gtk_text_tag_set_family_set"
(** Whether the [family] property is set. *)

external get_font : t -> string = "ml_gtk_text_tag_get_font"
[@@ocaml.doc
  "Font description as string, e.g. \\\"Sans Italic 12\\\".\n\n\
   Note that the initial value of this property depends on\n\
   the internals of [PangoFontDescription]."]

external set_font : t -> string -> unit = "ml_gtk_text_tag_set_font"
[@@ocaml.doc
  "Font description as string, e.g. \\\"Sans Italic 12\\\".\n\n\
   Note that the initial value of this property depends on\n\
   the internals of [PangoFontDescription]."]

external get_font_desc : t -> Ocpango_raw.Font_description.t
  = "ml_gtk_text_tag_get_font_desc"
(** Font description as a [PangoFontDescription]. *)

external set_font_desc : t -> Ocpango_raw.Font_description.t -> unit
  = "ml_gtk_text_tag_set_font_desc"
(** Font description as a [PangoFontDescription]. *)

external get_font_features : t -> string = "ml_gtk_text_tag_get_font_features"
(** OpenType font features, as a string. *)

external set_font_features : t -> string -> unit
  = "ml_gtk_text_tag_set_font_features"
(** OpenType font features, as a string. *)

external get_font_features_set : t -> bool
  = "ml_gtk_text_tag_get_font_features_set"
(** Whether the [font-features] property is set. *)

external set_font_features_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_font_features_set"
(** Whether the [font-features] property is set. *)

external set_foreground : t -> string -> unit = "ml_gtk_text_tag_set_foreground"
(** Foreground color as a string. *)

external get_foreground_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_text_tag_get_foreground_rgba"
(** Foreground color as a [GdkRGBA]. *)

external set_foreground_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_text_tag_set_foreground_rgba"
(** Foreground color as a [GdkRGBA]. *)

external get_foreground_set : t -> bool = "ml_gtk_text_tag_get_foreground_set"
(** Whether the [foreground] property is set. *)

external set_foreground_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_foreground_set"
(** Whether the [foreground] property is set. *)

external get_indent : t -> int = "ml_gtk_text_tag_get_indent"
(** Amount to indent the paragraph, in pixels.

    A negative value of indent will produce a hanging indentation. That is, the
    first line will have the full width, and subsequent lines will be indented
    by the absolute value of indent. *)

external set_indent : t -> int -> unit = "ml_gtk_text_tag_set_indent"
(** Amount to indent the paragraph, in pixels.

    A negative value of indent will produce a hanging indentation. That is, the
    first line will have the full width, and subsequent lines will be indented
    by the absolute value of indent. *)

external get_indent_set : t -> bool = "ml_gtk_text_tag_get_indent_set"
(** Whether the [indent] property is set. *)

external set_indent_set : t -> bool -> unit = "ml_gtk_text_tag_set_indent_set"
(** Whether the [indent] property is set. *)

external get_insert_hyphens : t -> bool = "ml_gtk_text_tag_get_insert_hyphens"
(** Whether to insert hyphens at breaks. *)

external set_insert_hyphens : t -> bool -> unit
  = "ml_gtk_text_tag_set_insert_hyphens"
(** Whether to insert hyphens at breaks. *)

external get_insert_hyphens_set : t -> bool
  = "ml_gtk_text_tag_get_insert_hyphens_set"
(** Whether the [insert-hyphens] property is set. *)

external set_insert_hyphens_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_insert_hyphens_set"
(** Whether the [insert-hyphens] property is set. *)

external get_invisible : t -> bool = "ml_gtk_text_tag_get_invisible"
(** Whether this text is hidden.

    Note that there may still be problems with the support for invisible text,
    in particular when navigating programmatically inside a buffer containing
    invisible segments. *)

external set_invisible : t -> bool -> unit = "ml_gtk_text_tag_set_invisible"
(** Whether this text is hidden.

    Note that there may still be problems with the support for invisible text,
    in particular when navigating programmatically inside a buffer containing
    invisible segments. *)

external get_invisible_set : t -> bool = "ml_gtk_text_tag_get_invisible_set"
(** Whether the [invisible] property is set. *)

external set_invisible_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_invisible_set"
(** Whether the [invisible] property is set. *)

external get_justification : t -> Ocgtk_enums.justification
  = "ml_gtk_text_tag_get_justification"
(** Left, right, or center justification. *)

external set_justification : t -> Ocgtk_enums.justification -> unit
  = "ml_gtk_text_tag_set_justification"
(** Left, right, or center justification. *)

external get_justification_set : t -> bool
  = "ml_gtk_text_tag_get_justification_set"
(** Whether the [justification] property is set. *)

external set_justification_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_justification_set"
(** Whether the [justification] property is set. *)

external get_language : t -> string = "ml_gtk_text_tag_get_language"
(** The language this text is in, as an ISO code.

    Pango can use this as a hint when rendering the text. If not set, an
    appropriate default will be used.

    Note that the initial value of this property depends on the current locale,
    see also [Gtk.get_default_language]. *)

external set_language : t -> string -> unit = "ml_gtk_text_tag_set_language"
(** The language this text is in, as an ISO code.

    Pango can use this as a hint when rendering the text. If not set, an
    appropriate default will be used.

    Note that the initial value of this property depends on the current locale,
    see also [Gtk.get_default_language]. *)

external get_language_set : t -> bool = "ml_gtk_text_tag_get_language_set"
(** Whether the [language] property is set. *)

external set_language_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_language_set"
(** Whether the [language] property is set. *)

external get_left_margin : t -> int = "ml_gtk_text_tag_get_left_margin"
(** Width of the left margin in pixels. *)

external set_left_margin : t -> int -> unit = "ml_gtk_text_tag_set_left_margin"
(** Width of the left margin in pixels. *)

external get_left_margin_set : t -> bool = "ml_gtk_text_tag_get_left_margin_set"
(** Whether the [left-margin] property is set. *)

external set_left_margin_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_left_margin_set"
(** Whether the [left-margin] property is set. *)

external get_letter_spacing : t -> int = "ml_gtk_text_tag_get_letter_spacing"
(** Extra spacing between graphemes, in Pango units. *)

external set_letter_spacing : t -> int -> unit
  = "ml_gtk_text_tag_set_letter_spacing"
(** Extra spacing between graphemes, in Pango units. *)

external get_letter_spacing_set : t -> bool
  = "ml_gtk_text_tag_get_letter_spacing_set"
(** Whether the [letter-spacing] property is set. *)

external set_letter_spacing_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_letter_spacing_set"
(** Whether the [letter-spacing] property is set. *)

external get_line_height : t -> float = "ml_gtk_text_tag_get_line_height"
(** Factor to scale line height by. *)

external set_line_height : t -> float -> unit
  = "ml_gtk_text_tag_set_line_height"
(** Factor to scale line height by. *)

external get_line_height_set : t -> bool = "ml_gtk_text_tag_get_line_height_set"
(** Whether the [line-height] property is set. *)

external set_line_height_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_line_height_set"
(** Whether the [line-height] property is set. *)

external get_name : t -> string = "ml_gtk_text_tag_get_name"
(** The name used to refer to the tag.

    [None] for anonymous tags. *)

external get_overline : t -> Ocpango_enums.overline
  = "ml_gtk_text_tag_get_overline"
(** Style of overline for this text. *)

external set_overline : t -> Ocpango_enums.overline -> unit
  = "ml_gtk_text_tag_set_overline"
(** Style of overline for this text. *)

external get_overline_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_text_tag_get_overline_rgba"
(** This property modifies the color of overlines.

    If not set, overlines will use the foreground color. *)

external set_overline_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_text_tag_set_overline_rgba"
(** This property modifies the color of overlines.

    If not set, overlines will use the foreground color. *)

external get_overline_rgba_set : t -> bool
  = "ml_gtk_text_tag_get_overline_rgba_set"
(** Whether the [overline-rgba] property is set. *)

external set_overline_rgba_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_overline_rgba_set"
(** Whether the [overline-rgba] property is set. *)

external get_overline_set : t -> bool = "ml_gtk_text_tag_get_overline_set"
(** Whether the [overline] property is set. *)

external set_overline_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_overline_set"
(** Whether the [overline] property is set. *)

external set_paragraph_background : t -> string -> unit
  = "ml_gtk_text_tag_set_paragraph_background"
(** The paragraph background color as a string. *)

external get_paragraph_background_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_text_tag_get_paragraph_background_rgba"
(** The paragraph background color as a [GdkRGBA]. *)

external set_paragraph_background_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_text_tag_set_paragraph_background_rgba"
(** The paragraph background color as a [GdkRGBA]. *)

external get_paragraph_background_set : t -> bool
  = "ml_gtk_text_tag_get_paragraph_background_set"
(** Whether the [paragraph-background] property is set. *)

external set_paragraph_background_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_paragraph_background_set"
(** Whether the [paragraph-background] property is set. *)

external get_pixels_above_lines : t -> int
  = "ml_gtk_text_tag_get_pixels_above_lines"
(** Pixels of blank space above paragraphs. *)

external set_pixels_above_lines : t -> int -> unit
  = "ml_gtk_text_tag_set_pixels_above_lines"
(** Pixels of blank space above paragraphs. *)

external get_pixels_above_lines_set : t -> bool
  = "ml_gtk_text_tag_get_pixels_above_lines_set"
(** Whether the [pixels-above-lines] property is set. *)

external set_pixels_above_lines_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_pixels_above_lines_set"
(** Whether the [pixels-above-lines] property is set. *)

external get_pixels_below_lines : t -> int
  = "ml_gtk_text_tag_get_pixels_below_lines"
(** Pixels of blank space below paragraphs. *)

external set_pixels_below_lines : t -> int -> unit
  = "ml_gtk_text_tag_set_pixels_below_lines"
(** Pixels of blank space below paragraphs. *)

external get_pixels_below_lines_set : t -> bool
  = "ml_gtk_text_tag_get_pixels_below_lines_set"
(** Whether the [pixels-below-lines] property is set. *)

external set_pixels_below_lines_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_pixels_below_lines_set"
(** Whether the [pixels-below-lines] property is set. *)

external get_pixels_inside_wrap : t -> int
  = "ml_gtk_text_tag_get_pixels_inside_wrap"
(** Pixels of blank space between wrapped lines in a paragraph. *)

external set_pixels_inside_wrap : t -> int -> unit
  = "ml_gtk_text_tag_set_pixels_inside_wrap"
(** Pixels of blank space between wrapped lines in a paragraph. *)

external get_pixels_inside_wrap_set : t -> bool
  = "ml_gtk_text_tag_get_pixels_inside_wrap_set"
(** Whether the [pixels-inside-wrap] property is set. *)

external set_pixels_inside_wrap_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_pixels_inside_wrap_set"
(** Whether the [pixels-inside-wrap] property is set. *)

external get_right_margin : t -> int = "ml_gtk_text_tag_get_right_margin"
(** Width of the right margin, in pixels. *)

external set_right_margin : t -> int -> unit
  = "ml_gtk_text_tag_set_right_margin"
(** Width of the right margin, in pixels. *)

external get_right_margin_set : t -> bool
  = "ml_gtk_text_tag_get_right_margin_set"
(** Whether the [right-margin] property is set. *)

external set_right_margin_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_right_margin_set"
(** Whether the [right-margin] property is set. *)

external get_rise : t -> int = "ml_gtk_text_tag_get_rise"
(** Offset of text above the baseline, in Pango units.

    Negative values go below the baseline. *)

external set_rise : t -> int -> unit = "ml_gtk_text_tag_set_rise"
(** Offset of text above the baseline, in Pango units.

    Negative values go below the baseline. *)

external get_rise_set : t -> bool = "ml_gtk_text_tag_get_rise_set"
(** Whether the [rise] property is set. *)

external set_rise_set : t -> bool -> unit = "ml_gtk_text_tag_set_rise_set"
(** Whether the [rise] property is set. *)

external get_scale : t -> float = "ml_gtk_text_tag_get_scale"
(** Font size as a scale factor relative to the default font size.

    This properly adapts to theme changes, etc. so is recommended. Pango
    predefines some scales such as [PANGO_SCALE_X_LARGE]. *)

external set_scale : t -> float -> unit = "ml_gtk_text_tag_set_scale"
(** Font size as a scale factor relative to the default font size.

    This properly adapts to theme changes, etc. so is recommended. Pango
    predefines some scales such as [PANGO_SCALE_X_LARGE]. *)

external get_scale_set : t -> bool = "ml_gtk_text_tag_get_scale_set"
(** Whether the [scale] property is set. *)

external set_scale_set : t -> bool -> unit = "ml_gtk_text_tag_set_scale_set"
(** Whether the [scale] property is set. *)

external get_sentence : t -> bool = "ml_gtk_text_tag_get_sentence"
(** Whether this tag represents a single sentence.

    This affects cursor movement. *)

external set_sentence : t -> bool -> unit = "ml_gtk_text_tag_set_sentence"
(** Whether this tag represents a single sentence.

    This affects cursor movement. *)

external get_sentence_set : t -> bool = "ml_gtk_text_tag_get_sentence_set"
(** Whether the [sentence] property is set. *)

external set_sentence_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_sentence_set"
(** Whether the [sentence] property is set. *)

external get_show_spaces : t -> Ocpango_enums.showflags
  = "ml_gtk_text_tag_get_show_spaces"
(** How to render invisible characters. *)

external set_show_spaces : t -> Ocpango_enums.showflags -> unit
  = "ml_gtk_text_tag_set_show_spaces"
(** How to render invisible characters. *)

external get_show_spaces_set : t -> bool = "ml_gtk_text_tag_get_show_spaces_set"
(** Whether the [show-spaces] property is set. *)

external set_show_spaces_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_show_spaces_set"
(** Whether the [show-spaces] property is set. *)

external get_size : t -> int = "ml_gtk_text_tag_get_size"
(** Font size in Pango units. *)

external set_size : t -> int -> unit = "ml_gtk_text_tag_set_size"
(** Font size in Pango units. *)

external get_size_points : t -> float = "ml_gtk_text_tag_get_size_points"
(** Font size in points. *)

external set_size_points : t -> float -> unit
  = "ml_gtk_text_tag_set_size_points"
(** Font size in points. *)

external get_size_set : t -> bool = "ml_gtk_text_tag_get_size_set"
(** Whether the [size] property is set. *)

external set_size_set : t -> bool -> unit = "ml_gtk_text_tag_set_size_set"
(** Whether the [size] property is set. *)

external get_stretch : t -> Ocpango_enums.stretch
  = "ml_gtk_text_tag_get_stretch"
(** Font stretch as a [PangoStretch], e.g. [PANGO_STRETCH_CONDENSED]. *)

external set_stretch : t -> Ocpango_enums.stretch -> unit
  = "ml_gtk_text_tag_set_stretch"
(** Font stretch as a [PangoStretch], e.g. [PANGO_STRETCH_CONDENSED]. *)

external get_stretch_set : t -> bool = "ml_gtk_text_tag_get_stretch_set"
(** Whether the [stretch] property is set. *)

external set_stretch_set : t -> bool -> unit = "ml_gtk_text_tag_set_stretch_set"
(** Whether the [stretch] property is set. *)

external get_strikethrough : t -> bool = "ml_gtk_text_tag_get_strikethrough"
(** Whether to strike through the text. *)

external set_strikethrough : t -> bool -> unit
  = "ml_gtk_text_tag_set_strikethrough"
(** Whether to strike through the text. *)

external get_strikethrough_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_text_tag_get_strikethrough_rgba"
(** This property modifies the color of strikeouts.

    If not set, strikeouts will use the foreground color. *)

external set_strikethrough_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_text_tag_set_strikethrough_rgba"
(** This property modifies the color of strikeouts.

    If not set, strikeouts will use the foreground color. *)

external get_strikethrough_rgba_set : t -> bool
  = "ml_gtk_text_tag_get_strikethrough_rgba_set"
(** If the [strikethrough-rgba] property has been set. *)

external set_strikethrough_rgba_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_strikethrough_rgba_set"
(** If the [strikethrough-rgba] property has been set. *)

external get_strikethrough_set : t -> bool
  = "ml_gtk_text_tag_get_strikethrough_set"
(** Whether the [strikethrough] property is set. *)

external set_strikethrough_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_strikethrough_set"
(** Whether the [strikethrough] property is set. *)

external get_style : t -> Ocpango_enums.style = "ml_gtk_text_tag_get_style"
(** Font style as a [PangoStyle], e.g. [PANGO_STYLE_ITALIC]. *)

external set_style : t -> Ocpango_enums.style -> unit
  = "ml_gtk_text_tag_set_style"
(** Font style as a [PangoStyle], e.g. [PANGO_STYLE_ITALIC]. *)

external get_style_set : t -> bool = "ml_gtk_text_tag_get_style_set"
(** Whether the [style] property is set. *)

external set_style_set : t -> bool -> unit = "ml_gtk_text_tag_set_style_set"
(** Whether the [style] property is set. *)

external get_tabs : t -> Ocpango_raw.Tab_array.t = "ml_gtk_text_tag_get_tabs"
(** Custom tabs for this text. *)

external set_tabs : t -> Ocpango_raw.Tab_array.t -> unit
  = "ml_gtk_text_tag_set_tabs"
(** Custom tabs for this text. *)

external get_tabs_set : t -> bool = "ml_gtk_text_tag_get_tabs_set"
(** Whether the [tabs] property is set. *)

external set_tabs_set : t -> bool -> unit = "ml_gtk_text_tag_set_tabs_set"
(** Whether the [tabs] property is set. *)

external get_text_transform : t -> Ocpango_enums.texttransform
  = "ml_gtk_text_tag_get_text_transform"
(** How to transform the text for display. *)

external set_text_transform : t -> Ocpango_enums.texttransform -> unit
  = "ml_gtk_text_tag_set_text_transform"
(** How to transform the text for display. *)

external get_text_transform_set : t -> bool
  = "ml_gtk_text_tag_get_text_transform_set"
(** Whether the [text-transform] property is set. *)

external set_text_transform_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_text_transform_set"
(** Whether the [text-transform] property is set. *)

external get_underline : t -> Ocpango_enums.underline
  = "ml_gtk_text_tag_get_underline"
(** Style of underline for this text. *)

external set_underline : t -> Ocpango_enums.underline -> unit
  = "ml_gtk_text_tag_set_underline"
(** Style of underline for this text. *)

external get_underline_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_text_tag_get_underline_rgba"
(** This property modifies the color of underlines.

    If not set, underlines will use the foreground color.

    If [Gtk.TextTag:underline] is set to [PANGO_UNDERLINE_ERROR], an alternate
    color may be applied instead of the foreground. Setting this property will
    always override those defaults. *)

external set_underline_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_text_tag_set_underline_rgba"
(** This property modifies the color of underlines.

    If not set, underlines will use the foreground color.

    If [Gtk.TextTag:underline] is set to [PANGO_UNDERLINE_ERROR], an alternate
    color may be applied instead of the foreground. Setting this property will
    always override those defaults. *)

external get_underline_rgba_set : t -> bool
  = "ml_gtk_text_tag_get_underline_rgba_set"
(** If the [underline-rgba] property has been set. *)

external set_underline_rgba_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_underline_rgba_set"
(** If the [underline-rgba] property has been set. *)

external get_underline_set : t -> bool = "ml_gtk_text_tag_get_underline_set"
(** Whether the [underline] property is set. *)

external set_underline_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_underline_set"
(** Whether the [underline] property is set. *)

external get_variant : t -> Ocpango_enums.variant
  = "ml_gtk_text_tag_get_variant"
(** Font variant as a [PangoVariant], e.g. [PANGO_VARIANT_SMALL_CAPS]. *)

external set_variant : t -> Ocpango_enums.variant -> unit
  = "ml_gtk_text_tag_set_variant"
(** Font variant as a [PangoVariant], e.g. [PANGO_VARIANT_SMALL_CAPS]. *)

external get_variant_set : t -> bool = "ml_gtk_text_tag_get_variant_set"
(** Whether the [variant] property is set. *)

external set_variant_set : t -> bool -> unit = "ml_gtk_text_tag_set_variant_set"
(** Whether the [variant] property is set. *)

external get_weight : t -> int = "ml_gtk_text_tag_get_weight"
(** Font weight as an integer. *)

external set_weight : t -> int -> unit = "ml_gtk_text_tag_set_weight"
(** Font weight as an integer. *)

external get_weight_set : t -> bool = "ml_gtk_text_tag_get_weight_set"
(** Whether the [weight] property is set. *)

external set_weight_set : t -> bool -> unit = "ml_gtk_text_tag_set_weight_set"
(** Whether the [weight] property is set. *)

external get_word : t -> bool = "ml_gtk_text_tag_get_word"
(** Whether this tag represents a single word.

    This affects line breaks and cursor movement. *)

external set_word : t -> bool -> unit = "ml_gtk_text_tag_set_word"
(** Whether this tag represents a single word.

    This affects line breaks and cursor movement. *)

external get_word_set : t -> bool = "ml_gtk_text_tag_get_word_set"
(** Whether the [word] property is set. *)

external set_word_set : t -> bool -> unit = "ml_gtk_text_tag_set_word_set"
(** Whether the [word] property is set. *)

external get_wrap_mode : t -> Ocgtk_enums.wrapmode
  = "ml_gtk_text_tag_get_wrap_mode"
(** Whether to wrap lines never, at word boundaries, or at character boundaries.
*)

external set_wrap_mode : t -> Ocgtk_enums.wrapmode -> unit
  = "ml_gtk_text_tag_set_wrap_mode"
(** Whether to wrap lines never, at word boundaries, or at character boundaries.
*)

external get_wrap_mode_set : t -> bool = "ml_gtk_text_tag_get_wrap_mode_set"
(** Whether the [wrap-mode] property is set. *)

external set_wrap_mode_set : t -> bool -> unit
  = "ml_gtk_text_tag_set_wrap_mode_set"
(** Whether the [wrap-mode] property is set. *)
