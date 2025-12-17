(* Signal handlers for LevelBar *)
class level_bar_signals (obj : Level_bar.t) = object
  method on_offset_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"offset-changed" ~callback ~after:false

end
