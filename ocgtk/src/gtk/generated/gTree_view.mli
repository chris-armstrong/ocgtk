(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TreeView from cyclic group Tree_selection_and__tree_view *)

class type tree_view_t = GTree_selection_and__tree_view.tree_view_t

class tree_view : Tree_selection_and__tree_view.Tree_view.t -> tree_view_t
val new_ : unit -> tree_view_t
val new_with_model : GTree_model.tree_model_t -> tree_view_t

