(* Signal handlers for MenuButton *)
class menu_button_signals (obj : Menu_button.t) =
  object
    method on_activate ~callback =
      Gobject.Signal.connect_simple obj ~name:"activate" ~callback ~after:false
    (** Emitted to when the menu button is activated.

        The `::activate` signal on `GtkMenuButton` is an action signal and
        emitting it causes the button to pop up its menu. *)
  end
