class type spinner_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method get_spinning : unit -> bool
  method set_spinning : bool -> unit
  method start : unit -> unit
  method stop : unit -> unit
  method as_spinner : Spinner.t
end

class spinner : Spinner.t -> spinner_t

val new_ : unit -> spinner_t
