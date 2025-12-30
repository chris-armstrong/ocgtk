(* Signal handlers for ListBoxRow *)
class list_box_row_signals (obj : List_box_row.t) = object
  (** This is a keybinding signal, which will cause this row to be activated.

If you want to be notified when the user activates a row (by key or not),
use the [signal@Gtk.ListBox::row-activated] signal on the row’s parent
`GtkListBox`. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
