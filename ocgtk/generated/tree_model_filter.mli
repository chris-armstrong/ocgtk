(** A [GtkTreeModel] which hides parts of an underlying tree model

    A [GtkTreeModelFilter] is a tree model which wraps another tree model, and
    can do the following things:

    - Filter specific rows, based on data from a “visible column”, a column
      storing booleans indicating whether the row should be filtered or not, or
      based on the return value of a “visible function”, which gets a model,
      iter and user_data and returns a boolean indicating whether the row should
      be filtered or not.

    - Modify the “appearance” of the model, using a modify function. This is
      extremely powerful and allows for just changing some values and also for
      creating a completely different model based on the given child model.

    - Set a different root node, also known as a “virtual root”. You can pass in
      a [GtkTreePath] indicating the root node for the filter at construction
      time.

    The basic API is similar to [GtkTreeModelSort]. For an example on its usage,
    see the section on [GtkTreeModelSort].

    When using [GtkTreeModelFilter], it is important to realize that
    [GtkTreeModelFilter] maintains an internal cache of all nodes which are
    visible in its clients. The cache is likely to be a subtree of the tree
    exposed by the child model. [GtkTreeModelFilter] will not cache the entire
    child model when unnecessary to not compromise the caching mechanism that is
    exposed by the reference counting scheme. If the child model implements
    reference counting, unnecessary signals may not be emitted because of
    reference counting rule 3, see the [GtkTreeModel] documentation. (Note that
    e.g. [GtkTreeStore] does not implement reference counting and will always
    emit all signals, even when the receiving node is not visible).

    Because of this, limitations for possible visible functions do apply. In
    general, visible functions should only use data or properties from the node
    for which the visibility state must be determined, its siblings or its
    parents. Usually, having a dependency on the state of any child node is not
    possible, unless references are taken on these explicitly. When no such
    reference exists, no signals may be received for these child nodes (see
    reference counting rule number 3 in the [GtkTreeModel] section).

    Determining the visibility state of a given node based on the state of its
    child nodes is a frequently occurring use case. Therefore,
    [GtkTreeModelFilter] explicitly supports this. For example, when a node does
    not have any children, you might not want the node to be visible. As soon as
    the first row is added to the node’s child level (or the last row removed),
    the node’s visibility should be updated.

    This introduces a dependency from the node on its child nodes. In order to
    accommodate this, [GtkTreeModelFilter] must make sure the necessary signals
    are received from the child model. This is achieved by building, for all
    nodes which are exposed as visible nodes to [GtkTreeModelFilter]'s clients,
    the child level (if any) and take a reference on the first node in this
    level. Furthermore, for every row-inserted, row-changed or row-deleted
    signal (also these which were not handled because the node was not cached),
    [GtkTreeModelFilter] will check if the visibility state of any parent node
    has changed.

    Beware, however, that this explicit support is limited to these two cases.
    For example, if you want a node to be visible only if two nodes in a child’s
    child level (2 levels deeper) are visible, you are on your own. In this
    case, either rely on [GtkTreeStore] to emit all signals because it does not
    implement reference counting, or for models that do implement reference
    counting, obtain references on these child levels yourself.

    Its methods, signals and properties are on
    {!class-type-tree_model_filter_t}. The functions it is built on are in
    {!Ocgtk.Raw.Tree_model_filter}. *)

(** The methods, signals and properties of a [GtkTreeModelFilter]. *)
class type tree_model_filter_t = object
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  method clear_cache : unit -> unit
  method convert_child_path_to_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  method convert_path_to_child_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  method get_model : unit -> Tree_model.tree_model_t
  method refilter : unit -> unit
  method set_visible_column : int -> unit
  method child_model : Tree_model.tree_model_t
  method virtual_root : Raw.Tree_path.t
  method as_tree_model_filter : Raw.Tree_model_filter.t
end

class tree_model_filter : Raw.Tree_model_filter.t -> tree_model_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_model_filter.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTreeModelFilter], give one already wrapped. *)
