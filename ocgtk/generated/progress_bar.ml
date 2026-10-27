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

(* High-level class for ProgressBar *)
class progress_bar (obj : Raw.Progress_bar.t) : progress_bar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode =
      fun () -> Raw.Progress_bar.get_ellipsize obj

    method get_fraction : unit -> float =
      fun () -> Raw.Progress_bar.get_fraction obj

    method get_inverted : unit -> bool =
      fun () -> Raw.Progress_bar.get_inverted obj

    method get_pulse_step : unit -> float =
      fun () -> Raw.Progress_bar.get_pulse_step obj

    method get_show_text : unit -> bool =
      fun () -> Raw.Progress_bar.get_show_text obj

    method get_text : unit -> string option =
      fun () -> Raw.Progress_bar.get_text obj

    method pulse : unit -> unit = fun () -> Raw.Progress_bar.pulse obj

    method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit =
      fun mode -> Raw.Progress_bar.set_ellipsize obj mode

    method set_fraction : float -> unit =
      fun fraction -> Raw.Progress_bar.set_fraction obj fraction

    method set_inverted : bool -> unit =
      fun inverted -> Raw.Progress_bar.set_inverted obj inverted

    method set_pulse_step : float -> unit =
      fun fraction -> Raw.Progress_bar.set_pulse_step obj fraction

    method set_show_text : bool -> unit =
      fun show_text -> Raw.Progress_bar.set_show_text obj show_text

    method set_text : string option -> unit =
      fun text -> Raw.Progress_bar.set_text obj text

    method as_progress_bar = obj
  end

let new_ () : progress_bar_t = new progress_bar (Raw.Progress_bar.new_ ())
