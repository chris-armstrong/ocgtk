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

(* High-level class for Color *)
class color (obj : Raw.Color.t) : color_t =
  object (self)
    method parse : string -> bool = fun spec -> Raw.Color.parse obj spec
    method to_string : unit -> string = fun () -> Raw.Color.to_string obj
    method as_color = obj
  end
