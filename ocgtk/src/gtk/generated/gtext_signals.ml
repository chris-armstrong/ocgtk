(* Signal handlers for Text *)
class text_signals (obj : Text.t) = object
  (** Emitted when the user hits the <kbd>Enter</kbd> key.

The default bindings for this signal are all forms
of the <kbd>Enter</kbd> key. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Backspace</kbd> and <kbd>Shift</kbd>+<kbd>Backspace</kbd>. *)
  method on_backspace ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"backspace" ~callback ~after:false

  (** Emitted to copy the selection to the clipboard.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Ctrl</kbd>+<kbd>c</kbd> and
<kbd>Ctrl</kbd>+<kbd>Insert</kbd>. *)
  method on_copy_clipboard ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"copy-clipboard" ~callback ~after:false

  (** Emitted to cut the selection to the clipboard.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Ctrl</kbd>+<kbd>x</kbd> and
<kbd>Shift</kbd>+<kbd>Delete</kbd>. *)
  method on_cut_clipboard ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"cut-clipboard" ~callback ~after:false

  (** Emitted to present the Emoji chooser for the widget.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Ctrl</kbd>+<kbd>.</kbd> and
<kbd>Ctrl</kbd>+<kbd>;</kbd> *)
  method on_insert_emoji ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"insert-emoji" ~callback ~after:false

  (** Emitted to paste the contents of the clipboard.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Ctrl</kbd>+<kbd>v</kbd> and <kbd>Shift</kbd>+<kbd>Insert</kbd>. *)
  method on_paste_clipboard ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"paste-clipboard" ~callback ~after:false

  (** Emitted to toggle the overwrite mode of the `GtkText`.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal is <kbd>Insert</kbd>. *)
  method on_toggle_overwrite ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-overwrite" ~callback ~after:false

end
