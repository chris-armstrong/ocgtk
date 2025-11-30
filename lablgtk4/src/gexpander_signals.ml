(* Signal handlers for Expander *)
class expander_signals (obj : Expander.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Expander.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
