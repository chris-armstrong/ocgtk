(* High-level class for TreeView *)
class tree_view_skel (obj : Tree_view.t) = object (self)
  inherit GObj.widget_impl (Tree_view.as_widget obj)

end

class tree_view obj = object
  inherit tree_view_skel obj
end
