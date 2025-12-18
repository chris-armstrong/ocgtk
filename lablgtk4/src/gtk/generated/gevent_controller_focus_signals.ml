(* Signal handlers for EventControllerFocus *)
class event_controller_focus_signals (obj : Event_controller_focus.t) = object
  (** Emitted whenever the focus enters into the widget or one
of its descendents.

Note that this means you may not get an ::enter signal
even though the widget becomes the focus location, in
certain cases (such as when the focus moves from a descendent
of the widget to the widget itself). If you are interested
in these cases, you can monitor the
[property@Gtk.EventControllerFocus:is-focus]
property for changes. *)
  method on_enter ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"enter" ~callback ~after:false

  (** Emitted whenever the focus leaves the widget hierarchy
that is rooted at the widget that the controller is attached to.

Note that this means you may not get a ::leave signal
even though the focus moves away from the widget, in
certain cases (such as when the focus moves from the widget
to a descendent). If you are interested in these cases, you
can monitor the [property@Gtk.EventControllerFocus:is-focus]
property for changes. *)
  method on_leave ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"leave" ~callback ~after:false

end
