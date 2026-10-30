class type tree_path_t = object
  (** {2:methods Methods} *)

  method append_index : int -> unit
  (** Appends a new index to a path.

      As a result, the depth of the path is increased. *)

  method compare : Raw.Tree_path.t -> int
  (** Compares two paths.

      If [a] appears before [b] in a tree, then -1 is returned. If [b] appears
      before [a], then 1 is returned. If the two nodes are equal, then 0 is
      returned. *)

  method down : unit -> unit
  (** Moves [path] to point to the first child of the current path. *)

  method get_depth : unit -> int
  (** Returns the current depth of [path]. *)

  method is_ancestor : Raw.Tree_path.t -> bool
  (** Returns [true] if [descendant] is a descendant of [path]. *)

  method is_descendant : Raw.Tree_path.t -> bool
  (** Returns [true] if [path] is a descendant of [ancestor]. *)

  method next : unit -> unit
  (** Moves the [path] to point to the next node at the current depth. *)

  method prepend_index : int -> unit
  (** Prepends a new index to a path.

      As a result, the depth of the path is increased. *)

  method prev : unit -> bool
  (** Moves the [path] to point to the previous node at the current depth, if it
      exists. *)

  method to_string : unit -> string option
  (** Generates a string representation of the path.

      This string is a “:” separated list of numbers. For example, “4:10:0:3”
      would be an acceptable return value for this string. If the path has depth
      0, [None] is returned. *)

  method up : unit -> bool
  (** Moves the [path] to point to its parent node, if it has a parent. *)

  (** {2:conversions Conversions} *)

  method as_tree_path : Raw.Tree_path.t
end

(* High-level class for TreePath *)
class tree_path (obj : Raw.Tree_path.t) : tree_path_t =
  object (self)
    method append_index : int -> unit =
      fun index_ -> Raw.Tree_path.append_index obj index_

    method compare : Raw.Tree_path.t -> int =
      fun b -> Raw.Tree_path.compare obj b

    method down : unit -> unit = fun () -> Raw.Tree_path.down obj
    method get_depth : unit -> int = fun () -> Raw.Tree_path.get_depth obj

    method is_ancestor : Raw.Tree_path.t -> bool =
      fun descendant -> Raw.Tree_path.is_ancestor obj descendant

    method is_descendant : Raw.Tree_path.t -> bool =
      fun ancestor -> Raw.Tree_path.is_descendant obj ancestor

    method next : unit -> unit = fun () -> Raw.Tree_path.next obj

    method prepend_index : int -> unit =
      fun index_ -> Raw.Tree_path.prepend_index obj index_

    method prev : unit -> bool = fun () -> Raw.Tree_path.prev obj

    method to_string : unit -> string option =
      fun () -> Raw.Tree_path.to_string obj

    method up : unit -> bool = fun () -> Raw.Tree_path.up obj
    method as_tree_path = obj
  end

let new_ () : tree_path_t = new tree_path (Raw.Tree_path.new_ ())
let new_first () : tree_path_t = new tree_path (Raw.Tree_path.new_first ())

let new_from_indicesv (indices : int array) (length : Gsize.t) : tree_path_t =
  let obj_ = Raw.Tree_path.new_from_indicesv indices length in
  new tree_path obj_

let new_from_string (path : string) : tree_path_t =
  let obj_ = Raw.Tree_path.new_from_string path in
  new tree_path obj_
