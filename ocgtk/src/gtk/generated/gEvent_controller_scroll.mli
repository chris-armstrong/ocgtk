class type event_controller_scroll_t = object
    inherit Gevent_controller_scroll_signals.event_controller_scroll_signals
    method get_flags : unit -> Gtk_enums.eventcontrollerscrollflags
    method get_unit : unit -> Ocgtk_gdk.Gdk.scrollunit
    method set_flags : Gtk_enums.eventcontrollerscrollflags -> unit
    method as_event_controller_scroll : Event_controller_scroll.t
end

class event_controller_scroll : Event_controller_scroll.t -> event_controller_scroll_t

