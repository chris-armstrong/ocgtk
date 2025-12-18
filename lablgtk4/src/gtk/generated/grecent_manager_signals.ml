(* Signal handlers for RecentManager *)
class recent_manager_signals (obj : Recent_manager.t) = object
  (** Emitted when the current recently used resources manager changes
its contents.

This can happen either by calling [method@Gtk.RecentManager.add_item]
or by another application. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

end
