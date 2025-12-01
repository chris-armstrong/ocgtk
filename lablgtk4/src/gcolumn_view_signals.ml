(* Signal handlers for ColumnView *)
class column_view_signals (obj : Column_view.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Column_view.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
