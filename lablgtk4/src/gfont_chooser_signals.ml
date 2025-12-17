(* Signal handlers for FontChooser *)
class font_chooser_signals (obj : Font_chooser.t) = object
  method on_font_activated ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"font-activated" ~callback ~after:false

end
