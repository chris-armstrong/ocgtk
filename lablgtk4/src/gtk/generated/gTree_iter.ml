(* High-level class for TreeIter *)
class tree_iter (obj : Tree_iter.t) = object (self)

  method copy : unit -> Tree_iter.t =
    fun () ->
      (Tree_iter.copy obj)

  method free : unit -> unit =
    fun () ->
      (Tree_iter.free obj)

    method as_tree_iter = obj
end

