(* Signal handlers for DropDown *)
class drop_down_signals (obj : Drop_down.t) = object
  (** Emitted to when the drop down is activated.

The `::activate` signal on `GtkDropDown` is an action signal and
emitting it causes the drop down to pop up its dropdown. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
