(* Signal handlers for LinkButton *)
class link_button_signals (obj : Link_button.t) = object
  method on_activate_link ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-link" ~callback ~after:false

end
