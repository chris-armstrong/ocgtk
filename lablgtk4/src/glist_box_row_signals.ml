(* Signal handlers for ListBoxRow *)
class list_box_row_signals (obj : List_box_row.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (List_box_row.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
