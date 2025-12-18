(* Signal handlers for GLArea *)
class gl_area_signals (obj : Gl_area.t) = object
  method on_create_context ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"create-context" ~callback ~after:false

  method on_render ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"render" ~callback ~after:false

  method on_resize ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"resize" ~callback ~after:false

end
