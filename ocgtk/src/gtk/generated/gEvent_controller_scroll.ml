class type event_controller_scroll_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget.event_controller_t
    method on_decelerate : ?after:bool -> callback:(vel_x:float -> vel_y:float -> unit) -> unit -> Gobject.Signal.handler_id
    method on_scroll : ?after:bool -> callback:(dx:float -> dy:float -> bool) -> unit -> Gobject.Signal.handler_id
    method on_scroll_begin : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method on_scroll_end : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method get_flags : unit -> Gtk_enums.eventcontrollerscrollflags
    method get_unit : unit -> Ocgtk_gdk.Gdk.scrollunit
    method set_flags : Gtk_enums.eventcontrollerscrollflags -> unit
    method as_event_controller_scroll : Event_controller_scroll.t
end

(* High-level class for EventControllerScroll *)
class event_controller_scroll (obj : Event_controller_scroll.t) : event_controller_scroll_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget.event_controller (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget.Event_controller.t)
  method on_decelerate ?(after = false) ~callback () =
    Event_controller_scroll.on_decelerate ~after self#as_event_controller_scroll ~callback

  method on_scroll ?(after = false) ~callback () =
    Event_controller_scroll.on_scroll ~after self#as_event_controller_scroll ~callback

  method on_scroll_begin ?(after = false) ~callback () =
    Event_controller_scroll.on_scroll_begin ~after self#as_event_controller_scroll ~callback

  method on_scroll_end ?(after = false) ~callback () =
    Event_controller_scroll.on_scroll_end ~after self#as_event_controller_scroll ~callback


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

