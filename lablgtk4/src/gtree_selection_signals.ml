(* Signal handlers for TreeSelection *)
class tree_selection_signals (obj : Tree_selection_and__tree_view.Tree_selection.t) = object
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

end
