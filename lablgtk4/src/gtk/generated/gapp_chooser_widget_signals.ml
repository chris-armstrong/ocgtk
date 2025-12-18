(* Signal handlers for AppChooserWidget *)
class app_chooser_widget_signals (obj : App_chooser_widget.t) = object
  method on_application_activated ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"application-activated" ~callback ~after:false

  method on_application_selected ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"application-selected" ~callback ~after:false

end
