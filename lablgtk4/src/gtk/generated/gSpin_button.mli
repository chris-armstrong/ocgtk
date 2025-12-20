class spin_button : Spin_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gspin_button_signals.spin_button_signals
    method configure : #GAdjustment.adjustment option -> float -> int -> unit
    method get_activates_default : unit -> bool
    method get_adjustment : unit -> GAdjustment.adjustment
    method get_climb_rate : unit -> float
    method get_digits : unit -> int
    method get_numeric : unit -> bool
    method get_snap_to_ticks : unit -> bool
    method get_update_policy : unit -> Gtk_enums.spinbuttonupdatepolicy
    method get_value : unit -> float
    method get_value_as_int : unit -> int
    method get_wrap : unit -> bool
    method set_activates_default : bool -> unit
    method set_adjustment : #GAdjustment.adjustment -> unit
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
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_spin_button : Spin_button.t
  end

