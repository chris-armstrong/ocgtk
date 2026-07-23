(* GENERATED CODE - DO NOT EDIT *)
(* Pango Constants *)

val analysis_flag_centered_baseline : int
(** Whether the segment should be shifted to center around the baseline.

    This is mainly used in vertical writing directions.
    @since 1.16 *)

val analysis_flag_is_ellipsis : int
(** Whether this run holds ellipsized text.
    @since 1.36.7 *)

val analysis_flag_need_hyphen : int
(** Whether to add a hyphen at the end of the run during shaping.
    @since 1.44 *)

val attr_index_from_text_beginning : int
(** Value for @start_index in `PangoAttribute` that indicates
the beginning of the text.
    @since 1.24 *)

val attr_index_to_text_end : int
(** Value for @end_index in `PangoAttribute` that indicates
the end of the text.
    @since 1.24 *)

val glyph_empty : int
(** A `PangoGlyph` value that indicates a zero-width empty glpyh.

    This is useful for example in shaper modules, to use as the glyph for
    various zero-width Unicode characters (those passing [func@is_zero_width]).
*)

val glyph_invalid_input : int
(** A `PangoGlyph` value for invalid input.

    `PangoLayout` produces one such glyph per invalid input UTF-8 byte and such
    a glyph is rendered as a crossed box.

    Note that this value is defined such that it has the
    %PANGO_GLYPH_UNKNOWN_FLAG set.
    @since 1.20 *)

val glyph_unknown_flag : int
(** Flag used in `PangoGlyph` to turn a `gunichar` value of a valid Unicode
    character into an unknown-character glyph for that `gunichar`.

    Such unknown-character glyphs may be rendered as a 'hex box'. *)

val scale : int
(** The scale between dimensions used for Pango distances and device units.

    The definition of device units is dependent on the output device; it will
    typically be pixels for a screen, and points for a printer. %PANGO_SCALE is
    currently 1024, but this may be changed in the future.

    When setting font sizes, device units are always considered to be points (as
    in "12 point font"), rather than pixels. *)

val version_major : int
(** The major component of the version of Pango available at compile-time. *)

val version_micro : int
(** The micro component of the version of Pango available at compile-time. *)

val version_minor : int
(** The minor component of the version of Pango available at compile-time. *)

val version_string : string
(** A string literal containing the version of Pango available at compile-time.
*)
