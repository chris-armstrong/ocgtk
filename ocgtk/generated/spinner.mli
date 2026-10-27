class type spinner_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_spinning : unit -> bool
  method set_spinning : bool -> unit
  method start : unit -> unit
  method stop : unit -> unit
  method as_spinner : Raw.Spinner.t
end

class spinner : Raw.Spinner.t -> spinner_t

val new_ : unit -> spinner_t
