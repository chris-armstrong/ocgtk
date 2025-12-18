(* Signal handlers for TextBuffer *)
class text_buffer_signals (obj : Text_buffer_and__text_iter_and__text_mark.Text_buffer.t) = object
  (** Emitted at the beginning of a single user-visible
operation on a `GtkTextBuffer`.

See also:
[method@Gtk.TextBuffer.begin_user_action],
[method@Gtk.TextBuffer.insert_interactive],
[method@Gtk.TextBuffer.insert_range_interactive],
[method@Gtk.TextBuffer.delete_interactive],
[method@Gtk.TextBuffer.backspace],
[method@Gtk.TextBuffer.delete_selection]. *)
  method on_begin_user_action ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"begin-user-action" ~callback ~after:false

  (** Emitted when the content of a `GtkTextBuffer` has changed. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  (** Emitted at the end of a single user-visible
operation on the `GtkTextBuffer`.

See also:
[method@Gtk.TextBuffer.end_user_action],
[method@Gtk.TextBuffer.insert_interactive],
[method@Gtk.TextBuffer.insert_range_interactive],
[method@Gtk.TextBuffer.delete_interactive],
[method@Gtk.TextBuffer.backspace],
[method@Gtk.TextBuffer.delete_selection],
[method@Gtk.TextBuffer.backspace]. *)
  method on_end_user_action ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"end-user-action" ~callback ~after:false

  (** Emitted when the modified bit of a `GtkTextBuffer` flips.

See also: [method@Gtk.TextBuffer.set_modified]. *)
  method on_modified_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"modified-changed" ~callback ~after:false

  (** Emitted when a request has been made to redo the
previously undone operation. *)
  method on_redo ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"redo" ~callback ~after:false

  (** Emitted when a request has been made to undo the
previous operation or set of operations that have
been grouped together. *)
  method on_undo ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"undo" ~callback ~after:false

end
