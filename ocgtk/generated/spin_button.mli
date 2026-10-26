class type spin_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Cell_editable.cell_editable_t
  inherit Editable.editable_t
  inherit Orientable.orientable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_change_value :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_output :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_wrapped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method configure : Adjustment.adjustment_t option -> float -> int -> unit
  method get_activates_default : unit -> bool
  method get_adjustment : unit -> Adjustment.adjustment_t
  method get_climb_rate : unit -> float
  method get_digits : unit -> int
  method get_numeric : unit -> bool
  method get_snap_to_ticks : unit -> bool
  method get_update_policy : unit -> Enums.spinbuttonupdatepolicy
  method get_value : unit -> float
  method get_value_as_int : unit -> int
  method get_wrap : unit -> bool
  method set_activates_default : bool -> unit
  method set_adjustment : Adjustment.adjustment_t -> unit
  method set_climb_rate : float -> unit
  method set_digits : int -> unit
  method set_increments : float -> float -> unit
  method set_numeric : bool -> unit
  method set_range : float -> float -> unit
  method set_snap_to_ticks : bool -> unit
  method set_update_policy : Enums.spinbuttonupdatepolicy -> unit
  method set_value : float -> unit
  method set_wrap : bool -> unit
  method spin : Enums.spintype -> float -> unit
  method update : unit -> unit
  method as_spin_button : Raw.Spin_button.t
end

class spin_button : Raw.Spin_button.t -> spin_button_t

val new_ : Adjustment.adjustment_t option -> float -> int -> spin_button_t
val new_with_range : float -> float -> float -> spin_button_t
