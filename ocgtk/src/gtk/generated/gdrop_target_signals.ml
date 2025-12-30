(* Signal handlers for DropTarget *)
class drop_target_signals (obj : Drop_target.t) = object
  (** Emitted on the drop site when the pointer leaves the widget.

Its main purpose it to undo things done in
[signal@Gtk.DropTarget::enter]. *)
  method on_leave ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"leave" ~callback ~after:false

end
