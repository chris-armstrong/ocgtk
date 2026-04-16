class type spin_button_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GAccessible_range.accessible_range_t
  inherit GCell_editable.cell_editable_t
  inherit GEditable.editable_t
  inherit GOrientable.orientable_t
  inherit Gspin_button_signals.spin_button_signals
  method configure : GAdjustment.adjustment_t option -> float -> int -> unit
  method get_activates_default : unit -> bool
  method get_adjustment : unit -> GAdjustment.adjustment_t
  method get_climb_rate : unit -> float
  method get_digits : unit -> int
  method get_numeric : unit -> bool
  method get_snap_to_ticks : unit -> bool
  method get_update_policy : unit -> Gtk_enums.spinbuttonupdatepolicy
  method get_value : unit -> float
  method get_value_as_int : unit -> int
  method get_wrap : unit -> bool
  method set_activates_default : bool -> unit
  method set_adjustment : GAdjustment.adjustment_t -> unit
  method set_climb_rate : float -> unit
  method set_digits : int -> unit
  method set_increments : float -> float -> unit
  method set_numeric : bool -> unit
  method set_range : float -> float -> unit
  method set_snap_to_ticks : bool -> unit
  method set_update_policy : Gtk_enums.spinbuttonupdatepolicy -> unit
  method set_value : float -> unit
  method set_wrap : bool -> unit
  method spin : Gtk_enums.spintype -> float -> unit
  method update : unit -> unit
  method as_spin_button : Spin_button.t
end

class spin_button : Spin_button.t -> spin_button_t

val new_ : GAdjustment.adjustment_t option -> float -> int -> spin_button_t
val new_with_range : float -> float -> float -> spin_button_t
