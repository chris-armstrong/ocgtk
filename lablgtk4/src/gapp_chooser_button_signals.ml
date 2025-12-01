(* Signal handlers for AppChooserButton *)
class app_chooser_button_signals (obj : App_chooser_button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (App_chooser_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method changed ~callback =
    Gobject.Signal.connect_simple (App_chooser_button.as_widget obj :> [`widget] Gobject.obj) ~name:"changed" ~callback ~after:false

  method custom_item_activated ~callback =
    Gobject.Signal.connect_simple (App_chooser_button.as_widget obj :> [`widget] Gobject.obj) ~name:"custom-item-activated" ~callback ~after:false

end
