class type tree_iter_t = object
  method as_tree_iter : Tree_iter.t
end

(* High-level class for TreeIter *)
class tree_iter (obj : Tree_iter.t) : tree_iter_t =
  object (self)
    method as_tree_iter = obj
  end
