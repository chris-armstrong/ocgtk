(* Signal handlers for ListBox *)
class list_box_signals (obj : List_box.t) = object
  method on_activate_cursor_row ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-cursor-row" ~callback ~after:false

  (** Emitted to select all children of the box, if the selection
mode permits it.

This is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>. *)
  method on_select_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  (** Emitted when the set of selected rows changes. *)
  method on_selected_rows_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"selected-rows-changed" ~callback ~after:false

  method on_toggle_cursor_row ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-cursor-row" ~callback ~after:false

  (** Emitted to unselect all children of the box, if the selection
mode permits it.

This is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is
<kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>. *)
  method on_unselect_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unselect-all" ~callback ~after:false

end
