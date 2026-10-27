(** An opaque structure representing a path to a row in a model.

    Its methods, signals and properties are on {!class-type-tree_path_t}. The
    functions it is built on are in {!Ocgtk.Raw.Tree_path}. *)

(** The methods, signals and properties of a [GtkTreePath]. *)
class type tree_path_t = object
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
  (** Returns [TRUE] if [descendant] is a descendant of [path]. *)

  method is_descendant : Raw.Tree_path.t -> bool
  (** Returns [TRUE] if [path] is a descendant of [ancestor]. *)

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
      0, [NULL] is returned. *)

  method up : unit -> bool
  (** Moves the [path] to point to its parent node, if it has a parent. *)

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
