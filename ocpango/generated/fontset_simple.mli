(** [PangoFontsetSimple] is a implementation of the abstract [PangoFontset] base
    class as an array of fonts.

    When creating a [PangoFontsetSimple], you have to provide the array of fonts
    that make up the fontset.

    Its methods, signals and properties are on {!class-type-fontset_simple_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocpango.Raw.Fontset_simple}. *)

(** The methods, signals and properties of a [PangoFontsetSimple]. *)
class type fontset_simple_t = object
  inherit Context_and__font_and__font_map_and__fontset.fontset_t

  method append : Context_and__font_and__font_map_and__fontset.font_t -> unit
  (** Adds a font to the fontset.

      The fontset takes ownership of [font]. *)

  method size : unit -> int
  (** Returns the number of fonts in the fontset. *)

  method as_fontset_simple : Raw.Fontset_simple.t
end

class fontset_simple : Raw.Fontset_simple.t -> fontset_simple_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Fontset_simple.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoFontsetSimple], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Raw.Language.t -> fontset_simple_t
(** Creates a new [PangoFontsetSimple] for the given language. *)
