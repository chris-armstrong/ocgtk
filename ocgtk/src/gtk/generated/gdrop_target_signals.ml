(* Signal handlers for DropTarget *)
class drop_target_signals (obj : Drop_target.t) =
  object
    method on_leave ~callback =
      Gobject.Signal.connect_simple obj ~name:"leave" ~callback ~after:false
    (** Emitted on the drop site when the pointer leaves the widget.

        Its main purpose it to undo things done in
        [signal@Gtk.DropTarget::enter]. *)
  end
