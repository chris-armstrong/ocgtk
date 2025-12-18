class progress_bar : Progress_bar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_ellipsize : unit -> Pango.ellipsizemode
    method get_fraction : unit -> float
    method get_inverted : unit -> bool
    method get_pulse_step : unit -> float
    method get_show_text : unit -> bool
    method get_text : unit -> string option
    method pulse : unit -> unit
    method set_ellipsize : Pango.ellipsizemode -> unit
    method set_fraction : float -> unit
    method set_inverted : bool -> unit
    method set_pulse_step : float -> unit
    method set_show_text : bool -> unit
    method set_text : string option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_progress_bar : Progress_bar.t
  end

