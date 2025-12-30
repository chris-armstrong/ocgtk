(* Signal handlers for IMContext *)
class im_context_signals (obj : Im_context.t) = object
  (** The ::preedit-changed signal is emitted whenever the preedit sequence
currently being entered has changed.

It is also emitted at the end of a preedit sequence, in which case
[method@Gtk.IMContext.get_preedit_string] returns the empty string. *)
  method on_preedit_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-changed" ~callback ~after:false

  (** The ::preedit-end signal is emitted when a preediting sequence
has been completed or canceled. *)
  method on_preedit_end ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-end" ~callback ~after:false

  (** The ::preedit-start signal is emitted when a new preediting sequence
starts. *)
  method on_preedit_start ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-start" ~callback ~after:false

end
