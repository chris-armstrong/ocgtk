(* Signal handlers for FlowBox *)
class flow_box_signals (obj : Flow_box.t) = object
  (** Emitted when the user activates the @box.

This is a [keybinding signal](class.SignalAction.html). *)
  method on_activate_cursor_child ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-cursor-child" ~callback ~after:false

  (** Emitted to select all children of the box,
if the selection mode permits it.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>. *)
  method on_select_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  (** Emitted when the set of selected children changes.

Use [method@Gtk.FlowBox.selected_foreach] or
[method@Gtk.FlowBox.get_selected_children] to obtain the
selected children. *)
  method on_selected_children_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"selected-children-changed" ~callback ~after:false

  (** Emitted to toggle the selection of the child that has the focus.

This is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>Space</kbd>. *)
  method on_toggle_cursor_child ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-cursor-child" ~callback ~after:false

  (** Emitted to unselect all children of the box,
if the selection mode permits it.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal is <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>. *)
  method on_unselect_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unselect-all" ~callback ~after:false

end
