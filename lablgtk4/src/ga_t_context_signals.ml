(* Signal handlers for ATContext *)
class a_t_context_signals (obj : A_t_context.t) = object
  method state_change ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"state-change" ~callback ~after:false

end
