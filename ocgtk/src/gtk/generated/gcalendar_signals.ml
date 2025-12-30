(* Signal handlers for Calendar *)
class calendar_signals (obj : Calendar.t) = object
  (** Emitted when the user selects a day. *)
  method on_day_selected ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"day-selected" ~callback ~after:false

  (** Emitted when the user switched to the next month. *)
  method on_next_month ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"next-month" ~callback ~after:false

  (** Emitted when user switched to the next year. *)
  method on_next_year ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"next-year" ~callback ~after:false

  (** Emitted when the user switched to the previous month. *)
  method on_prev_month ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"prev-month" ~callback ~after:false

  (** Emitted when user switched to the previous year. *)
  method on_prev_year ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"prev-year" ~callback ~after:false

end
