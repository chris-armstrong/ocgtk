(** A [PangoTabArray] contains an array of tab stops.

    [PangoTabArray] can be used to set tab stops in a [PangoLayout]. Each tab
    stop has an alignment, a position, and optionally a character to use as
    decimal point.

    Its methods, signals and properties are on {!class-type-tab_array_t}. The
    functions it is built on are in {!Ocpango.Raw.Tab_array}. *)

(** The methods, signals and properties of a [PangoTabArray]. *)
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

class tab_array : Raw.Tab_array.t -> tab_array_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Tab_array.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoTabArray], give one already wrapped. *)

val new_ : int -> bool -> tab_array_t
