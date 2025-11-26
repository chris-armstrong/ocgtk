(* GENERATED CODE - DO NOT EDIT *)
(* Record: TreePath *)

(** An opaque structure representing a path to a row in a model. *)
type t = Obj.t

(** Create a new TreePath *)
external new_ : unit -> t = "ml_gtk_tree_path_new"

(** Create a new TreePath *)
external new_first : unit -> t = "ml_gtk_tree_path_new_first"

(** Create a new TreePath *)
external new_from_indices : int -> unit -> t = "ml_gtk_tree_path_new_from_indices"

(** Create a new TreePath *)
external new_from_indicesv : unit -> unit -> t = "ml_gtk_tree_path_new_from_indicesv"

(** Create a new TreePath *)
external new_from_string : string -> t = "ml_gtk_tree_path_new_from_string"

(** Moves the @path to point to its parent node, if it has a parent. *)
external up : t -> bool = "ml_gtk_tree_path_up"

(** Moves the @path to point to the previous node at the
current depth, if it exists. *)
external prev : t -> bool = "ml_gtk_tree_path_prev"

(** Prepends a new index to a path.

As a result, the depth of the path is increased. *)
external prepend_index : t -> int -> unit = "ml_gtk_tree_path_prepend_index"

(** Moves the @path to point to the next node at the current depth. *)
external next : t -> unit = "ml_gtk_tree_path_next"

(** Returns %TRUE if @path is a descendant of @ancestor. *)
external is_descendant : t -> Obj.t -> bool = "ml_gtk_tree_path_is_descendant"

(** Returns %TRUE if @descendant is a descendant of @path. *)
external is_ancestor : t -> Obj.t -> bool = "ml_gtk_tree_path_is_ancestor"

(** Returns the current depth of @path. *)
external get_depth : t -> int = "ml_gtk_tree_path_get_depth"

(** Frees @path. If @path is %NULL, it simply returns. *)
external free : t -> unit = "ml_gtk_tree_path_free"

(** Moves @path to point to the first child of the current path. *)
external down : t -> unit = "ml_gtk_tree_path_down"

(** Creates a new `GtkTreePath` as a copy of @path. *)
external copy : t -> Obj.t = "ml_gtk_tree_path_copy"

(** Compares two paths.

If @a appears before @b in a tree, then -1 is returned.
If @b appears before @a, then 1 is returned.
If the two nodes are equal, then 0 is returned. *)
external compare : t -> Obj.t -> int = "ml_gtk_tree_path_compare"

(** Appends a new index to a path.

As a result, the depth of the path is increased. *)
external append_index : t -> int -> unit = "ml_gtk_tree_path_append_index"

