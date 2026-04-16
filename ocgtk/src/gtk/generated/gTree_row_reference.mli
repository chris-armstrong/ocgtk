class type tree_row_reference_t = object
  method copy : unit -> Tree_row_reference.t
  method free : unit -> unit
  method get_model : unit -> GTree_model.tree_model_t
  method get_path : unit -> Tree_path.t option
  method valid : unit -> bool
  method as_tree_row_reference : Tree_row_reference.t
end

class tree_row_reference : Tree_row_reference.t -> tree_row_reference_t

val new_ : GTree_model.tree_model_t -> Tree_path.t -> tree_row_reference_t

val new_proxy :
  [ `object_ ] Gobject.obj ->
  GTree_model.tree_model_t ->
  Tree_path.t ->
  tree_row_reference_t
