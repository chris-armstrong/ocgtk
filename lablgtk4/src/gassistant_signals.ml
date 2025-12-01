(* Signal handlers for Assistant *)
class assistant_signals (obj : Assistant.t) = object
  method apply ~callback =
    Gobject.Signal.connect_simple (Assistant.as_widget obj :> [`widget] Gobject.obj) ~name:"apply" ~callback ~after:false

  method cancel ~callback =
    Gobject.Signal.connect_simple (Assistant.as_widget obj :> [`widget] Gobject.obj) ~name:"cancel" ~callback ~after:false

  method close ~callback =
    Gobject.Signal.connect_simple (Assistant.as_widget obj :> [`widget] Gobject.obj) ~name:"close" ~callback ~after:false

  method escape ~callback =
    Gobject.Signal.connect_simple (Assistant.as_widget obj :> [`widget] Gobject.obj) ~name:"escape" ~callback ~after:false

  method prepare ~callback =
    Gobject.Signal.connect_simple (Assistant.as_widget obj :> [`widget] Gobject.obj) ~name:"prepare" ~callback ~after:false

end
