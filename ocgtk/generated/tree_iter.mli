(** The [GtkTreeIter] is the primary structure for accessing a [GtkTreeModel].
    Models are expected to put a unique integer in the [stamp] member, and put
    model-specific data in the three [user_data] members.

    Its methods, signals and properties are on {!class-type-tree_iter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Tree_iter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TreeIter].}

    The [GtkTreeIter] is the primary structure for accessing a [GtkTreeModel].
    Models are expected to put a unique integer in the [stamp] member, and put
    model-specific data in the three [user_data] members. *)
class type tree_iter_t = object
  (** {2:conversions Conversions} *)

  method as_tree_iter : Raw.Tree_iter.t
end

class tree_iter : Raw.Tree_iter.t -> tree_iter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_iter.t}. *)
