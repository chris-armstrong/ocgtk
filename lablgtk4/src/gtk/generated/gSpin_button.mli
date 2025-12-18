class spin_button : Spin_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gspin_button_signals.spin_button_signals
    method activates_default : bool
    method set_activates_default : bool -> unit
    method climb_rate : float
    method set_climb_rate : float -> unit
    method digits : int
    method set_digits : int -> unit
    method numeric : bool
    method set_numeric : bool -> unit
    method snap_to_ticks : bool
    method set_snap_to_ticks : bool -> unit
    method value : float
    method set_value : float -> unit
    method wrap : bool
    method set_wrap : bool -> unit
    method configure : #GAdjustment.adjustment option -> float -> int -> unit
    method get_adjustment : unit -> GAdjustment.adjustment
    method get_update_policy : unit -> Gtk_enums.spinbuttonupdatepolicy
    method get_value_as_int : unit -> int
    method set_adjustment : #GAdjustment.adjustment -> unit
    method set_increments : float -> float -> unit
    method set_range : float -> float -> unit
    method set_update_policy : Gtk_enums.spinbuttonupdatepolicy -> unit
    method spin : Gtk_enums.spintype -> float -> unit
    method update : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_spin_button : Spin_button.t
  end

