(** [PangoCairoFontMap] is an interface exported by font maps for use with
    Cairo.

    The actual type of the font map will depend on the particular font
    technology Cairo was compiled to use.

    Its methods, signals and properties are on {!class-type-font_map_t}. The
    functions it is built on are in {!Ocpangocairo.Raw.Font_map}. *)

(** The methods, signals and properties of a [PangoCairoFontMap]. *)
class type font_map_t = object
  method get_font_type : unit -> Occairo.Enums.fonttype
  method get_resolution : unit -> float
  method set_default : unit -> unit
  method set_resolution : float -> unit
  method as_font_map : Raw.Font_map.t
end

class font_map : Raw.Font_map.t -> font_map_t
(** Wraps a layer 1 handle, {!Ocpangocairo.Raw.Font_map.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoCairoFontMap], give one already wrapped. *)
