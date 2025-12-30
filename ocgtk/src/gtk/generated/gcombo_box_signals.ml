(* Signal handlers for ComboBox *)
class combo_box_signals (obj : Combo_box.t) = object
  (** Emitted to when the combo box is activated.

The `::activate` signal on `GtkComboBox` is an action signal and
emitting it causes the combo box to pop up its dropdown. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  (** Emitted when the active item is changed.

The can be due to the user selecting a different item from the list,
or due to a call to [method@Gtk.ComboBox.set_active_iter]. It will
also be emitted while typing into the entry of a combo box with an entry. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"changed" ~callback ~after:false

  (** Emitted to popup the combo box list.

This is an [keybinding signal](class.SignalAction.html).

The default binding for this signal is Alt+Down. *)
  method on_popup ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"popup" ~callback ~after:false

end
