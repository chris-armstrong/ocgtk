(* GENERATED CODE - DO NOT EDIT *)
(* Color: Color *)

(** The `PangoColor` structure is used to
represent a color in an uncalibrated RGB color-space. *)
type t = [`color] Gobject.obj

(* Methods *)
(** Returns a textual specification of @color.

The string is in the hexadecimal form `#rrrrggggbbbb`,
where `r`, `g` and `b` are hex digits representing the
red, green, and blue components respectively. *)
external to_string : t -> string = "ml_pango_color_to_string"

(** Fill in the fields of a color from a string specification.

The string can either one of a large set of standard names.
(Taken from the CSS Color [specification](https://www.w3.org/TR/css-color-4/#named-colors),
or it can be a value in the form `#rgb`, `#rrggbb`,
`#rrrgggbbb` or `#rrrrggggbbbb`, where `r`, `g` and `b`
are hex digits of the red, green, and blue components
of the color, respectively. (White in the four forms is
`#fff`, `#ffffff`, `#fffffffff` and `#ffffffffffff`.) *)
external parse : t -> string -> bool = "ml_pango_color_parse"

(** Frees a color allocated by [method@Pango.Color.copy]. *)
external free : t -> unit = "ml_pango_color_free"

(** Creates a copy of @src.

The copy should be freed with [method@Pango.Color.free].
Primarily used by language bindings, not that useful
otherwise (since colors can just be copied by assignment
in C). *)
external copy : t -> t option = "ml_pango_color_copy"

