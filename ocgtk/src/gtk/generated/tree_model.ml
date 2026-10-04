(* GENERATED CODE - DO NOT EDIT *)
(* TreeModel: TreeModel *)

[@@@ocaml.text
"The tree interface used by GtkTreeView\n\n\
 The [GtkTreeModel] interface defines a generic tree interface for\n\
 use by the [GtkTreeView] widget. It is an abstract interface, and\n\
 is designed to be usable with any appropriate data structure. The\n\
 programmer just has to implement this interface on their own data\n\
 type for it to be viewable by a [GtkTreeView] widget.\n\n\
 The model is represented as a hierarchical tree of strongly-typed,\n\
 columned data. In other words, the model can be seen as a tree where\n\
 every node has different values depending on which column is being\n\
 queried. The type of data found in a column is determined by using\n\
 the GType system (ie. [G_TYPE_INT], [GTK_TYPE_BUTTON], [G_TYPE_POINTER],\n\
 etc). The types are homogeneous per column across all nodes. It is\n\
 important to note that this interface only provides a way of examining\n\
 a model and observing changes. The implementation of each individual\n\
 model decides how and if changes are made.\n\n\
 In order to make life simpler for programmers who do not need to\n\
 write their own specialized model, two generic models are provided\n\
 — the [GtkTreeStore] and the [GtkListStore]. To use these, the\n\
 developer simply pushes data into these models as necessary. These\n\
 models provide the data structure as well as all appropriate tree\n\
 interfaces. As a result, implementing drag and drop, sorting, and\n\
 storing data is trivial. For the vast majority of trees and lists,\n\
 these two models are sufficient.\n\n\
 Models are accessed on a node/column level of granularity. One can\n\
 query for the value of a model at a certain node and a certain\n\
 column on that node. There are two structures used to reference a\n\
 particular node in a model. They are the [Gtk.TreePath] and\n\
 the [Gtk.TreeIter] (“iter” is short for iterator). Most of the\n\
 interface consists of operations on a [Gtk.TreeIter].\n\n\
 A path is essentially a potential node. It is a location on a model\n\
 that may or may not actually correspond to a node on a specific\n\
 model. A [Gtk.TreePath] can be converted into either an\n\
 array of unsigned integers or a string. The string form is a list\n\
 of numbers separated by a colon. Each number refers to the offset\n\
 at that level. Thus, the path [0] refers to the root\n\
 node and the path [2:4] refers to the fifth child of\n\
 the third node.\n\n\
 By contrast, a [Gtk.TreeIter] is a reference to a specific node on\n\
 a specific model. It is a generic struct with an integer and three\n\
 generic pointers. These are filled in by the model in a model-specific\n\
 way. One can convert a path to an iterator by calling\n\
 gtk_tree_model_get_iter(). These iterators are the primary way\n\
 of accessing a model and are similar to the iterators used by\n\
 [GtkTextBuffer]. They are generally statically allocated on the\n\
 stack and only used for a short time. The model interface defines\n\
 a set of operations using them for navigating the model.\n\n\
 It is expected that models fill in the iterator with private data.\n\
 For example, the [GtkListStore] model, which is internally a simple\n\
 linked list, stores a list node in one of the pointers. The\n\
 [GtkTreeModel]Sort stores an array and an offset in two of the\n\
 pointers. Additionally, there is an integer field. This field is\n\
 generally filled with a unique stamp per model. This stamp is for\n\
 catching errors resulting from using invalid iterators with a model.\n\n\
 The lifecycle of an iterator can be a little confusing at first.\n\
 Iterators are expected to always be valid for as long as the model\n\
 is unchanged (and doesn’t emit a signal). The model is considered\n\
 to own all outstanding iterators and nothing needs to be done to\n\
 free them from the user’s point of view. Additionally, some models\n\
 guarantee that an iterator is valid for as long as the node it refers\n\
 to is valid (most notably the [GtkTreeStore] and [GtkListStore]).\n\
 Although generally uninteresting, as one always has to allow for\n\
 the case where iterators do not persist beyond a signal, some very\n\
 important performance enhancements were made in the sort model.\n\
 As a result, the [GTK_TREE_MODEL_ITERS_PERSIST] flag was added to\n\
 indicate this behavior.\n\n\
 To help show some common operation of a model, some examples are\n\
 provided. The first example shows three ways of getting the iter at\n\
 the location [3:2:5]. While the first method shown is\n\
 easier, the second is much more common, as you often get paths from\n\
 callbacks.\n\n\
 {b Acquiring a [GtkTreeIter]}\n\n\
 {[\n\
 // Three ways of getting the iter pointing to the location\n\
 GtkTreePath *path;\n\
 GtkTreeIter iter;\n\
 GtkTreeIter parent_iter;\n\n\
 // get the iterator from a string\n\
 gtk_tree_model_get_iter_from_string (model,\n\
\                                     &iter,\n\
\                                     \"3:2:5\");\n\n\
 // get the iterator from a path\n\
 path = gtk_tree_path_new_from_string (\"3:2:5\");\n\
 gtk_tree_model_get_iter (model, &iter, path);\n\
 gtk_tree_path_free (path);\n\n\
 // walk the tree to find the iterator\n\
 gtk_tree_model_iter_nth_child (model, &iter,\n\
\                               NULL, 3);\n\
 parent_iter = iter;\n\
 gtk_tree_model_iter_nth_child (model, &iter,\n\
\                               &parent_iter, 2);\n\
 parent_iter = iter;\n\
 gtk_tree_model_iter_nth_child (model, &iter,\n\
\                               &parent_iter, 5);\n\
 ]}\n\n\
 This second example shows a quick way of iterating through a list\n\
 and getting a string and an integer from each row. The\n\
 populate_model() function used below is not\n\
 shown, as it is specific to the [GtkListStore]. For information on\n\
 how to write such a function, see the [GtkListStore] documentation.\n\n\
 {b Reading data from a [GtkTreeModel]}\n\n\
 {[\n\
 enum\n\
 {\n\
\  STRING_COLUMN,\n\
\  INT_COLUMN,\n\
\  N_COLUMNS\n\
 };\n\n\
 ...\n\n\
 GtkTreeModel *list_store;\n\
 GtkTreeIter iter;\n\
 gboolean valid;\n\
 int row_count = 0;\n\n\
 // make a new list_store\n\
 list_store = gtk_list_store_new (N_COLUMNS,\n\
\                                 G_TYPE_STRING,\n\
\                                 G_TYPE_INT);\n\n\
 // Fill the list store with data\n\
 populate_model (list_store);\n\n\
 // Get the first iter in the list, check it is valid and walk\n\
 // through the list, reading each row.\n\n\
 valid = gtk_tree_model_get_iter_first (list_store,\n\
\                                       &iter);\n\
 while (valid)\n\
\ {\n\
\   char *str_data;\n\
\   int    int_data;\n\n\
\   // Make sure you terminate calls to gtk_tree_model_get() with a “-1” value\n\
\   gtk_tree_model_get (list_store, &iter,\n\
\                       STRING_COLUMN, &str_data,\n\
\                       INT_COLUMN, &int_data,\n\
\                       -1);\n\n\
\   // Do something with the data\n\
\   g_print (\"Row %d: (%s,%d)\\n\",\n\
\            row_count, str_data, int_data);\n\
\   g_free (str_data);\n\n\
\   valid = gtk_tree_model_iter_next (list_store,\n\
\                                     &iter);\n\
\   row_count++;\n\
\ }\n\
 ]}\n\n\
 The [GtkTreeModel] interface contains two methods for reference\n\
 counting: gtk_tree_model_ref_node() and gtk_tree_model_unref_node().\n\
 These two methods are optional to implement. The reference counting\n\
 is meant as a way for views to let models know when nodes are being\n\
 displayed. [GtkTreeView] will take a reference on a node when it is\n\
 visible, which means the node is either in the toplevel or expanded.\n\
 Being displayed does not mean that the node is currently directly\n\
 visible to the user in the viewport. Based on this reference counting\n\
 scheme a caching model, for example, can decide whether or not to cache\n\
 a node based on the reference count. A file-system based model would\n\
 not want to keep the entire file hierarchy in memory, but just the\n\
 folders that are currently expanded in every current view.\n\n\
 When working with reference counting, the following rules must be taken\n\
 into account:\n\n\
 - Never take a reference on a node without owning a reference on its parent.\n\
 This means that all parent nodes of a referenced node must be referenced\n\
 as well.\n\n\
 - Outstanding references on a deleted node are not released. This is not\n\
 possible because the node has already been deleted by the time the\n\
 row-deleted signal is received.\n\n\
 - Models are not obligated to emit a signal on rows of which none of its\n\
 siblings are referenced. To phrase this differently, signals are only\n\
 required for levels in which nodes are referenced. For the root level\n\
 however, signals must be emitted at all times (however the root level\n\
 is always referenced when any view is attached)."]

