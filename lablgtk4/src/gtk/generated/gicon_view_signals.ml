(* Signal handlers for IconView *)
class icon_view_signals (obj : Icon_view.t) = object
  (** A [keybinding signal][class@Gtk.SignalAction]
which gets emitted when the user selects all items.

Applications should not connect to it, but may emit it with
g_signal_emit_by_name() if they need to control selection
programmatically.

The default binding for this signal is Ctrl-a. *)
  method on_select_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  (** A [keybinding signal][class@Gtk.SignalAction]
which gets emitted when the user selects the item that is currently
focused.

Applications should not connect to it, but may emit it with
g_signal_emit_by_name() if they need to control selection
programmatically.

There is no default binding for this signal. *)
  method on_select_cursor_item ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"select-cursor-item" ~callback ~after:false

  (** The ::selection-changed signal is emitted when the selection
(i.e. the set of selected items) changes. *)
  method on_selection_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"selection-changed" ~callback ~after:false

  (** A [keybinding signal][class@Gtk.SignalAction]
which gets emitted when the user toggles whether the currently
focused item is selected or not. The exact effect of this
depend on the selection mode.

Applications should not connect to it, but may emit it with
g_signal_emit_by_name() if they need to control selection
programmatically.

There is no default binding for this signal is Ctrl-Space. *)
  method on_toggle_cursor_item ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-cursor-item" ~callback ~after:false

  (** A [keybinding signal][class@Gtk.SignalAction]
which gets emitted when the user unselects all items.

Applications should not connect to it, but may emit it with
g_signal_emit_by_name() if they need to control selection
programmatically.

The default binding for this signal is Ctrl-Shift-a. *)
  method on_unselect_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unselect-all" ~callback ~after:false

end
