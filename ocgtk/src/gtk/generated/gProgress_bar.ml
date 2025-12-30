(* High-level class for ProgressBar *)
class progress_bar (obj : Progress_bar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Progress_bar.as_widget obj)

  method get_fraction : unit -> float =
    fun () ->
      (Progress_bar.get_fraction obj)

  method get_inverted : unit -> bool =
    fun () ->
      (Progress_bar.get_inverted obj)

  method get_pulse_step : unit -> float =
    fun () ->
      (Progress_bar.get_pulse_step obj)

  method get_show_text : unit -> bool =
    fun () ->
      (Progress_bar.get_show_text obj)

  method get_text : unit -> string option =
    fun () ->
      (Progress_bar.get_text obj)

  method pulse : unit -> unit =
    fun () ->
      (Progress_bar.pulse obj)

  method set_fraction : float -> unit =
    fun fraction ->
      (Progress_bar.set_fraction obj fraction)

  method set_inverted : bool -> unit =
    fun inverted ->
      (Progress_bar.set_inverted obj inverted)

  method set_pulse_step : float -> unit =
    fun fraction ->
      (Progress_bar.set_pulse_step obj fraction)

  method set_show_text : bool -> unit =
    fun show_text ->
      (Progress_bar.set_show_text obj show_text)

  method set_text : string option -> unit =
    fun text ->
      (Progress_bar.set_text obj text)

  method as_widget = (Progress_bar.as_widget obj)
    method as_progress_bar = obj
end

