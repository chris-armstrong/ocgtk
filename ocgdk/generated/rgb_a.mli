(** Represents a color, in a way that is compatible with cairo’s notion of
    color.

    [GdkRGBA] is a convenient way to pass colors around. It’s based on cairo’s
    way to deal with colors and mirrors its behavior. All values are in the
    range from 0.0 to 1.0 inclusive. So the color (0.0, 0.0, 0.0, 0.0)
    represents transparent black and (1.0, 1.0, 1.0, 1.0) is opaque white. Other
    values will be clamped to this range when drawing.

    Its methods, signals and properties are on {!class-type-rgb_a_t}. The
    functions it is built on are in {!Ocgdk.Raw.Rgb_a}. *)

(** The methods, signals and properties of a [GdkRGBA]. *)
class type rgb_a_t = object
  method equal : Raw.Rgb_a.t -> bool
  method hash : unit -> int
  method is_clear : unit -> bool
  method is_opaque : unit -> bool
  method parse : string -> bool
  method to_string : unit -> string
  method as_rgb_a : Raw.Rgb_a.t
end

class rgb_a : Raw.Rgb_a.t -> rgb_a_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Rgb_a.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkRGBA], give one already wrapped. *)
