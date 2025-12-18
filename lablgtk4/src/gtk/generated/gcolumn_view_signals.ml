(* Signal handlers for ColumnView *)
class column_view_signals (obj : Column_view_and__column_view_column.Column_view.t) = object
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
