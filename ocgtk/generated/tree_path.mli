(** An opaque structure representing a path to a row in a model.

    Its methods, signals and properties are on {!class-type-tree_path_t}. The
    functions it is built on are in {!Ocgtk.Raw.Tree_path}. *)

(** The methods, signals and properties of a [GtkTreePath]. *)
class type tree_path_t = object
  method append_index : int -> unit
  method compare : Raw.Tree_path.t -> int
  method down : unit -> unit
  method get_depth : unit -> int
  method is_ancestor : Raw.Tree_path.t -> bool
  method is_descendant : Raw.Tree_path.t -> bool
  method next : unit -> unit
  method prepend_index : int -> unit
  method prev : unit -> bool
  method to_string : unit -> string option
  method up : unit -> bool
  method as_tree_path : Raw.Tree_path.t
end

class tree_path : Raw.Tree_path.t -> tree_path_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_path.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTreePath], give one already wrapped. *)

val new_ : unit -> tree_path_t
val new_first : unit -> tree_path_t
val new_from_indicesv : int array -> Gsize.t -> tree_path_t
val new_from_string : string -> tree_path_t
