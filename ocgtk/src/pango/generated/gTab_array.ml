(* High-level class for TabArray *)
class tab_array (obj : Tab_array.t) = object (self)

  method copy : unit -> Tab_array.t =
    fun () ->
      (Tab_array.copy obj)

  method free : unit -> unit =
    fun () ->
      (Tab_array.free obj)

  method get_positions_in_pixels : unit -> bool =
    fun () ->
      (Tab_array.get_positions_in_pixels obj)

  method get_size : unit -> int =
    fun () ->
      (Tab_array.get_size obj)

  method resize : int -> unit =
    fun new_size ->
      (Tab_array.resize obj new_size)

  method set_positions_in_pixels : bool -> unit =
    fun positions_in_pixels ->
      (Tab_array.set_positions_in_pixels obj positions_in_pixels)

  method set_tab : int -> Pango_enums.tabalign -> int -> unit =
    fun tab_index alignment location ->
      (Tab_array.set_tab obj tab_index alignment location)

  method sort : unit -> unit =
    fun () ->
      (Tab_array.sort obj)

  method to_string : unit -> string =
    fun () ->
      (Tab_array.to_string obj)

    method as_tab_array = obj
end

