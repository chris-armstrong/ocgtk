class type tree_row_reference_t = object
  method get_model : unit -> Tree_model.tree_model_t
  method get_path : unit -> Raw.Tree_path.t option
  method valid : unit -> bool
  method as_tree_row_reference : Raw.Tree_row_reference.t
end

(* High-level class for TreeRowReference *)
class tree_row_reference (obj : Raw.Tree_row_reference.t) : tree_row_reference_t
  =
  object (self)
    method get_model : unit -> Tree_model.tree_model_t =
      fun () -> new Tree_model.tree_model (Raw.Tree_row_reference.get_model obj)

    method get_path : unit -> Raw.Tree_path.t option =
      fun () -> Raw.Tree_row_reference.get_path obj

    method valid : unit -> bool = fun () -> Raw.Tree_row_reference.valid obj
    method as_tree_row_reference = obj
  end

let new_ (model : Tree_model.tree_model_t) (path : Raw.Tree_path.t) :
    tree_row_reference_t =
  let model = model#as_tree_model in
  let obj_ = Raw.Tree_row_reference.new_ model path in
  new tree_row_reference obj_

let new_proxy (proxy : [ `object_ ] Gobject.obj)
    (model : Tree_model.tree_model_t) (path : Raw.Tree_path.t) :
    tree_row_reference_t =
  let model = model#as_tree_model in
  let obj_ = Raw.Tree_row_reference.new_proxy proxy model path in
  new tree_row_reference obj_
