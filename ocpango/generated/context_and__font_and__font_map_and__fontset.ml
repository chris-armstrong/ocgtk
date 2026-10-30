(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type context_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_context : Raw.Context.t
end

and font_t = object
  (** {2:methods Methods} *)

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

  method get_face : unit -> Font_face.font_face_t option
  (** Gets the [PangoFontFace] to which [font] belongs.

      Note that this function can return [None] in cases where the font outlives
      its font map. *)

  method get_font_map : unit -> font_map_t option
  (** Gets the font map for which the font was created.

      Note that the font maintains a {i weak} reference to the font map, so if
      all references to font map are dropped, the font map will be finalized
      even if there are fonts created with the font map that are still alive. In
      that case this function will return [None].

      It is the responsibility of the user to ensure that the font map is kept
      alive. In most uses this is not an issue as a [PangoContext] holds a
      reference to the font map. *)

  method get_metrics : Raw.Language.t option -> Raw.Font_metrics.t
  (** Gets overall metric information for a font.

      Since the metrics may be substantially different for different scripts, a
      language tag can be provided to indicate that the metrics should be
      retrieved that correspond to the script(s) used by that language.

      If [font] is [None], this function gracefully sets some sane values in the
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

  (** {2:conversions Conversions} *)

  method as_font : Raw.Font.t
end

and font_map_t = object
  inherit Ocgio.List_model.list_model_t

  (** {2:methods Methods} *)

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
      toolkit has, among others, [gtk_widget_get_pango_context ()]. Use those
      instead. *)

  method get_family : string -> Font_family.font_family_t option
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

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items contained in this list. *)

  method n_items : int
  (** The number of items contained in this list. *)

  (** {2:conversions Conversions} *)

  method as_font_map : Raw.Font_map.t
end

and fontset_t = object
  (** {2:methods Methods} *)

  method get_font : int -> font_t
  (** Returns the font in the fontset that contains the best glyph for a Unicode
      character. *)

  method get_metrics : unit -> Raw.Font_metrics.t
  (** Get overall metric information for the fonts in the fontset. *)

  (** {2:conversions Conversions} *)

  method as_fontset : Raw.Fontset.t
end

