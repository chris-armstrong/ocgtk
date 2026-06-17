(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TreeView from cyclic group Tree_selection_and__tree_view *)

class type tree_view_t = GTree_selection_and__tree_view.tree_view_t

class tree_view = GTree_selection_and__tree_view.tree_view
let new_ () : tree_view_t =
  new tree_view (Tree_selection_and__tree_view.Tree_view.new_ ())

let new_with_model (model : GTree_model.tree_model_t) : tree_view_t =
  let model = model#as_tree_model in
  let obj_ = Tree_selection_and__tree_view.Tree_view.new_with_model model in
  new tree_view obj_

