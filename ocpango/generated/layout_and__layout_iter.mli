(** The classes of {!Ocpango.Layout}, {!Ocpango.Layout_iter}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [PangoLayout]. *)
class type layout_t = object
  method context_changed : unit -> unit
  (** Forces recomputation of any state in the [PangoLayout] that might depend
      on the layout's context.

      This function should be called if you make changes to the context
      subsequent to creating the layout. *)

  method copy : unit -> layout_t
  (** Creates a deep copy-by-value of the layout.

      The attribute list, tab array, and text from the original layout are all
      copied by value. *)

  method get_alignment : unit -> Enums.alignment
  (** Gets the alignment for the layout: how partial lines are positioned within
      the horizontal space available. *)

  method get_attributes : unit -> Raw.Attr_list.t option
  (** Gets the attribute list for the layout, if any. *)

  method get_auto_dir : unit -> bool
  (** Gets whether to calculate the base direction for the layout according to
      its contents.

      See [Pango.Layout.set_auto_dir]. *)

  method get_baseline : unit -> int
  (** Gets the Y position of baseline of the first line in [layout]. *)

  method get_character_count : unit -> int
  (** Returns the number of Unicode characters in the the text of [layout]. *)

  method get_context :
    unit -> Context_and__font_and__font_map_and__fontset.context_t
  (** Retrieves the [PangoContext] used for this layout. *)

  method get_direction : int -> Enums.direction
  (** Gets the text direction at the given character position in [layout]. *)

  method get_ellipsize : unit -> Enums.ellipsizemode
  (** Gets the type of ellipsization being performed for [layout].

      See [Pango.Layout.set_ellipsize].

      Use [Pango.Layout.is_ellipsized] to query whether any paragraphs were
      actually ellipsized. *)

  method get_font_description : unit -> Raw.Font_description.t option
  (** Gets the font description for the layout, if any. *)

  method get_height : unit -> int
  (** Gets the height of layout used for ellipsization.

      See [Pango.Layout.set_height] for details. *)

  method get_indent : unit -> int
  (** Gets the paragraph indent width in Pango units.

      A negative value indicates a hanging indentation. *)

  method get_iter : unit -> Raw.Layout_iter.t
  (** Returns an iterator to iterate over the visual extents of the layout. *)

  method get_justify : unit -> bool
  (** Gets whether each complete line should be stretched to fill the entire
      width of the layout. *)

  method get_justify_last_line : unit -> bool
  (** Gets whether the last line should be stretched to fill the entire width of
      the layout. *)

  method get_line : int -> Raw.Layout_line.t option
  (** Retrieves a particular line from a [PangoLayout].

      Use the faster [Pango.Layout.get_line_readonly] if you do not plan to
      modify the contents of the line (glyphs, glyph widths, etc.). *)

  method get_line_count : unit -> int
  (** Retrieves the count of lines for the [layout]. *)

  method get_line_readonly : int -> Raw.Layout_line.t option
  (** Retrieves a particular line from a [PangoLayout].

      This is a faster alternative to [Pango.Layout.get_line], but the user is
      not expected to modify the contents of the line (glyphs, glyph widths,
      etc.). *)

  method get_line_spacing : unit -> float
  (** Gets the line spacing factor of [layout].

      See [Pango.Layout.set_line_spacing]. *)

  method get_lines : unit -> Raw.Layout_line.t list
  (** Returns the lines of the [layout] as a list.

      Use the faster [Pango.Layout.get_lines_readonly] if you do not plan to
      modify the contents of the lines (glyphs, glyph widths, etc.). *)

  method get_lines_readonly : unit -> Raw.Layout_line.t list
  (** Returns the lines of the [layout] as a list.

      This is a faster alternative to [Pango.Layout.get_lines], but the user is
      not expected to modify the contents of the lines (glyphs, glyph widths,
      etc.). *)

  method get_serial : unit -> int
  [@@ocaml.doc
    "Returns the current serial number of [layout].\n\n\
     The serial number is initialized to an small number larger than zero\n\
     when a new layout is created and is increased whenever the layout is\n\
     changed using any of the setter functions, or the [PangoContext] it\n\
     uses has changed. The serial may wrap, but will never have the value 0.\n\
     Since it can wrap, never compare it with \"less than\", always use \"not \
     equals\".\n\n\
     This can be used to automatically detect changes to a [PangoLayout],\n\
     and is useful for example to decide whether a layout needs redrawing.\n\
     To force the serial to be increased, use\n\
     [Pango.Layout.context_changed]."]

  method get_single_paragraph_mode : unit -> bool
  (** Obtains whether [layout] is in single paragraph mode.

      See [Pango.Layout.set_single_paragraph_mode]. *)

  method get_spacing : unit -> int
  (** Gets the amount of spacing between the lines of the layout. *)

  method get_tabs : unit -> Raw.Tab_array.t option
  (** Gets the current [PangoTabArray] used by this layout.

      If no [PangoTabArray] has been set, then the default tabs are in use and
      [NULL] is returned. Default tabs are every 8 spaces.

      The return value should be freed with [Pango.TabArray.free]. *)

  method get_text : unit -> string
  (** Gets the text in the layout.

      The returned text should not be freed or modified. *)

  method get_unknown_glyphs_count : unit -> int
  (** Counts the number of unknown glyphs in [layout].

      This function can be used to determine if there are any fonts available to
      render all characters in a certain string, or when used in combination
      with [PANGO_ATTR_FALLBACK], to check if a certain font supports all the
      characters in the string. *)

  method get_width : unit -> int
  (** Gets the width to which the lines of the [PangoLayout] should wrap. *)

  method get_wrap : unit -> Enums.wrapmode
  (** Gets the wrap mode for the layout.

      Use [Pango.Layout.is_wrapped] to query whether any paragraphs were
      actually wrapped. *)

  method is_ellipsized : unit -> bool
  (** Queries whether the layout had to ellipsize any paragraphs.

      This returns [TRUE] if the ellipsization mode for [layout] is not
      [PANGO_ELLIPSIZE_NONE], a positive width is set on [layout], and there are
      paragraphs exceeding that width that have to be ellipsized. *)

  method is_wrapped : unit -> bool
  (** Queries whether the layout had to wrap any paragraphs.

      This returns [TRUE] if a positive width is set on [layout], and there are
      paragraphs exceeding the layout width that have to be wrapped. *)

  method serialize : Enums.layoutserializeflags -> Glib_bytes.t
  (** Serializes the [layout] for later deserialization via
      [Pango.Layout.deserialize].

      There are no guarantees about the format of the output across different
      versions of Pango and [Pango.Layout.deserialize] will reject data that it
      cannot parse.

      The intended use of this function is testing, benchmarking and debugging.
      The format is not meant as a permanent storage format. *)

  method set_alignment : Enums.alignment -> unit
  (** Sets the alignment for the layout: how partial lines are positioned within
      the horizontal space available.

      The default alignment is [PANGO_ALIGN_LEFT]. *)

  method set_attributes : Raw.Attr_list.t option -> unit
  (** Sets the text attributes for a layout object.

      References [attrs], so the caller can unref its reference. *)

  method set_auto_dir : bool -> unit
  (** Sets whether to calculate the base direction for the layout according to
      its contents.

      When this flag is on (the default), then paragraphs in [layout] that begin
      with strong right-to-left characters (Arabic and Hebrew principally), will
      have right-to-left layout, paragraphs with letters from other scripts will
      have left-to-right layout. Paragraphs with only neutral characters get
      their direction from the surrounding paragraphs.

      When [FALSE], the choice between left-to-right and right-to-left layout is
      done according to the base direction of the layout's [PangoContext]. (See
      [Pango.Context.set_base_dir]).

      When the auto-computed direction of a paragraph differs from the base
      direction of the context, the interpretation of [PANGO_ALIGN_LEFT] and
      [PANGO_ALIGN_RIGHT] are swapped. *)

  method set_ellipsize : Enums.ellipsizemode -> unit
  (** Sets the type of ellipsization being performed for [layout].

      Depending on the ellipsization mode [ellipsize] text is removed from the
      start, middle, or end of text so they fit within the width and height of
      layout set with [Pango.Layout.set_width] and [Pango.Layout.set_height].

      If the layout contains characters such as newlines that force it to be
      layed out in multiple paragraphs, then whether each paragraph is
      ellipsized separately or the entire layout is ellipsized as a whole
      depends on the set height of the layout.

      The default value is [PANGO_ELLIPSIZE_NONE].

      See [Pango.Layout.set_height] for details. *)

  method set_font_description : Raw.Font_description.t option -> unit
  (** Sets the default font description for the layout.

      If no font description is set on the layout, the font description from the
      layout's context is used. *)

  method set_height : int -> unit
  (** Sets the height to which the [PangoLayout] should be ellipsized at.

      There are two different behaviors, based on whether [height] is positive
      or negative.

      If [height] is positive, it will be the maximum height of the layout. Only
      lines would be shown that would fit, and if there is any text omitted, an
      ellipsis added. At least one line is included in each paragraph regardless
      of how small the height value is. A value of zero will render exactly one
      line for the entire layout.

      If [height] is negative, it will be the (negative of) maximum number of
      lines per paragraph. That is, the total number of lines shown may well be
      more than this value if the layout contains multiple paragraphs of text.
      The default value of -1 means that the first line of each paragraph is
      ellipsized. This behavior may be changed in the future to act per layout
      instead of per paragraph. File a bug against pango at
      {{:https://gitlab.gnome.org/gnome/pango}https://gitlab.gnome.org/gnome/pango}
      if your code relies on this behavior.

      Height setting only has effect if a positive width is set on [layout] and
      ellipsization mode of [layout] is not [PANGO_ELLIPSIZE_NONE]. The behavior
      is undefined if a height other than -1 is set and ellipsization mode is
      set to [PANGO_ELLIPSIZE_NONE], and may change in the future. *)

  method set_indent : int -> unit
  (** Sets the width in Pango units to indent each paragraph.

      A negative value of [indent] will produce a hanging indentation. That is,
      the first line will have the full width, and subsequent lines will be
      indented by the absolute value of [indent].

      The indent setting is ignored if layout alignment is set to
      [PANGO_ALIGN_CENTER].

      The default value is 0. *)

  method set_justify : bool -> unit
  (** Sets whether each complete line should be stretched to fill the entire
      width of the layout.

      Stretching is typically done by adding whitespace, but for some scripts
      (such as Arabic), the justification may be done in more complex ways, like
      extending the characters.

      Note that this setting is not implemented and so is ignored in Pango older
      than 1.18.

      Note that tabs and justification conflict with each other: Justification
      will move content away from its tab-aligned positions.

      The default value is [FALSE].

      Also see [Pango.Layout.set_justify_last_line]. *)

  method set_justify_last_line : bool -> unit
  (** Sets whether the last line should be stretched to fill the entire width of
      the layout.

      This only has an effect if [Pango.Layout.set_justify] has been called as
      well.

      The default value is [FALSE]. *)

  method set_line_spacing : float -> unit
  (** Sets a factor for line spacing.

      Typical values are: 0, 1, 1.5, 2. The default values is 0.

      If [factor] is non-zero, lines are placed so that

      baseline2 = baseline1 + factor * height2

      where height2 is the line height of the second line (as determined by the
      font(s)). In this case, the spacing set with [Pango.Layout.set_spacing] is
      ignored.

      If [factor] is zero (the default), spacing is applied as before.

      Note: for semantics that are closer to the CSS line-height property, see
      [Pango.attr_line_height_new]. *)

  method set_markup : string -> int -> unit
  (** Sets the layout text and attribute list from marked-up text.

      See Pango Markup).

      Replaces the current text and attribute list.

      This is the same as [Pango.Layout.set_markup_with_accel], but the markup
      text isn't scanned for accelerators. *)

  method set_single_paragraph_mode : bool -> unit
  (** Sets the single paragraph mode of [layout].

      If [setting] is [TRUE], do not treat newlines and similar characters as
      paragraph separators; instead, keep all text in a single paragraph, and
      display a glyph for paragraph separator characters. Used when you want to
      allow editing of newlines on a single text line.

      The default value is [FALSE]. *)

  method set_spacing : int -> unit
  (** Sets the amount of spacing in Pango units between the lines of the layout.

      When placing lines with spacing, Pango arranges things so that

      line2.top = line1.bottom + spacing

      The default value is 0.

      Note: Since 1.44, Pango is using the line height (as determined by the
      font) for placing lines when the line spacing factor is set to a non-zero
      value with [Pango.Layout.set_line_spacing]. In that case, the [spacing]
      set with this function is ignored.

      Note: for semantics that are closer to the CSS line-height property, see
      [Pango.attr_line_height_new]. *)

  method set_tabs : Raw.Tab_array.t option -> unit
  (** Sets the tabs to use for [layout], overriding the default tabs.

      [PangoLayout] will place content at the next tab position whenever it
      meets a Tab character (U+0009).

      By default, tabs are every 8 spaces. If [tabs] is [NULL], the default tabs
      are reinstated. [tabs] is copied into the layout; you must free your copy
      of [tabs] yourself.

      Note that tabs and justification conflict with each other: Justification
      will move content away from its tab-aligned positions. The same is true
      for alignments other than [PANGO_ALIGN_LEFT]. *)

  method set_text : string -> int -> unit
  (** Sets the text of the layout.

      This function validates [text] and renders invalid UTF-8 with a
      placeholder glyph.

      Note that if you have used [Pango.Layout.set_markup] or
      [Pango.Layout.set_markup_with_accel] on [layout] before, you may want to
      call [Pango.Layout.set_attributes] to clear the attributes set on the
      layout from the markup as this function does not clear attributes. *)

  method set_width : int -> unit
  (** Sets the width to which the lines of the [PangoLayout] should wrap or get
      ellipsized.

      The default value is -1: no width set. *)

  method set_wrap : Enums.wrapmode -> unit
  (** Sets the wrap mode.

      The wrap mode only has effect if a width is set on the layout with
      [Pango.Layout.set_width]. To turn off wrapping, set the width to -1.

      The default value is [PANGO_WRAP_WORD]. *)

  method write_to_file :
    Enums.layoutserializeflags -> string -> (bool, GError.t) result
  (** A convenience method to serialize a layout to a file.

      It is equivalent to calling [Pango.Layout.serialize] followed by
      [GLib.file_set_contents].

      See those two functions for details on the arguments.

      It is mostly intended for use inside a debugger to quickly dump a layout
      to a file for later inspection. *)

  method as_layout : Raw.Layout.t
end

(** The methods, signals and properties of a [PangoLayoutIter]. *)
and layout_iter_t = object
  method at_last_line : unit -> bool
  (** Determines whether [iter] is on the last line of the layout. *)

  method get_baseline : unit -> int
  (** Gets the Y position of the current line's baseline, in layout coordinates.

      Layout coordinates have the origin at the top left of the entire layout.
  *)

  method get_index : unit -> int
  (** Gets the current byte index.

      Note that iterating forward by char moves in visual order, not logical
      order, so indexes may not be sequential. Also, the index may be equal to
      the length of the text in the layout, if on the [NULL] run (see
      [Pango.LayoutIter.get_run]). *)

  method get_layout : unit -> layout_t option
  (** Gets the layout associated with a [PangoLayoutIter]. *)

  method get_line : unit -> Raw.Layout_line.t option
  (** Gets the current line.

      Use the faster [Pango.LayoutIter.get_line_readonly] if you do not plan to
      modify the contents of the line (glyphs, glyph widths, etc.). *)

  method get_line_readonly : unit -> Raw.Layout_line.t option
  (** Gets the current line for read-only access.

      This is a faster alternative to [Pango.LayoutIter.get_line], but the user
      is not expected to modify the contents of the line (glyphs, glyph widths,
      etc.). *)

  method get_run_baseline : unit -> int
  (** Gets the Y position of the current run's baseline, in layout coordinates.

      Layout coordinates have the origin at the top left of the entire layout.

      The run baseline can be different from the line baseline, for example due
      to superscript or subscript positioning. *)

  method next_char : unit -> bool
  (** Moves [iter] forward to the next character in visual order.

      If [iter] was already at the end of the layout, returns [FALSE]. *)

  method next_cluster : unit -> bool
  (** Moves [iter] forward to the next cluster in visual order.

      If [iter] was already at the end of the layout, returns [FALSE]. *)

  method next_line : unit -> bool
  (** Moves [iter] forward to the start of the next line.

      If [iter] is already on the last line, returns [FALSE]. *)

  method next_run : unit -> bool
  (** Moves [iter] forward to the next run in visual order.

      If [iter] was already at the end of the layout, returns [FALSE]. *)

  method as_layout_iter : Raw.Layout_iter.t
end

(** Wraps a layer 1 handle, {!Ocpango.Raw.Layout.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoLayout], give one already wrapped. *)
class layout : Raw.Layout.t -> layout_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Layout_iter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoLayoutIter], give one already wrapped. *)

and layout_iter : Raw.Layout_iter.t -> layout_iter_t

val new_ : Context_and__font_and__font_map_and__fontset.context_t -> layout_t
