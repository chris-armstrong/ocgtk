(* Signal handlers for ATContext *)
class at_context_signals (obj : At_context_and__accessible.At_context.t) =
  object
    method on_state_change ~callback =
      Gobject.Signal.connect_simple obj ~name:"state-change" ~callback
        ~after:false
    (** Emitted when the attributes of the accessible for the `GtkATContext`
        instance change. *)
  end