type t = [ `tree_model ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gtk_tree_model_from_gobject"

(* Methods *)

external unref_node : t -> Tree_iter.t -> unit = "ml_gtk_tree_model_unref_node"
(** Lets the tree unref the node.

    This is an optional method for models to implement. To be more specific,
    models may ignore this call as it exists primarily for performance reasons.
    For more information on what this means, see gtk_tree_model_ref_node().

    Please note that nodes that are deleted are not unreffed. *)

external rows_reordered_with_length :
  t -> Tree_path.t -> Tree_iter.t option -> int array -> int -> unit
  = "ml_gtk_tree_model_rows_reordered_with_length"
(** Emits the ::rows-reordered signal on [tree_model].

    See [Gtk.TreeModel::rows-reordered].

    This should be called by models when their rows have been reordered. *)

external row_inserted : t -> Tree_path.t -> Tree_iter.t -> unit
  = "ml_gtk_tree_model_row_inserted"
(** Emits the ::row-inserted signal on [tree_model].

    See [Gtk.TreeModel::row-inserted]. *)

external row_has_child_toggled : t -> Tree_path.t -> Tree_iter.t -> unit
  = "ml_gtk_tree_model_row_has_child_toggled"
(** Emits the ::row-has-child-toggled signal on [tree_model].

    See [Gtk.TreeModel::row-has-child-toggled].

    This should be called by models after the child state of a node changes. *)

external row_deleted : t -> Tree_path.t -> unit
  = "ml_gtk_tree_model_row_deleted"
(** Emits the ::row-deleted signal on [tree_model].

    See [Gtk.TreeModel::row-deleted].

    This should be called by models after a row has been removed. The location
    pointed to by [path] should be the location that the row previously was at.
    It may not be a valid location anymore.

    Nodes that are deleted are not unreffed, this means that any outstanding
    references on the deleted node should not be released. *)

external row_changed : t -> Tree_path.t -> Tree_iter.t -> unit
  = "ml_gtk_tree_model_row_changed"
(** Emits the ::row-changed signal on [tree_model].

    See [Gtk.TreeModel::row-changed]. *)

external ref_node : t -> Tree_iter.t -> unit = "ml_gtk_tree_model_ref_node"
(** Lets the tree ref the node.

    This is an optional method for models to implement. To be more specific,
    models may ignore this call as it exists primarily for performance reasons.

    This function is primarily meant as a way for views to let caching models
    know when nodes are being displayed (and hence, whether or not to cache that
    node). Being displayed means a node is in an expanded branch, regardless of
    whether the node is currently visible in the viewport. For example, a
    file-system based model would not want to keep the entire file-hierarchy in
    memory, just the sections that are currently being displayed by every
    current view.

    A model should be expected to be able to get an iter independent of its
    reffed state. *)

external iter_previous : t -> Tree_iter.t -> bool
  = "ml_gtk_tree_model_iter_previous"
(** Sets [iter] to point to the previous node at the current level.

    If there is no previous [iter], [FALSE] is returned and [iter] is set to be
    invalid. *)

external iter_parent : t -> Tree_iter.t -> bool * Tree_iter.t
  = "ml_gtk_tree_model_iter_parent"
(** Sets [iter] to be the parent of [child].

    If [child] is at the toplevel, and doesn’t have a parent, then [iter] is set
    to an invalid iterator and [FALSE] is returned. [child] will remain a valid
    node after this function has been called.

    [iter] will be initialized before the lookup is performed, so [child] and
    [iter] cannot point to the same memory location. *)

external iter_nth_child : t -> Tree_iter.t option -> int -> bool * Tree_iter.t
  = "ml_gtk_tree_model_iter_nth_child"
(** Sets [iter] to be the child of [parent], using the given index.

    The first index is 0. If [n] is too big, or [parent] has no children, [iter]
    is set to an invalid iterator and [FALSE] is returned. [parent] will remain
    a valid node after this function has been called. As a special case, if
    [parent] is [NULL], then the [n]-th root node is set. *)

external iter_next : t -> Tree_iter.t -> bool = "ml_gtk_tree_model_iter_next"
(** Sets [iter] to point to the node following it at the current level.

    If there is no next [iter], [FALSE] is returned and [iter] is set to be
    invalid. *)

external iter_n_children : t -> Tree_iter.t option -> int
  = "ml_gtk_tree_model_iter_n_children"
(** Returns the number of children that [iter] has.

    As a special case, if [iter] is [NULL], then the number of toplevel nodes is
    returned. *)

external iter_has_child : t -> Tree_iter.t -> bool
  = "ml_gtk_tree_model_iter_has_child"
(** Returns [TRUE] if [iter] has children, [FALSE] otherwise. *)

external iter_children : t -> Tree_iter.t option -> bool * Tree_iter.t
  = "ml_gtk_tree_model_iter_children"
(** Sets [iter] to point to the first child of [parent].

    If [parent] has no children, [FALSE] is returned and [iter] is set to be
    invalid. [parent] will remain a valid node after this function has been
    called.

    If [parent] is [NULL] returns the first node, equivalent to
    [gtk_tree_model_get_iter_first (tree_model, iter);] *)

external get_value : t -> Tree_iter.t -> int -> Gobject.Value.t
  = "ml_gtk_tree_model_get_value"
(** Initializes and sets [value] to that at [column].

    When done with [value], g_value_unset() needs to be called to free any
    allocated memory. *)

external get_string_from_iter : t -> Tree_iter.t -> string option
  = "ml_gtk_tree_model_get_string_from_iter"
(** Generates a string representation of the iter.

    This string is a “:” separated list of numbers. For example, “4:10:0:3”
    would be an acceptable return value for this string. *)

external get_path : t -> Tree_iter.t -> Tree_path.t
  = "ml_gtk_tree_model_get_path"
(** Returns a newly-created [GtkTreePath] referenced by [iter].

    This path should be freed with gtk_tree_path_free(). *)

external get_n_columns : t -> int = "ml_gtk_tree_model_get_n_columns"
(** Returns the number of columns supported by [tree_model]. *)

external get_iter_from_string : t -> string -> bool * Tree_iter.t
  = "ml_gtk_tree_model_get_iter_from_string"
(** Sets [iter] to a valid iterator pointing to [path_string], if it exists.

    Otherwise, [iter] is left invalid and [FALSE] is returned. *)

external get_iter_first : t -> bool * Tree_iter.t
  = "ml_gtk_tree_model_get_iter_first"
[@@ocaml.doc
  "Initializes [iter] with the first iterator in the tree\n\
   (the one at the path \"0\").\n\n\
   Returns [FALSE] if the tree is empty, [TRUE] otherwise."]

external get_iter : t -> Tree_path.t -> bool * Tree_iter.t
  = "ml_gtk_tree_model_get_iter"
(** Sets [iter] to a valid iterator pointing to [path].

    If [path] does not exist, [iter] is set to an invalid iterator and [FALSE]
    is returned. *)

external get_flags : t -> Gtk_enums.treemodelflags
  = "ml_gtk_tree_model_get_flags"
(** Returns a set of flags supported by this interface.

    The flags are a bitwise combination of [GtkTreeModel]Flags. The flags
    supported should not change during the lifetime of the [tree_model]. *)

external get_column_type : t -> int -> Gobject.Type.t
  = "ml_gtk_tree_model_get_column_type"
(** Returns the type of the column. *)

external filter_new : t -> Tree_path.t option -> t
  = "ml_gtk_tree_model_filter_new"
(** Creates a new [GtkTreeModel], with [child_model] as the child_model and
    [root] as the virtual root. *)
