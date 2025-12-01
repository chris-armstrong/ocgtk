(* Signal handlers for ColorChooser *)
class color_chooser_signals (obj : Color_chooser.t) = object
  method color_activated ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"color-activated" ~callback ~after:false

end
