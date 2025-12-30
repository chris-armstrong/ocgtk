(* Signal handlers for ATContext *)
class at_context_signals (obj : At_context_and__accessible.At_context.t) = object
  (** Emitted when the attributes of the accessible for the
`GtkATContext` instance change. *)
  method on_state_change ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"state-change" ~callback ~after:false

end
