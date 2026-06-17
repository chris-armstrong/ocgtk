class type tree_iter_t = object
  method as_tree_iter : Tree_iter.t
end

class tree_iter : Tree_iter.t -> tree_iter_t
