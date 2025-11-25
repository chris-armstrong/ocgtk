(* High-level class for TreeExpander *)
class tree_expander_skel (obj : Tree_expander.t) = object (self)
  inherit GObj.widget_impl (Tree_expander.as_widget obj)

end

class tree_expander obj = object
  inherit tree_expander_skel obj
end
