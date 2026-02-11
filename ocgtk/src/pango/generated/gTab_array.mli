class tab_array : Tab_array.t ->
  object
    method copy : unit -> Tab_array.t
    method free : unit -> unit
    method get_positions_in_pixels : unit -> bool
    method get_size : unit -> int
    method resize : int -> unit
    method set_positions_in_pixels : bool -> unit
    method set_tab : int -> Pango_enums.tabalign -> int -> unit
    method sort : unit -> unit
    method to_string : unit -> string
    method as_tab_array : Tab_array.t
  end

