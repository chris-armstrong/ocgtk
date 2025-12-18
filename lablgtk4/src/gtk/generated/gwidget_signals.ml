(* Signal handlers for Widget *)
class widget_signals (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t) = object
  method on_destroy ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"destroy" ~callback ~after:false

  method on_direction_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"direction-changed" ~callback ~after:false

  method on_hide ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"hide" ~callback ~after:false

  method on_keynav_failed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"keynav-failed" ~callback ~after:false

  method on_map ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"map" ~callback ~after:false

  method on_mnemonic_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"mnemonic-activate" ~callback ~after:false

  method on_move_focus ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"move-focus" ~callback ~after:false

  method on_query_tooltip ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"query-tooltip" ~callback ~after:false

  method on_realize ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"realize" ~callback ~after:false

  method on_show ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"show" ~callback ~after:false

  method on_state_flags_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"state-flags-changed" ~callback ~after:false

  method on_unmap ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unmap" ~callback ~after:false

  method on_unrealize ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unrealize" ~callback ~after:false

end
