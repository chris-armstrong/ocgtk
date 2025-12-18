(* High-level class for ProgressBar *)
class progress_bar (obj : Progress_bar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Progress_bar.as_widget obj)

  method fraction = Progress_bar.get_fraction obj
  method set_fraction v = Progress_bar.set_fraction obj v

  method inverted = Progress_bar.get_inverted obj
  method set_inverted v = Progress_bar.set_inverted obj v

  method pulse_step = Progress_bar.get_pulse_step obj
  method set_pulse_step v = Progress_bar.set_pulse_step obj v

  method show_text = Progress_bar.get_show_text obj
  method set_show_text v = Progress_bar.set_show_text obj v

  method text = Progress_bar.get_text obj
  method set_text v = Progress_bar.set_text obj v

  method get_ellipsize : unit -> Pango.ellipsizemode = fun () -> (Progress_bar.get_ellipsize obj )

  method pulse : unit -> unit = fun () -> (Progress_bar.pulse obj )

  method set_ellipsize : Pango.ellipsizemode -> unit = fun mode -> (Progress_bar.set_ellipsize obj mode)

  method as_widget = (Progress_bar.as_widget obj)
    method as_progress_bar = obj
end

