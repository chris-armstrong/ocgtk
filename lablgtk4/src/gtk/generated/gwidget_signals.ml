(* Signal handlers for Widget *)
class widget_signals (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t) = object
  (** Signals that all holders of a reference to the widget should release
the reference that they hold.

May result in finalization of the widget if all references are released.

This signal is not suitable for saving widget state. *)
  method on_destroy ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"destroy" ~callback ~after:false

  (** Emitted when @widget is hidden. *)
  method on_hide ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"hide" ~callback ~after:false

  (** Emitted when @widget is going to be mapped.

A widget is mapped when the widget is visible (which is controlled with
[property@Gtk.Widget:visible]) and all its parents up to the toplevel widget
are also visible.

The ::map signal can be used to determine whether a widget will be drawn,
for instance it can resume an animation that was stopped during the
emission of [signal@Gtk.Widget::unmap]. *)
  method on_map ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"map" ~callback ~after:false

  (** Emitted when @widget is associated with a `GdkSurface`.

This means that [method@Gtk.Widget.realize] has been called
or the widget has been mapped (that is, it is going to be drawn). *)
  method on_realize ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"realize" ~callback ~after:false

  (** Emitted when @widget is shown. *)
  method on_show ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"show" ~callback ~after:false

  (** Emitted when @widget is going to be unmapped.

A widget is unmapped when either it or any of its parents up to the
toplevel widget have been set as hidden.

As ::unmap indicates that a widget will not be shown any longer,
it can be used to, for example, stop an animation on the widget. *)
  method on_unmap ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unmap" ~callback ~after:false

  (** Emitted when the `GdkSurface` associated with @widget is destroyed.

This means that [method@Gtk.Widget.unrealize] has been called
or the widget has been unmapped (that is, it is going to be hidden). *)
  method on_unrealize ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unrealize" ~callback ~after:false

end
