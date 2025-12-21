(* High-level class for TreeRowReference *)
class tree_row_reference (obj : Tree_row_reference.t) = object (self)

  method copy : unit -> Tree_row_reference.t =
    fun () ->
      (Tree_row_reference.copy obj)

  method free : unit -> unit =
    fun () ->
      (Tree_row_reference.free obj)

  method get_path : unit -> Tree_path.t option =
    fun () ->
      (Tree_row_reference.get_path obj)

  method valid : unit -> bool =
    fun () ->
      (Tree_row_reference.valid obj)

    method as_tree_row_reference = obj
end

