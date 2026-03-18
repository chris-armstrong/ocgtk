class progress_bar : Progress_bar.t ->
  object
    method get_ellipsize : unit -> Ocgtk_pango.Pango.ellipsizemode
    method get_fraction : unit -> float
    method get_inverted : unit -> bool
    method get_pulse_step : unit -> float
    method get_show_text : unit -> bool
    method get_text : unit -> string option
    method pulse : unit -> unit
    method set_ellipsize : Ocgtk_pango.Pango.ellipsizemode -> unit
    method set_fraction : float -> unit
    method set_inverted : bool -> unit
    method set_pulse_step : float -> unit
    method set_show_text : bool -> unit
    method set_text : string option -> unit
    method as_progress_bar : Progress_bar.t
  end

