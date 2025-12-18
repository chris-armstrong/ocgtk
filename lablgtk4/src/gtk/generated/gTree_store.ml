(* High-level class for TreeStore *)
class tree_store (obj : Tree_store.t) = object (self)

  method clear : unit -> unit = fun () -> (Tree_store.clear obj )

  method is_ancestor : Tree_iter.t -> Tree_iter.t -> bool = fun iter descendant -> (Tree_store.is_ancestor obj iter descendant)

  method iter_depth : Tree_iter.t -> int = fun iter -> (Tree_store.iter_depth obj iter)

  method iter_is_valid : Tree_iter.t -> bool = fun iter -> (Tree_store.iter_is_valid obj iter)

  method move_after : Tree_iter.t -> Tree_iter.t option -> unit = fun iter position -> (Tree_store.move_after obj iter position)

  method move_before : Tree_iter.t -> Tree_iter.t option -> unit = fun iter position -> (Tree_store.move_before obj iter position)

  method remove : Tree_iter.t -> bool = fun iter -> (Tree_store.remove obj iter)

  method swap : Tree_iter.t -> Tree_iter.t -> unit = fun a b -> (Tree_store.swap obj a b)

    method as_tree_store = obj
end

