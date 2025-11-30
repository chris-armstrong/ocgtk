(* Signal handlers for Entry *)
class entry_signals (obj : Entry.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Entry.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method icon_press ~callback =
    Gobject.Signal.connect_simple (Entry.as_widget obj :> [`widget] Gobject.obj) ~name:"icon-press" ~callback ~after:false

  method icon_release ~callback =
    Gobject.Signal.connect_simple (Entry.as_widget obj :> [`widget] Gobject.obj) ~name:"icon-release" ~callback ~after:false

end
