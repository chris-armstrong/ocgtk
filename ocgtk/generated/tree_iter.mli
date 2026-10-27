(** The [GtkTreeIter] is the primary structure for accessing a [GtkTreeModel].
    Models are expected to put a unique integer in the [stamp] member, and put
    model-specific data in the three [user_data] members.

    Its methods, signals and properties are on {!class-type-tree_iter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Tree_iter}. *)

(** The methods, signals and properties of a [GtkTreeIter]. *)
class type tree_iter_t = object
  method as_tree_iter : Raw.Tree_iter.t
end

class tree_iter : Raw.Tree_iter.t -> tree_iter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_iter.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTreeIter], give one already wrapped. *)
