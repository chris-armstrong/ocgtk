(* Signal handlers for ATContext *)
class at_context_signals (obj : At_context_and__accessible.At_context.t) = object
  method on_state_change ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"state-change" ~callback ~after:false

end
