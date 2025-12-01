(* Signal handlers for Button *)
class button_signals (obj : Button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method clicked ~callback =
    Gobject.Signal.connect_simple (Button.as_widget obj :> [`widget] Gobject.obj) ~name:"clicked" ~callback ~after:false

end
