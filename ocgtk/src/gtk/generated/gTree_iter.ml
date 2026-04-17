class type tree_iter_t = object
  method copy : unit -> Tree_iter.t
  method free : unit -> unit
  method as_tree_iter : Tree_iter.t
end

(* High-level class for TreeIter *)
class tree_iter (obj : Tree_iter.t) : tree_iter_t =
  object (self)
    method copy : unit -> Tree_iter.t = fun () -> Tree_iter.copy obj
    method free : unit -> unit = fun () -> Tree_iter.free obj
    method as_tree_iter = obj
  end
