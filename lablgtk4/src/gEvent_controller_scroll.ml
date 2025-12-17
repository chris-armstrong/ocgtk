(* Signal class defined in gevent_controller_scroll_signals.ml *)

(* High-level class for EventControllerScroll *)
class event_controller_scroll (obj : Event_controller_scroll.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Event_controller_scroll.as_event_controller obj)
  inherit Gevent_controller_scroll_signals.event_controller_scroll_signals obj

  method get_flags : unit -> Gtk_enums.eventcontrollerscrollflags = fun () -> (Event_controller_scroll.get_flags obj )

  method get_unit : unit -> Gdk.scrollunit = fun () -> (Event_controller_scroll.get_unit obj )

  method set_flags : Gtk_enums.eventcontrollerscrollflags -> unit = fun flags -> (Event_controller_scroll.set_flags obj flags)

  method as_event_controller = (Event_controller_scroll.as_event_controller obj)
    method as_event_controller_scroll = obj
end

