(* Signal handlers for GridView *)
class grid_view_signals (obj : Grid_view.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Grid_view.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
