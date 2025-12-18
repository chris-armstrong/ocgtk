(* Signal handlers for IMContext *)
class im_context_signals (obj : Im_context.t) = object
  method on_commit ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"commit" ~callback ~after:false

  method on_delete_surrounding ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"delete-surrounding" ~callback ~after:false

  method on_preedit_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-changed" ~callback ~after:false

  method on_preedit_end ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-end" ~callback ~after:false

  method on_preedit_start ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preedit-start" ~callback ~after:false

  method on_retrieve_surrounding ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"retrieve-surrounding" ~callback ~after:false

end
