class type event_controller_legacy_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_event :
    ?after:bool ->
    callback:(event:Ocgtk_gdk.Gdk.Event.event_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method as_event_controller_legacy : Event_controller_legacy.t
end

class event_controller_legacy :
  Event_controller_legacy.t ->
  event_controller_legacy_t

val new_ : unit -> event_controller_legacy_t
