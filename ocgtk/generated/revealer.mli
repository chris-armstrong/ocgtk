class type revealer_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_child_revealed : unit -> bool
  method get_reveal_child : unit -> bool
  method get_transition_duration : unit -> int
  method get_transition_type : unit -> Enums.revealertransitiontype

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_reveal_child : bool -> unit
  method set_transition_duration : int -> unit
  method set_transition_type : Enums.revealertransitiontype -> unit
  method as_revealer : Raw.Revealer.t
end

class revealer : Raw.Revealer.t -> revealer_t

val new_ : unit -> revealer_t
