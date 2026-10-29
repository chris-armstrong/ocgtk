class type event_controller_focus_t = object
  inherit Event_controller.event_controller_t

  (** {2:signals Signals} *)

  method on_enter :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever the focus enters into the widget or one of its
      descendents.

      Note that this means you may not get an ::enter signal even though the
      widget becomes the focus location, in certain cases (such as when the
      focus moves from a descendent of the widget to the widget itself). If you
      are interested in these cases, you can monitor the
      [Gtk.EventControllerFocus:is-focus] property for changes. *)

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever the focus leaves the widget hierarchy that is rooted at
      the widget that the controller is attached to.

      Note that this means you may not get a ::leave signal even though the
      focus moves away from the widget, in certain cases (such as when the focus
      moves from the widget to a descendent). If you are interested in these
      cases, you can monitor the [Gtk.EventControllerFocus:is-focus] property
      for changes. *)

  (** {2:methods Methods} *)

  method contains_focus : unit -> bool
  (** Returns [true] if focus is within [self] or one of its children. *)

  method is_focus : unit -> bool
  (** Returns [true] if focus is within [self], but not one of its children. *)

  (** {2:conversions Conversions} *)

  method as_event_controller_focus : Raw.Event_controller_focus.t
end

(* High-level class for EventControllerFocus *)
class event_controller_focus (obj : Raw.Event_controller_focus.t) :
  event_controller_focus_t =
  object (self)
    inherit Event_controller.event_controller (obj :> Raw.Event_controller.t)

    method on_enter ?(after = false) ~callback () =
      Raw.Event_controller_focus.on_enter ~after self#as_event_controller_focus
        ~callback

    method on_leave ?(after = false) ~callback () =
      Raw.Event_controller_focus.on_leave ~after self#as_event_controller_focus
        ~callback

    method contains_focus : unit -> bool =
      fun () -> Raw.Event_controller_focus.contains_focus obj

    method is_focus : unit -> bool =
      fun () -> Raw.Event_controller_focus.is_focus obj

    method as_event_controller_focus = obj
  end

let new_ () : event_controller_focus_t =
  new event_controller_focus (Raw.Event_controller_focus.new_ ())
