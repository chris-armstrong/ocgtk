(* Signal handlers for Calendar *)
class calendar_signals (obj : Calendar.t) = object
  method on_day_selected ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"day-selected" ~callback ~after:false

  method on_next_month ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"next-month" ~callback ~after:false

  method on_next_year ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"next-year" ~callback ~after:false

  method on_prev_month ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"prev-month" ~callback ~after:false

  method on_prev_year ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"prev-year" ~callback ~after:false

end
