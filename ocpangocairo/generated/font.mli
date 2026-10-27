(** [PangoCairoFont] is an interface exported by fonts for use with Cairo.

    The actual type of the font will depend on the particular font technology
    Cairo was compiled to use.

    Its methods, signals and properties are on {!class-type-font_t}. The
    functions it is built on are in {!Ocpangocairo.Raw.Font}. *)

(** The methods, signals and properties of a [PangoCairoFont]. *)
class type font_t = object
  method get_scaled_font : unit -> Occairo.Scaled_font.scaled_font_t option
  method as_font : Raw.Font.t
end

class font : Raw.Font.t -> font_t
(** Wraps a layer 1 handle, {!Ocpangocairo.Raw.Font.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoCairoFont], give one already wrapped. *)