class context (obj : Raw.Context.t) : context_t =
  object (self)
    method changed : unit -> unit = fun () -> Raw.Context.changed obj

    method get_base_dir : unit -> Enums.direction =
      fun () -> Raw.Context.get_base_dir obj

    method get_base_gravity : unit -> Enums.gravity =
      fun () -> Raw.Context.get_base_gravity obj

    method get_font_description : unit -> Raw.Font_description.t option =
      fun () -> Raw.Context.get_font_description obj

    method get_font_map : unit -> font_map_t option =
      fun () ->
        Option.map (fun ret -> new font_map ret) (Raw.Context.get_font_map obj)

    method get_gravity : unit -> Enums.gravity =
      fun () -> Raw.Context.get_gravity obj

    method get_gravity_hint : unit -> Enums.gravityhint =
      fun () -> Raw.Context.get_gravity_hint obj

    method get_language : unit -> Raw.Language.t =
      fun () -> Raw.Context.get_language obj

    method get_matrix : unit -> Raw.Matrix.t option =
      fun () -> Raw.Context.get_matrix obj

    method get_metrics :
        Raw.Font_description.t option ->
        Raw.Language.t option ->
        Raw.Font_metrics.t =
      fun desc language -> Raw.Context.get_metrics obj desc language

    method get_round_glyph_positions : unit -> bool =
      fun () -> Raw.Context.get_round_glyph_positions obj

    method get_serial : unit -> int = fun () -> Raw.Context.get_serial obj

    method load_font : Raw.Font_description.t -> font_t option =
      fun desc ->
        Option.map (fun ret -> new font ret) (Raw.Context.load_font obj desc)

    method load_fontset :
        Raw.Font_description.t -> Raw.Language.t -> fontset_t option =
      fun desc language ->
        Option.map
          (fun ret -> new fontset ret)
          (Raw.Context.load_fontset obj desc language)

    method set_base_dir : Enums.direction -> unit =
      fun direction -> Raw.Context.set_base_dir obj direction

    method set_base_gravity : Enums.gravity -> unit =
      fun gravity -> Raw.Context.set_base_gravity obj gravity

    method set_font_description : Raw.Font_description.t -> unit =
      fun desc -> Raw.Context.set_font_description obj desc

    method set_font_map : font_map_t option -> unit =
      fun font_map ->
        let font_map = Option.map (fun c -> c#as_font_map) font_map in
        Raw.Context.set_font_map obj font_map

    method set_gravity_hint : Enums.gravityhint -> unit =
      fun hint -> Raw.Context.set_gravity_hint obj hint

    method set_language : Raw.Language.t option -> unit =
      fun language -> Raw.Context.set_language obj language

    method set_matrix : Raw.Matrix.t option -> unit =
      fun matrix -> Raw.Context.set_matrix obj matrix

    method set_round_glyph_positions : bool -> unit =
      fun round_positions ->
        Raw.Context.set_round_glyph_positions obj round_positions

    method as_context = obj
  end

and font (obj : Raw.Font.t) : font_t =
  object (self)
    method describe : unit -> Raw.Font_description.t =
      fun () -> Raw.Font.describe obj

    method describe_with_absolute_size : unit -> Raw.Font_description.t =
      fun () -> Raw.Font.describe_with_absolute_size obj

    method get_coverage : Raw.Language.t -> Coverage.coverage_t =
      fun language -> new Coverage.coverage (Raw.Font.get_coverage obj language)

    method get_face : unit -> Font_face.font_face_t option =
      fun () ->
        Option.map
          (fun ret -> new Font_face.font_face ret)
          (Raw.Font.get_face obj)

    method get_font_map : unit -> font_map_t option =
      fun () ->
        Option.map (fun ret -> new font_map ret) (Raw.Font.get_font_map obj)

    method get_metrics : Raw.Language.t option -> Raw.Font_metrics.t =
      fun language -> Raw.Font.get_metrics obj language

    method has_char : int -> bool = fun wc -> Raw.Font.has_char obj wc
    method serialize : unit -> Glib_bytes.t = fun () -> Raw.Font.serialize obj
    method as_font = obj
  end

and font_map (obj : Raw.Font_map.t) : font_map_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method add_font_file : string -> (bool, GError.t) result =
      fun filename -> Raw.Font_map.add_font_file obj filename

    method changed : unit -> unit = fun () -> Raw.Font_map.changed obj

    method create_context : unit -> context_t =
      fun () -> new context (Raw.Font_map.create_context obj)

    method get_family : string -> Font_family.font_family_t option =
      fun name ->
        Option.map
          (fun ret -> new Font_family.font_family ret)
          (Raw.Font_map.get_family obj name)

    method get_serial : unit -> int = fun () -> Raw.Font_map.get_serial obj

    method load_font : context_t -> Raw.Font_description.t -> font_t option =
      fun context desc ->
        let context = context#as_context in
        Option.map
          (fun ret -> new font ret)
          (Raw.Font_map.load_font obj context desc)

    method load_fontset :
        context_t ->
        Raw.Font_description.t ->
        Raw.Language.t ->
        fontset_t option =
      fun context desc language ->
        let context = context#as_context in
        Option.map
          (fun ret -> new fontset ret)
          (Raw.Font_map.load_fontset obj context desc language)

    method reload_font :
        font_t -> float -> context_t option -> string option -> font_t =
      fun font scale context variations ->
        let font = font#as_font in
        let context = Option.map (fun c -> c#as_context) context in
        new font (Raw.Font_map.reload_font obj font scale context variations)

    method item_type = Raw.Font_map.get_item_type obj
    method n_items = Raw.Font_map.get_n_items obj
    method as_font_map = obj
  end

and fontset (obj : Raw.Fontset.t) : fontset_t =
  object (self)
    method get_font : int -> font_t =
      fun wc -> new font (Raw.Fontset.get_font obj wc)

    method get_metrics : unit -> Raw.Font_metrics.t =
      fun () -> Raw.Fontset.get_metrics obj

    method as_fontset = obj
  end

let new_ () : context_t = new context (Raw.Context.new_ ())
