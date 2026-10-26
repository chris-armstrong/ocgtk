class type tree_row_reference_t = object
  method get_model : unit -> Tree_model.tree_model_t
  method get_path : unit -> Raw.Tree_path.t option
  method valid : unit -> bool
  method as_tree_row_reference : Raw.Tree_row_reference.t
end

class tree_row_reference : Raw.Tree_row_reference.t -> tree_row_reference_t

val new_ : Tree_model.tree_model_t -> Raw.Tree_path.t -> tree_row_reference_t

val new_proxy :
  [ `object_ ] Gobject.obj ->
  Tree_model.tree_model_t ->
  Raw.Tree_path.t ->
  tree_row_reference_t
