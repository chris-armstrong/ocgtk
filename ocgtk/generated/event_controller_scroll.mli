class type event_controller_scroll_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_decelerate :
    ?after:bool ->
    callback:(vel_x:float -> vel_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_scroll :
    ?after:bool ->
    callback:(dx:float -> dy:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_scroll_begin :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_scroll_end :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_flags : unit -> Enums.eventcontrollerscrollflags
  method get_unit : unit -> Ocgdk.Enums.scrollunit
  method set_flags : Enums.eventcontrollerscrollflags -> unit
  method as_event_controller_scroll : Raw.Event_controller_scroll.t
end

class event_controller_scroll :
  Raw.Event_controller_scroll.t ->
  event_controller_scroll_t

val new_ : Enums.eventcontrollerscrollflags -> event_controller_scroll_t
