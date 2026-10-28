(** [PangoFontsetSimple] is a implementation of the abstract [PangoFontset] base
    class as an array of fonts.

    Its methods, signals and properties are on {!class-type-fontset_simple_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Fontset_simple}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontsetSimple].}

    Inherits from: {{!Ocpango.Fontset.class-type-fontset_t}Ocpango.Fontset}

    [PangoFontsetSimple] is a implementation of the abstract [PangoFontset] base
    class as an array of fonts.

    When creating a [PangoFontsetSimple], you have to provide the array of fonts
    that make up the fontset. *)
class type fontset_simple_t = object
  inherit Context_and__font_and__font_map_and__fontset.fontset_t

  (** {2:methods Methods} *)

  method append : Context_and__font_and__font_map_and__fontset.font_t -> unit
  (** Adds a font to the fontset.

      The fontset takes ownership of [font]. *)

  method size : unit -> int
  (** Returns the number of fonts in the fontset. *)

  (** {2:conversions Conversions} *)

  method as_fontset_simple : Raw.Fontset_simple.t
end

class fontset_simple : Raw.Fontset_simple.t -> fontset_simple_t
(** Wraps a raw handle of {!Ocpango.Raw.Fontset_simple.t}. *)

(** {1:description Description}

    [PangoFontsetSimple] is a implementation of the abstract [PangoFontset] base
    class as an array of fonts.

    When creating a [PangoFontsetSimple], you have to provide the array of fonts
    that make up the fontset. *)

(** {1:constructors Constructors} *)

val new_ : Raw.Language.t -> fontset_simple_t
(** Creates a new [PangoFontsetSimple] for the given language. *)
