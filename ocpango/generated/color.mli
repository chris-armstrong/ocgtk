(** The [PangoColor] structure is used to represent a color in an uncalibrated
    RGB color-space.

    Its methods, signals and properties are on {!class-type-color_t}. The
    functions it is built on are in {!Ocpango.Raw.Color}. *)

(** The methods, signals and properties of a [PangoColor]. *)
class type color_t = object
  method parse : string -> bool
  (** Fill in the fields of a color from a string specification.

      The string can either one of a large set of standard names. (Taken from
      the CSS Color
      {{:https://www.w3.org/TR/css-color-4/#named-colors}specification}, or it
      can be a value in the form [#rgb], [#rrggbb], [#rrrgggbbb] or
      [#rrrrggggbbbb], where [r], [g] and [b] are hex digits of the red, green,
      and blue components of the color, respectively. (White in the four forms
      is [#fff], [#ffffff], [#fffffffff] and [#ffffffffffff].) *)

  method to_string : unit -> string
  (** Returns a textual specification of [color].

      The string is in the hexadecimal form [#rrrrggggbbbb], where [r], [g] and
      [b] are hex digits representing the red, green, and blue components
      respectively. *)

  method as_color : Raw.Color.t
end

class color : Raw.Color.t -> color_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Color.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoColor], give one already wrapped. *)
