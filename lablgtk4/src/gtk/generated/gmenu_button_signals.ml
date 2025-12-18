(* Signal handlers for MenuButton *)
class menu_button_signals (obj : Menu_button.t) = object
  (** Emitted to when the menu button is activated.

The `::activate` signal on `GtkMenuButton` is an action signal and
emitting it causes the button to pop up its menu. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
