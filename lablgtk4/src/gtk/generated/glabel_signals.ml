(* Signal handlers for Label *)
class label_signals (obj : Label.t) = object
  (** Gets emitted when the user activates a link in the label.

The ::activate-current-link is a [keybinding signal](class.SignalAction.html).

Applications may also emit the signal with g_signal_emit_by_name()
if they need to control activation of URIs programmatically.

The default bindings for this signal are all forms of the <kbd>Enter</kbd> key. *)
  method on_activate_current_link ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-current-link" ~callback ~after:false

  (** Gets emitted to copy the selection to the clipboard.

The ::copy-clipboard signal is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is <kbd>Ctrl</kbd>+<kbd>c</kbd>. *)
  method on_copy_clipboard ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"copy-clipboard" ~callback ~after:false

end
