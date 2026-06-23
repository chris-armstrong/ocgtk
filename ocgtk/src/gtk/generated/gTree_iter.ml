class type tree_iter_t = object
  method get_stamp : int
  method set_stamp : int -> unit
  method as_tree_iter : Tree_iter.t
end

(* High-level class for TreeIter *)
class tree_iter (obj : Tree_iter.t) : tree_iter_t =
  object (self)
    method get_stamp : int = Tree_iter.get_stamp obj
    method set_stamp : int -> unit = fun v -> Tree_iter.set_stamp obj v
    method as_tree_iter = obj
  end

let make (stamp : int) : tree_iter_t = new tree_iter (Tree_iter.make stamp)
