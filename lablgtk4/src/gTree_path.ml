(* High-level class for TreePath *)
class tree_path (obj : Tree_path.t) = object (self)

  method append_index : int -> unit = fun index_ -> (Tree_path.append_index obj index_)

  method compare : Tree_path.t -> int = fun b -> (Tree_path.compare obj b)

  method copy : unit -> Tree_path.t = fun () -> (Tree_path.copy obj )

  method down : unit -> unit = fun () -> (Tree_path.down obj )

  method free : unit -> unit = fun () -> (Tree_path.free obj )

  method get_depth : unit -> int = fun () -> (Tree_path.get_depth obj )

  method is_ancestor : Tree_path.t -> bool = fun descendant -> (Tree_path.is_ancestor obj descendant)

  method is_descendant : Tree_path.t -> bool = fun ancestor -> (Tree_path.is_descendant obj ancestor)

  method next : unit -> unit = fun () -> (Tree_path.next obj )

  method prepend_index : int -> unit = fun index_ -> (Tree_path.prepend_index obj index_)

  method prev : unit -> bool = fun () -> (Tree_path.prev obj )

  method up : unit -> bool = fun () -> (Tree_path.up obj )

    method as_tree_path = obj
end

