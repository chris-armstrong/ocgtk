class type event_controller_scroll_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .event_controller_t

  method on_decelerate :
    callback:(vel_x:float -> vel_y:float -> unit) -> Gobject.Signal.handler_id

  method on_scroll :
    callback:(dx:float -> dy:float -> bool) -> Gobject.Signal.handler_id

  method on_scroll_begin : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_scroll_end : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_flags : unit -> Gtk_enums.eventcontrollerscrollflags
  method get_unit : unit -> Ocgtk_gdk.Gdk.scrollunit
  method set_flags : Gtk_enums.eventcontrollerscrollflags -> unit
  method as_event_controller_scroll : Event_controller_scroll.t
end

class event_controller_scroll :
  Event_controller_scroll.t ->
  event_controller_scroll_t

val new_ : Gtk_enums.eventcontrollerscrollflags -> event_controller_scroll_t
