(* Signal handlers for Calendar *)
class calendar_signals (obj : Calendar.t) = object
  method day_selected ~callback =
    Gobject.Signal.connect_simple (Calendar.as_widget obj :> [`widget] Gobject.obj) ~name:"day-selected" ~callback ~after:false

  method next_month ~callback =
    Gobject.Signal.connect_simple (Calendar.as_widget obj :> [`widget] Gobject.obj) ~name:"next-month" ~callback ~after:false

  method next_year ~callback =
    Gobject.Signal.connect_simple (Calendar.as_widget obj :> [`widget] Gobject.obj) ~name:"next-year" ~callback ~after:false

  method prev_month ~callback =
    Gobject.Signal.connect_simple (Calendar.as_widget obj :> [`widget] Gobject.obj) ~name:"prev-month" ~callback ~after:false

  method prev_year ~callback =
    Gobject.Signal.connect_simple (Calendar.as_widget obj :> [`widget] Gobject.obj) ~name:"prev-year" ~callback ~after:false

end
