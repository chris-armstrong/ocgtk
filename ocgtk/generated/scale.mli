class type scale_t = object
  inherit Range.range_t
  method add_mark : float -> Enums.positiontype -> string option -> unit
  method clear_marks : unit -> unit
  method get_digits : unit -> int
  method get_draw_value : unit -> bool
  method get_has_origin : unit -> bool
  method get_layout : unit -> Ocpango.Layout.layout_t option
  method get_value_pos : unit -> Enums.positiontype
  method set_digits : int -> unit
  method set_draw_value : bool -> unit
  method set_has_origin : bool -> unit
  method set_value_pos : Enums.positiontype -> unit
  method as_scale : Raw.Scale.t
end

class scale : Raw.Scale.t -> scale_t

val new_ : Enums.orientation -> Adjustment.adjustment_t option -> scale_t
val new_with_range : Enums.orientation -> float -> float -> float -> scale_t
