class type tab_array_t = object
  method copy : unit -> Tab_array.t
  method free : unit -> unit
  method get_decimal_point : int -> int
  method get_positions_in_pixels : unit -> bool
  method get_size : unit -> int
  method resize : int -> unit
  method set_decimal_point : int -> int -> unit
  method set_positions_in_pixels : bool -> unit
  method set_tab : int -> Pango_enums.tabalign -> int -> unit
  method sort : unit -> unit
  method to_string : unit -> string
  method as_tab_array : Tab_array.t
end

class tab_array : Tab_array.t -> tab_array_t

val new_ : int -> bool -> tab_array_t
