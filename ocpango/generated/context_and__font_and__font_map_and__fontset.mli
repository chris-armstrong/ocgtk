(** The classes of {!Ocpango.Context}, {!Ocpango.Font}, {!Ocpango.Font_map},
    {!Ocpango.Fontset}, defined together because they refer to each other. Each
    has a module of its own that re-exports it; use that module rather than this
    one. *)

(** {b The methods, signals and properties of a [Context].}

    A [PangoContext] stores global information used to control the itemization
    process.

    The information stored by [PangoContext] includes the fontmap used to look
    up fonts, and default values such as the default language, default gravity,
    or default font.

    To obtain a [PangoContext], use [Pango.FontMap.create_context]. *)
class type context_t = object
  method changed : unit -> unit
  (** Forces a change in the context, which will cause any [PangoLayout] using
      this context to re-layout.

      This function is only useful when implementing a new backend for Pango,
      something applications won't do. Backends should call this function if
      they have attached extra data to the context and such data is changed. *)

  method get_base_dir : unit -> Enums.direction
  (** Retrieves the base direction for the context.

      See [Pango.Context.set_base_dir]. *)

  method get_base_gravity : unit -> Enums.gravity
  (** Retrieves the base gravity for the context.

      See [Pango.Context.set_base_gravity]. *)

  method get_font_description : unit -> Raw.Font_description.t option
  (** Retrieve the default font description for the context. *)

  method get_font_map : unit -> font_map_t option
  (** Gets the [PangoFontMap] used to look up fonts for this context. *)

  method get_gravity : unit -> Enums.gravity
  (** Retrieves the gravity for the context.

      This is similar to [Pango.Context.get_base_gravity], except for when the
      base gravity is [PANGO_GRAVITY_AUTO] for which
      [Pango.Gravity.get_for_matrix] is used to return the gravity from the
      current context matrix. *)

  method get_gravity_hint : unit -> Enums.gravityhint
  (** Retrieves the gravity hint for the context.

      See [Pango.Context.set_gravity_hint] for details. *)

  method get_language : unit -> Raw.Language.t
  (** Retrieves the global language tag for the context. *)

  method get_matrix : unit -> Raw.Matrix.t option
  (** Gets the transformation matrix that will be applied when rendering with
      this context.

      See [Pango.Context.set_matrix]. *)

  method get_metrics :
    Raw.Font_description.t option -> Raw.Language.t option -> Raw.Font_metrics.t
  (** Get overall metric information for a particular font description.

      Since the metrics may be substantially different for different scripts, a
      language tag can be provided to indicate that the metrics should be
      retrieved that correspond to the script(s) used by that language.

      The [PangoFontDescription] is interpreted in the same way as by [itemize],
      and the family name may be a comma separated list of names. If characters
      from multiple of these families would be used to render the string, then
      the returned fonts would be a composite of the metrics for the fonts
      loaded for the individual families. *)

  method get_round_glyph_positions : unit -> bool
  (** Returns whether font rendering with this context should round glyph
      positions and widths. *)

  method get_serial : unit -> int
  [@@ocaml.doc
    "Returns the current serial number of [context].\n\n\
     The serial number is initialized to an small number larger than zero\n\
     when a new context is created and is increased whenever the context\n\
     is changed using any of the setter functions, or the [PangoFontMap] it\n\
     uses to find fonts has changed. The serial may wrap, but will never\n\
     have the value 0. Since it can wrap, never compare it with \"less than\",\n\
     always use \"not equals\".\n\n\
     This can be used to automatically detect changes to a [PangoContext],\n\
     and is only useful when implementing objects that need update when their\n\
     [PangoContext] changes, like [PangoLayout]."]

  method load_font : Raw.Font_description.t -> font_t option
  (** Loads the font in one of the fontmaps in the context that is the closest
      match for [desc]. *)

  method load_fontset :
    Raw.Font_description.t -> Raw.Language.t -> fontset_t option
  (** Load a set of fonts in the context that can be used to render a font
      matching [desc]. *)

  method set_base_dir : Enums.direction -> unit
  (** Sets the base direction for the context.

      The base direction is used in applying the Unicode bidirectional
      algorithm; if the [direction] is [PANGO_DIRECTION_LTR] or
      [PANGO_DIRECTION_RTL], then the value will be used as the paragraph
      direction in the Unicode bidirectional algorithm. A value of
      [PANGO_DIRECTION_WEAK_LTR] or [PANGO_DIRECTION_WEAK_RTL] is used only for
      paragraphs that do not contain any strong characters themselves. *)

  method set_base_gravity : Enums.gravity -> unit
  (** Sets the base gravity for the context.

      The base gravity is used in laying vertical text out. *)

  method set_font_description : Raw.Font_description.t -> unit
  (** Set the default font description for the context *)

  method set_font_map : font_map_t option -> unit
  (** Sets the font map to be searched when fonts are looked-up in this context.

      This is only for internal use by Pango backends, a [PangoContext] obtained
      via one of the recommended methods should already have a suitable font
      map. *)

  method set_gravity_hint : Enums.gravityhint -> unit
  (** Sets the gravity hint for the context.

      The gravity hint is used in laying vertical text out, and is only relevant
      if gravity of the context as returned by [Pango.Context.get_gravity] is
      set to [PANGO_GRAVITY_EAST] or [PANGO_GRAVITY_WEST]. *)

  method set_language : Raw.Language.t option -> unit
  (** Sets the global language tag for the context.

      The default language for the locale of the running process can be found
      using [Pango.Language.get_default]. *)

  method set_matrix : Raw.Matrix.t option -> unit
  (** Sets the transformation matrix that will be applied when rendering with
      this context.

      Note that reported metrics are in the user space coordinates before the
      application of the matrix, not device-space coordinates after the
      application of the matrix. So, they don't scale with the matrix, though
      they may change slightly for different matrices, depending on how the text
      is fit to the pixel grid. *)

  method set_round_glyph_positions : bool -> unit
  (** Sets whether font rendering with this context should round glyph positions
      and widths to integral positions, in device units.

      This is useful when the renderer can't handle subpixel positioning of
      glyphs.

      The default value is to round glyph positions, to remain compatible with
      previous Pango behavior. *)

  method as_context : Raw.Context.t
