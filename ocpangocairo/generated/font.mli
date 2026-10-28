(** [PangoCairoFont] is an interface exported by fonts for use with Cairo.

    The actual type of the font will depend on the particular font technology
    Cairo was compiled to use.

    Its methods, signals and properties are on {!class-type-font_t}. The
    functions it is built on are in {!Ocpangocairo.Raw.Font}. *)

(** The methods, signals and properties of a [Font]. *)
class type font_t = object
  method get_scaled_font : unit -> Occairo.Scaled_font.scaled_font_t option
  (** Gets the [cairo_scaled_font_t] used by [font]. The scaled font can be
      referenced and kept using cairo_scaled_font_reference(). *)

  method as_font : Raw.Font.t
end

class font : Raw.Font.t -> font_t
(** Wraps a raw handle of {!Ocpangocairo.Raw.Font.t}. *)
