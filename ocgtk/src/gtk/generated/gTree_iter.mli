class type tree_iter_t = object
  method get_stamp : int
  method set_stamp : int -> unit
  method as_tree_iter : Tree_iter.t
end

class tree_iter : Tree_iter.t -> tree_iter_t

val make : int -> tree_iter_t
