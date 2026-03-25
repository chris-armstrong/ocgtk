(* Signal class defined in gevent_controller_scroll_signals.ml *)

class type event_controller_scroll_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Gevent_controller_scroll_signals.event_controller_scroll_signals
    method get_flags : unit -> Gtk_enums.eventcontrollerscrollflags
    method get_unit : unit -> Ocgtk_gdk.Gdk.scrollunit
    method set_flags : Gtk_enums.eventcontrollerscrollflags -> unit
    method as_event_controller_scroll : Event_controller_scroll.t
end

(* High-level class for EventControllerScroll *)
class event_controller_scroll (obj : Event_controller_scroll.t) : event_controller_scroll_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t)
  inherit Gevent_controller_scroll_signals.event_controller_scroll_signals obj

  method get_flags : unit -> Gtk_enums.eventcontrollerscrollflags =
    fun () ->
      (Event_controller_scroll.get_flags obj)

  method get_unit : unit -> Ocgtk_gdk.Gdk.scrollunit =
    fun () ->
      (Event_controller_scroll.get_unit obj)

  method set_flags : Gtk_enums.eventcontrollerscrollflags -> unit =
    fun flags ->
      (Event_controller_scroll.set_flags obj flags)

    method as_event_controller_scroll = obj
end

let new_ (flags : Gtk_enums.eventcontrollerscrollflags) : event_controller_scroll_t =
  let obj_ = Event_controller_scroll.new_ flags in
  new event_controller_scroll obj_

