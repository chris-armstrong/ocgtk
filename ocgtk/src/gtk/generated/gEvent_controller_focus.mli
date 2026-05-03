class type event_controller_focus_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .event_controller_t

  method on_enter : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_leave : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method contains_focus : unit -> bool
  method is_focus : unit -> bool
  method as_event_controller_focus : Event_controller_focus.t
end

class event_controller_focus :
  Event_controller_focus.t ->
  event_controller_focus_t

val new_ : unit -> event_controller_focus_t
