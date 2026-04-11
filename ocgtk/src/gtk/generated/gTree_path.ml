class type tree_path_t = object
    method append_index : int -> unit
    method compare : Tree_path.t -> int
    method copy : unit -> Tree_path.t
    method down : unit -> unit
    method free : unit -> unit
    method get_depth : unit -> int
    method is_ancestor : Tree_path.t -> bool
    method is_descendant : Tree_path.t -> bool
    method next : unit -> unit
    method prepend_index : int -> unit
    method prev : unit -> bool
    method to_string : unit -> string option
    method up : unit -> bool
    method as_tree_path : Tree_path.t
end

(* High-level class for TreePath *)
class tree_path (obj : Tree_path.t) : tree_path_t = object (self)

  method append_index : int -> unit =
    fun index_ ->
      (Tree_path.append_index obj index_)

  method compare : Tree_path.t -> int =
    fun b ->
      (Tree_path.compare obj b)

  method copy : unit -> Tree_path.t =
    fun () ->
      (Tree_path.copy obj)

  method down : unit -> unit =
    fun () ->
      (Tree_path.down obj)

  method free : unit -> unit =
    fun () ->
      (Tree_path.free obj)

  method get_depth : unit -> int =
    fun () ->
      (Tree_path.get_depth obj)

  method is_ancestor : Tree_path.t -> bool =
    fun descendant ->
      (Tree_path.is_ancestor obj descendant)

  method is_descendant : Tree_path.t -> bool =
    fun ancestor ->
      (Tree_path.is_descendant obj ancestor)

  method next : unit -> unit =
    fun () ->
      (Tree_path.next obj)

  method prepend_index : int -> unit =
    fun index_ ->
      (Tree_path.prepend_index obj index_)

  method prev : unit -> bool =
    fun () ->
      (Tree_path.prev obj)

  method to_string : unit -> string option =
    fun () ->
      (Tree_path.to_string obj)

  method up : unit -> bool =
    fun () ->
      (Tree_path.up obj)

    method as_tree_path = obj
end

let new_ () : tree_path_t =
  new tree_path (Tree_path.new_ ())

let new_first () : tree_path_t =
  new tree_path (Tree_path.new_first ())

let new_from_indicesv (indices : int array) (length : Gsize.t) : tree_path_t =
  let obj_ = Tree_path.new_from_indicesv indices length in
  new tree_path obj_

let new_from_string (path : string) : tree_path_t =
  let obj_ = Tree_path.new_from_string path in
  new tree_path obj_

