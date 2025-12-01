(* Signal handlers for LevelBar *)
class level_bar_signals (obj : Level_bar.t) = object
  method offset_changed ~callback =
    Gobject.Signal.connect_simple (Level_bar.as_widget obj :> [`widget] Gobject.obj) ~name:"offset-changed" ~callback ~after:false

end
