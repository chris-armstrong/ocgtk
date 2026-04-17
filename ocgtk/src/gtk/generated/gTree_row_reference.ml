class type tree_row_reference_t = object
  method copy : unit -> Tree_row_reference.t
  method free : unit -> unit
  method get_model : unit -> GTree_model.tree_model_t
  method get_path : unit -> Tree_path.t option
  method valid : unit -> bool
  method as_tree_row_reference : Tree_row_reference.t
end

(* High-level class for TreeRowReference *)
class tree_row_reference (obj : Tree_row_reference.t) : tree_row_reference_t =
  object (self)
    method copy : unit -> Tree_row_reference.t =
      fun () -> Tree_row_reference.copy obj

    method free : unit -> unit = fun () -> Tree_row_reference.free obj

    method get_model : unit -> GTree_model.tree_model_t =
      fun () -> new GTree_model.tree_model (Tree_row_reference.get_model obj)

    method get_path : unit -> Tree_path.t option =
      fun () -> Tree_row_reference.get_path obj

    method valid : unit -> bool = fun () -> Tree_row_reference.valid obj
    method as_tree_row_reference = obj
  end

let new_ (model : GTree_model.tree_model_t) (path : Tree_path.t) :
    tree_row_reference_t =
  let model = model#as_tree_model in
  let obj_ = Tree_row_reference.new_ model path in
  new tree_row_reference obj_

let new_proxy (proxy : [ `object_ ] Gobject.obj)
    (model : GTree_model.tree_model_t) (path : Tree_path.t) :
    tree_row_reference_t =
  let model = model#as_tree_model in
  let obj_ = Tree_row_reference.new_proxy proxy model path in
  new tree_row_reference obj_
