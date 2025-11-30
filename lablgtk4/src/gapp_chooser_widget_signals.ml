(* Signal handlers for AppChooserWidget *)
class app_chooser_widget_signals (obj : App_chooser_widget.t) = object
  method application_activated ~callback =
    Gobject.Signal.connect_simple (App_chooser_widget.as_widget obj :> [`widget] Gobject.obj) ~name:"application-activated" ~callback ~after:false

  method application_selected ~callback =
    Gobject.Signal.connect_simple (App_chooser_widget.as_widget obj :> [`widget] Gobject.obj) ~name:"application-selected" ~callback ~after:false

end
