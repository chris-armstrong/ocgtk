(* Signal handlers for LinkButton *)
class link_button_signals (obj : Link_button.t) = object
  method activate_link ~callback =
    Gobject.Signal.connect_simple (Link_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate-link" ~callback ~after:false

end
