(* Signal handlers for TextView *)
class text_view_signals (obj : Text_view.t) = object
  (** Gets emitted when the user asks for it.

The ::backspace signal is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Backspace</kbd> and <kbd>Shift</kbd>+<kbd>Backspace</kbd>. *)
  method on_backspace ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"backspace" ~callback ~after:false

  (** Gets emitted to copy the selection to the clipboard.

The ::copy-clipboard signal is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Ctrl</kbd>+<kbd>c</kbd> and
<kbd>Ctrl</kbd>+<kbd>Insert</kbd>. *)
  method on_copy_clipboard ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"copy-clipboard" ~callback ~after:false

  (** Gets emitted to cut the selection to the clipboard.

The ::cut-clipboard signal is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Ctrl</kbd>+<kbd>x</kbd> and
<kbd>Shift</kbd>+<kbd>Delete</kbd>. *)
  method on_cut_clipboard ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"cut-clipboard" ~callback ~after:false

  (** Gets emitted to present the Emoji chooser for the @text_view.

The ::insert-emoji signal is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Ctrl</kbd>+<kbd>.</kbd> and
<kbd>Ctrl</kbd>+<kbd>;</kbd> *)
  method on_insert_emoji ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"insert-emoji" ~callback ~after:false

  (** Gets emitted to paste the contents of the clipboard
into the text view.

The ::paste-clipboard signal is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are
<kbd>Ctrl</kbd>+<kbd>v</kbd> and
<kbd>Shift</kbd>+<kbd>Insert</kbd>. *)
  method on_paste_clipboard ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"paste-clipboard" ~callback ~after:false

  (** Gets emitted when the user initiates settings the "anchor" mark.

The ::set-anchor signal is a [keybinding signal](class.SignalAction.html)
which gets emitted when the user initiates setting the "anchor"
mark. The "anchor" mark gets placed at the same position as the
"insert" mark.

This signal has no default bindings. *)
  method on_set_anchor ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"set-anchor" ~callback ~after:false

  (** Gets emitted to toggle the `cursor-visible` property.

The ::toggle-cursor-visible signal is a
[keybinding signal](class.SignalAction.html).

The default binding for this signal is <kbd>F7</kbd>. *)
  method on_toggle_cursor_visible ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-cursor-visible" ~callback ~after:false

  (** Gets emitted to toggle the overwrite mode of the text view.

The ::toggle-overwrite signal is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is <kbd>Insert</kbd>. *)
  method on_toggle_overwrite ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-overwrite" ~callback ~after:false

end