end

(** {b The methods, signals and properties of a [Font].}

    A [PangoFont] is used to represent a font in a rendering-system-independent
    manner. *)
and font_t = object
  method describe : unit -> Raw.Font_description.t
  (** Returns a description of the font, with font size set in points.

      Use [Pango.Font.describe_with_absolute_size] if you want the font size in
      device units. *)

  method describe_with_absolute_size : unit -> Raw.Font_description.t
  (** Returns a description of the font, with absolute font size set in device
      units.

      Use [Pango.Font.describe] if you want the font size in points. *)

  method get_coverage : Raw.Language.t -> Coverage.coverage_t
  (** Computes the coverage map for a given font and language tag. *)

  method get_face : unit -> Font_face_and__font_family.font_face_t option
  (** Gets the [PangoFontFace] to which [font] belongs.

      Note that this function can return [NULL] in cases where the font outlives
      its font map. *)

  method get_font_map : unit -> font_map_t option
  (** Gets the font map for which the font was created.

      Note that the font maintains a {i weak} reference to the font map, so if
      all references to font map are dropped, the font map will be finalized
      even if there are fonts created with the font map that are still alive. In
      that case this function will return [NULL].

      It is the responsibility of the user to ensure that the font map is kept
      alive. In most uses this is not an issue as a [PangoContext] holds a
      reference to the font map. *)

  method get_metrics : Raw.Language.t option -> Raw.Font_metrics.t
  (** Gets overall metric information for a font.

      Since the metrics may be substantially different for different scripts, a
      language tag can be provided to indicate that the metrics should be
      retrieved that correspond to the script(s) used by that language.

      If [font] is [NULL], this function gracefully sets some sane values in the
      output variables and returns. *)

  method has_char : int -> bool
  (** Returns whether the font provides a glyph for this character. *)

  method serialize : unit -> Glib_bytes.t
  (** Serializes the [font] in a way that can be uniquely identified.

      There are no guarantees about the format of the output across different
      versions of Pango.

      The intended use of this function is testing, benchmarking and debugging.
      The format is not meant as a permanent storage format.

      To recreate a font from its serialized form, use [Pango.Font.deserialize].
  *)

  method as_font : Raw.Font.t
end

(** {b The methods, signals and properties of a [FontMap].}

    A [PangoFontMap] represents the set of fonts available for a particular
    rendering system.

    This is a virtual object with implementations being specific to particular
    rendering systems. *)
