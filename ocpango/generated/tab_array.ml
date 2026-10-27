class type tab_array_t = object
  method get_decimal_point : int -> int
  method get_positions_in_pixels : unit -> bool
  method get_size : unit -> int
  method resize : int -> unit
  method set_decimal_point : int -> int -> unit
  method set_positions_in_pixels : bool -> unit
  method set_tab : int -> Enums.tabalign -> int -> unit
  method sort : unit -> unit
  method to_string : unit -> string
  method as_tab_array : Raw.Tab_array.t
end

(* High-level class for TabArray *)
class tab_array (obj : Raw.Tab_array.t) : tab_array_t =
  object (self)
    method get_decimal_point : int -> int =
      fun tab_index -> Raw.Tab_array.get_decimal_point obj tab_index

    method get_positions_in_pixels : unit -> bool =
      fun () -> Raw.Tab_array.get_positions_in_pixels obj

    method get_size : unit -> int = fun () -> Raw.Tab_array.get_size obj

    method resize : int -> unit =
      fun new_size -> Raw.Tab_array.resize obj new_size

    method set_decimal_point : int -> int -> unit =
      fun tab_index decimal_point ->
        Raw.Tab_array.set_decimal_point obj tab_index decimal_point

    method set_positions_in_pixels : bool -> unit =
      fun positions_in_pixels ->
        Raw.Tab_array.set_positions_in_pixels obj positions_in_pixels

    method set_tab : int -> Enums.tabalign -> int -> unit =
      fun tab_index alignment location ->
        Raw.Tab_array.set_tab obj tab_index alignment location

    method sort : unit -> unit = fun () -> Raw.Tab_array.sort obj
    method to_string : unit -> string = fun () -> Raw.Tab_array.to_string obj
    method as_tab_array = obj
  end

let new_ (initial_size : int) (positions_in_pixels : bool) : tab_array_t =
  let obj_ = Raw.Tab_array.new_ initial_size positions_in_pixels in
  new tab_array obj_
