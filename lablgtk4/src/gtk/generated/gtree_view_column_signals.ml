(* Signal handlers for TreeViewColumn *)
class tree_view_column_signals (obj : Tree_view_column.t) = object
  method on_clicked ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"clicked" ~callback ~after:false

end
