(* Signal handlers for GLArea *)
class g_l_area_signals (obj : G_l_area.t) = object
  method create_context ~callback =
    Gobject.Signal.connect_simple (G_l_area.as_widget obj :> [`widget] Gobject.obj) ~name:"create-context" ~callback ~after:false

  method render ~callback =
    Gobject.Signal.connect_simple (G_l_area.as_widget obj :> [`widget] Gobject.obj) ~name:"render" ~callback ~after:false

  method resize ~callback =
    Gobject.Signal.connect_simple (G_l_area.as_widget obj :> [`widget] Gobject.obj) ~name:"resize" ~callback ~after:false

end
