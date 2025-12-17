(* Signal handlers for IconTheme *)
class icon_theme_signals (obj : Icon_theme.t) = object
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

end