and font_map_t = object
  inherit Ocgio.List_model.list_model_t

  method add_font_file : string -> (bool, GError.t) result
  (** Loads a font file with one or more fonts into the [PangoFontMap].

      The added fonts will take precedence over preexisting fonts with the same
      name. *)

  method changed : unit -> unit
  (** Forces a change in the fontmap, which will cause any [PangoContext] using
      this fontmap to change.

      This function is only useful when implementing a new backend for Pango,
      something applications won't do. Backends should call this function if
      they have attached extra data to the fontmap and such data is changed. *)

  method create_context : unit -> context_t
  (** Creates a [PangoContext] connected to [fontmap].

      This is equivalent to [Pango.Context.new] followed by
      [Pango.Context.set_font_map].

      If you are using Pango as part of a higher-level system, that system may
      have it's own way of create a [PangoContext]. For instance, the GTK
      toolkit has, among others, gtk_widget_get_pango_context(). Use those
      instead. *)

  method get_family : string -> Font_face_and__font_family.font_family_t option
  (** Gets a font family by name. *)

  method get_serial : unit -> int
  [@@ocaml.doc
    "Returns the current serial number of [fontmap].\n\n\
     The serial number is initialized to an small number larger than zero\n\
     when a new fontmap is created and is increased whenever the fontmap\n\
     is changed. It may wrap, but will never have the value 0. Since it can\n\
     wrap, never compare it with \"less than\", always use \"not equals\".\n\n\
     The fontmap can only be changed using backend-specific API, like changing\n\
     fontmap resolution.\n\n\
     This can be used to automatically detect changes to a [PangoFontMap],\n\
     like in [PangoContext]."]

  method load_font : context_t -> Raw.Font_description.t -> font_t option
  (** Load the font in the fontmap that is the closest match for [desc]. *)

  method load_fontset :
    context_t -> Raw.Font_description.t -> Raw.Language.t -> fontset_t option
  (** Load a set of fonts in the fontmap that can be used to render a font
      matching [desc]. *)

  method reload_font :
    font_t -> float -> context_t option -> string option -> font_t
  (** Returns a new font that is like [font], except that it is scaled by
      [scale], its backend-dependent configuration (e.g. cairo font options) is
      replaced by the one in [context], and its variations are replaced by
      [variations].

      Note that the scaling here is meant to be linear, so this scaling can be
      used to render a font on a hi-dpi display without changing its optical
      size. *)

  method item_type : Gobject.Type.t
  (** The type of items contained in this list. *)

  method n_items : int
  (** The number of items contained in this list. *)

  method as_font_map : Raw.Font_map.t
end

(** {b The methods, signals and properties of a [Fontset].}

    A [PangoFontset] represents a set of [PangoFont] to use when rendering text.

    A [PangoFontset] is the result of resolving a [PangoFontDescription] against
    a particular [PangoContext]. It has operations for finding the component
    font for a particular Unicode character, and for finding a composite set of
    metrics for the entire fontset. *)
and fontset_t = object
  method get_font : int -> font_t
  (** Returns the font in the fontset that contains the best glyph for a Unicode
      character. *)

  method get_metrics : unit -> Raw.Font_metrics.t
  (** Get overall metric information for the fonts in the fontset. *)

  method as_fontset : Raw.Fontset.t
end

(** Wraps a raw handle of {!Ocpango.Raw.Context.t}. *)
class context : Raw.Context.t -> context_t
(** Wraps a raw handle of {!Ocpango.Raw.Font.t}. *)

and font : Raw.Font.t -> font_t
(** Wraps a raw handle of {!Ocpango.Raw.Font_map.t}. *)

and font_map : Raw.Font_map.t -> font_map_t
(** Wraps a raw handle of {!Ocpango.Raw.Fontset.t}. *)

and fontset : Raw.Fontset.t -> fontset_t

val new_ : unit -> context_t
(** Creates a new [PangoContext] initialized to default values.

    This function is not particularly useful as it should always be followed by
    a [Pango.Context.set_font_map] call, and the function
    [Pango.FontMap.create_context] does these two steps together and hence users
    are recommended to use that.

    If you are using Pango as part of a higher-level system, that system may
    have it's own way of create a [PangoContext]. For instance, the GTK toolkit
    has, among others, [gtk_widget_get_pango_context()]. Use those instead. *)
