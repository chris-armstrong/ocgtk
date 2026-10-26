class type progress_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t
  method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode
  method get_fraction : unit -> float
  method get_inverted : unit -> bool
  method get_pulse_step : unit -> float
  method get_show_text : unit -> bool
  method get_text : unit -> string option
  method pulse : unit -> unit
  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  method set_fraction : float -> unit
  method set_inverted : bool -> unit
  method set_pulse_step : float -> unit
  method set_show_text : bool -> unit
  method set_text : string option -> unit
  method as_progress_bar : Raw.Progress_bar.t
end

class progress_bar : Raw.Progress_bar.t -> progress_bar_t

val new_ : unit -> progress_bar_t
