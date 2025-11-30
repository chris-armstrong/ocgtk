(* Signal handlers for ListView *)
class list_view_signals (obj : List_view.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (List_view.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
