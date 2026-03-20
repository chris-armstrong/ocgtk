class type tree_row_reference_t = object
    method copy : unit -> Tree_row_reference.t
    method free : unit -> unit
    method get_model : unit -> GTree_model.tree_model_t
    method get_path : unit -> Tree_path.t option
    method valid : unit -> bool
    method as_tree_row_reference : Tree_row_reference.t
end

(* High-level class for TreeRowReference *)
class tree_row_reference (obj : Tree_row_reference.t) : tree_row_reference_t = object (self)

  method copy : unit -> Tree_row_reference.t =
    fun () ->
      (Tree_row_reference.copy obj)

  method free : unit -> unit =
    fun () ->
      (Tree_row_reference.free obj)

  method get_model : unit -> GTree_model.tree_model_t =
    fun () ->
      new  GTree_model.tree_model(Tree_row_reference.get_model obj)

  method get_path : unit -> Tree_path.t option =
    fun () ->
      (Tree_row_reference.get_path obj)

  method valid : unit -> bool =
    fun () ->
      (Tree_row_reference.valid obj)

    method as_tree_row_reference = obj
end

