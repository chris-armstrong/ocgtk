(* Signal handlers for IMContext *)
class i_m_context_signals (obj : I_m_context.t) = object
  method commit ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"commit" ~callback ~after:false

  method delete_surrounding ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"delete-surrounding" ~callback ~after:false

  method preedit_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-changed" ~callback ~after:false

  method preedit_end ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-end" ~callback ~after:false

  method preedit_start ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-start" ~callback ~after:false

  method retrieve_surrounding ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"retrieve-surrounding" ~callback ~after:false

end
