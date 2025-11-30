(* Signal handlers for DropDown *)
class drop_down_signals (obj : Drop_down.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Drop_down.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
