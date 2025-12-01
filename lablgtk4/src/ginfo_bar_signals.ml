(* Signal handlers for InfoBar *)
class info_bar_signals (obj : Info_bar.t) = object
  method close ~callback =
    Gobject.Signal.connect_simple (Info_bar.as_widget obj :> [`widget] Gobject.obj) ~name:"close" ~callback ~after:false

  method response ~callback =
    Gobject.Signal.connect_simple (Info_bar.as_widget obj :> [`widget] Gobject.obj) ~name:"response" ~callback ~after:false

end
