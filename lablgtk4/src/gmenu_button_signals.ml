(* Signal handlers for MenuButton *)
class menu_button_signals (obj : Menu_button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Menu_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
