class progress_bar : Progress_bar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method fraction : float
    method set_fraction : float -> unit
    method inverted : bool
    method set_inverted : bool -> unit
    method pulse_step : float
    method set_pulse_step : float -> unit
    method show_text : bool
    method set_show_text : bool -> unit
    method text : string
    method set_text : string -> unit
    method get_ellipsize : unit -> Pango.ellipsizemode
    method pulse : unit -> unit
    method set_ellipsize : Pango.ellipsizemode -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_progress_bar : Progress_bar.t
  end

