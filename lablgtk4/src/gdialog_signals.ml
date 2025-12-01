(* Signal handlers for Dialog *)
class dialog_signals (obj : Dialog.t) = object
  method close ~callback =
    Gobject.Signal.connect_simple (Dialog.as_widget obj :> [`widget] Gobject.obj) ~name:"close" ~callback ~after:false

  method response ~callback =
    Gobject.Signal.connect_simple (Dialog.as_widget obj :> [`widget] Gobject.obj) ~name:"response" ~callback ~after:false

end
