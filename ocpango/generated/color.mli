(** The [PangoColor] structure is used to represent a color in an uncalibrated
    RGB color-space.

    Its methods, signals and properties are on {!class-type-color_t}. The
    functions it is built on are in {!Ocpango.Raw.Color}. *)

(** The methods, signals and properties of a [PangoColor]. *)
class type color_t = object
  method parse : string -> bool
  method to_string : unit -> string
  method as_color : Raw.Color.t
end

class color : Raw.Color.t -> color_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Color.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoColor], give one already wrapped. *)
