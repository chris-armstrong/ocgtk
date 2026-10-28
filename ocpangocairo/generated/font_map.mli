(** [PangoCairoFontMap] is an interface exported by font maps for use with
    Cairo.

    Its methods, signals and properties are on {!class-type-font_map_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocpangocairo.Raw.Font_map}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontMap].}

    [PangoCairoFontMap] is an interface exported by font maps for use with
    Cairo.

    The actual type of the font map will depend on the particular font
    technology Cairo was compiled to use. *)
class type font_map_t = object
  (** {2:methods Methods} *)

  method get_font_type : unit -> Occairo.Enums.fonttype
  (** Gets the type of Cairo font backend that [fontmap] uses. *)

  method get_resolution : unit -> float
  (** Gets the resolution for the fontmap.

      See [PangoCairo.FontMap.set_resolution]. *)

  method set_default : unit -> unit
  (** Sets a default [PangoCairoFontMap] to use with Cairo.

      This can be used to change the Cairo font backend that the default fontmap
      uses for example. The old default font map is unreffed and the new font
      map referenced.

      Note that since Pango 1.32.6, the default fontmap is per-thread. This
      function only changes the default fontmap for the current thread. Default
      fontmaps of existing threads are not changed. Default fontmaps of any new
      threads will still be created using [PangoCairo.FontMap.new].

      A value of [NULL] for [fontmap] will cause the current default font map to
      be released and a new default font map to be created on demand, using
      [PangoCairo.FontMap.new]. *)

  method set_resolution : float -> unit
  (** Sets the resolution for the fontmap.

      This is a scale factor between points specified in a
      [PangoFontDescription] and Cairo units. The default value is 96, meaning
      that a 10 point font will be 13 units high. (10 * 96. / 72. = 13.3). *)

  (** {2:conversions Conversions} *)

  method as_font_map : Raw.Font_map.t
end

class font_map : Raw.Font_map.t -> font_map_t
(** Wraps a raw handle of {!Ocpangocairo.Raw.Font_map.t}. *)

(** {1:description Description}

    [PangoCairoFontMap] is an interface exported by font maps for use with
    Cairo.

    The actual type of the font map will depend on the particular font
    technology Cairo was compiled to use. *)
