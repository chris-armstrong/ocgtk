(* GENERATED CODE - DO NOT EDIT *)
(* ListStore: ListStore *)

[@@@ocaml.text
"A list-like data structure that can be used with the [Gtk.TreeView].\n\n\
 The [GtkListStore] object is a list model for use with a [GtkTreeView]\n\
 widget.  It implements the [GtkTreeModel] interface, and consequentialy,\n\
 can use all of the methods available there.  It also implements the\n\
 [GtkTreeSortable] interface so it can be sorted by the view.\n\
 Finally, it also implements the tree\n\
 drag and drop\n\
 interfaces.\n\n\
 The [GtkListStore] can accept most [GType]s as a column type, though\n\
 it can’t accept all custom types.  Internally, it will keep a copy of\n\
 data passed in (such as a string or a boxed pointer).  Columns that\n\
 accept [GObject]s are handled a little differently.  The\n\
 [GtkListStore] will keep a reference to the object instead of copying the\n\
 value.  As a result, if the object is modified, it is up to the\n\
 application writer to call [Gtk.TreeModel.row_changed] to emit the\n\
 [Gtk.TreeModel::row_changed] signal. This most commonly affects lists\n\
 with [Gdk.Texture]s stored.\n\n\
 An example for creating a simple list store:\n\n\
 {[\n\
 enum {\n\
\  COLUMN_STRING,\n\
\  COLUMN_INT,\n\
\  COLUMN_BOOLEAN,\n\
\  N_COLUMNS\n\
 };\n\n\
 {\n\
\  GtkListStore *list_store;\n\
\  GtkTreePath *path;\n\
\  GtkTreeIter iter;\n\
\  int i;\n\n\
\  list_store = gtk_list_store_new (N_COLUMNS,\n\
\                                   G_TYPE_STRING,\n\
\                                   G_TYPE_INT,\n\
\                                   G_TYPE_BOOLEAN);\n\n\
\  for (i = 0; i < 10; i++)\n\
\    {\n\
\      char *some_data;\n\n\
\      some_data = get_some_data (i);\n\n\
\      // Add a new row to the model\n\
\      gtk_list_store_append (list_store, &iter);\n\
\      gtk_list_store_set (list_store, &iter,\n\
\                          COLUMN_STRING, some_data,\n\
\                          COLUMN_INT, i,\n\
\                          COLUMN_BOOLEAN,  FALSE,\n\
\                          -1);\n\n\
\      // As the store will keep a copy of the string internally,\n\
\      // we free some_data.\n\
\      g_free (some_data);\n\
\    }\n\n\
\  // Modify a particular row\n\
\  path = gtk_tree_path_new_from_string (\"4\");\n\
\  gtk_tree_model_get_iter (GTK_TREE_MODEL (list_store),\n\
\                           &iter,\n\
\                           path);\n\
\  gtk_tree_path_free (path);\n\
\  gtk_list_store_set (list_store, &iter,\n\
\                      COLUMN_BOOLEAN, TRUE,\n\
\                      -1);\n\
 }\n\
 ]}\n\n\
 [GtkListStore] is deprecated since GTK 4.10, and should not be used in newly\n\
 written code. You should use [Gio.ListStore] instead, and the various\n\
 list models provided by GTK.\n\n\
 {b Performance Considerations}\n\n\
 Internally, the [GtkListStore] was originally implemented with a linked list\n\
 with a tail pointer.  As a result, it was fast at data insertion and deletion,\n\
 and not fast at random data access.  The [GtkListStore] sets the\n\
 [GTK_TREE_MODEL_ITERS_PERSIST] flag, which means that [GtkTreeIter]s can be\n\
 cached while the row exists.  Thus, if access to a particular row is needed\n\
 often and your code is expected to run on older versions of GTK, it is worth\n\
 keeping the iter around.\n\n\
 {b Atomic Operations}\n\n\
 It is important to note that only the methods\n\
 gtk_list_store_insert_with_values() and gtk_list_store_insert_with_valuesv()\n\
 are atomic, in the sense that the row is being appended to the store and the\n\
 values filled in in a single operation with regard to [GtkTreeModel] signaling.\n\
 In contrast, using e.g. gtk_list_store_append() and then gtk_list_store_set()\n\
 will first create a row, which triggers the [GtkTreeModel::row-inserted] signal\n\
 on [GtkListStore]. The row, however, is still empty, and any signal handler\n\
 connecting to [GtkTreeModel::row-inserted] on this particular store should be \
 prepared\n\
 for the situation that the row might be empty. This is especially important\n\
 if you are wrapping the [GtkListStore] inside a [GtkTreeModel]Filter and are\n\
 using a [GtkTreeModel]FilterVisibleFunc. Using any of the non-atomic operations\n\
 to append rows to the [GtkListStore] will cause the\n\
 [GtkTreeModel]FilterVisibleFunc to be visited with an empty row first; the\n\
 function must be prepared for that.\n\n\
 {b GtkListStore as GtkBuildable}\n\n\
 The GtkListStore implementation of the [Gtk.Buildable] interface allows\n\
 to specify the model columns with a [<columns>] element that may contain\n\
 multiple [<column>] elements, each specifying one model column. The “type”\n\
 attribute specifies the data type for the column.\n\n\
 Additionally, it is possible to specify content for the list store\n\
 in the UI definition, with the [<data>] element. It can contain multiple\n\
 [<row>] elements, each specifying to content for one row of the list model.\n\
 Inside a [<row>], the [<col>] elements specify the content for individual \
 cells.\n\n\
 Note that it is probably more common to define your models in the code,\n\
 and one might consider it a layering violation to specify the content of\n\
 a list store in a UI definition, data, not presentation, and common wisdom\n\
 is to separate the two, as far as possible.\n\n\
 An example of a UI Definition fragment for a list store:\n\n\
 {[\n\
 <object class=\"GtkListStore\">\n\
\  <columns>\n\
\    <column type=\"gchararray\"/>\n\
\    <column type=\"gchararray\"/>\n\
\    <column type=\"gint\"/>\n\
\  </columns>\n\
\  <data>\n\
\    <row>\n\
\      <col id=\"0\">John</col>\n\
\      <col id=\"1\">Doe</col>\n\
\      <col id=\"2\">25</col>\n\
\    </row>\n\
\    <row>\n\
\      <col id=\"0\">Johan</col>\n\
\      <col id=\"1\">Dahlin</col>\n\
\      <col id=\"2\">50</col>\n\
\    </row>\n\
\  </data>\n\
 </object>\n\
 ]}"]

type t = [ `list_store | `object_ ] Gobject.obj

external newv : int -> Gobject.Type.t array -> t = "ml_gtk_list_store_newv"
(** Create a new ListStore *)

(* Methods *)

external swap : t -> Tree_iter.t -> Tree_iter.t -> unit
  = "ml_gtk_list_store_swap"
(** Swaps [a] and [b] in [store]. Note that this function only works with
    unsorted stores. *)

external set_valuesv :
  t -> Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit
  = "ml_gtk_list_store_set_valuesv"
(** A variant of gtk_list_store_set_valist() which takes the columns and values
    as two arrays, instead of varargs. This function is mainly intended for
    language-bindings and in case the number of columns to change is not known
    until run-time. *)

external set_value : t -> Tree_iter.t -> int -> Gobject.Value.t -> unit
  = "ml_gtk_list_store_set_value"
(** Sets the data in the cell specified by [iter] and [column]. The type of
    [value] must be convertible to the type of the column. *)

external set_column_types : t -> int -> Gobject.Type.t array -> unit
  = "ml_gtk_list_store_set_column_types"
(** Sets the types of the columns of a list store.

    This function is meant primarily for objects that inherit from
    [GtkListStore], and should only be used when constructing a new instance.

    This function cannot be called after a row has been added, or a method on
    the [GtkTreeModel] interface is called. *)

external remove : t -> Tree_iter.t -> bool = "ml_gtk_list_store_remove"
(** Removes the given row from the list store. After being removed, [iter] is
    set to be the next valid row, or invalidated if it pointed to the last row
    in [list_store]. *)

external prepend : t -> Tree_iter.t = "ml_gtk_list_store_prepend"
(** Prepends a new row to [list_store]. [iter] will be changed to point to this
    new row. The row will be empty after this function is called. To fill in
    values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
*)

external move_before : t -> Tree_iter.t -> Tree_iter.t option -> unit
  = "ml_gtk_list_store_move_before"
(** Moves [iter] in [store] to the position before [position]. Note that this
    function only works with unsorted stores. If [position] is [NULL], [iter]
    will be moved to the end of the list. *)

external move_after : t -> Tree_iter.t -> Tree_iter.t option -> unit
  = "ml_gtk_list_store_move_after"
(** Moves [iter] in [store] to the position after [position]. Note that this
    function only works with unsorted stores. If [position] is [NULL], [iter]
    will be moved to the start of the list. *)

external iter_is_valid : t -> Tree_iter.t -> bool
  = "ml_gtk_list_store_iter_is_valid"
(** Checks if the given iter is a valid iter for this [GtkListStore].

    This function is slow. Only use it for debugging and/or testing purposes. *)

external insert_with_valuesv :
  t -> int -> int array -> Gobject.Value.t array -> int -> Tree_iter.t
  = "ml_gtk_list_store_insert_with_valuesv"
(** A variant of gtk_list_store_insert_with_values() which takes the columns and
    values as two arrays, instead of varargs.

    This function is mainly intended for language-bindings. *)

external insert_before : t -> Tree_iter.t option -> Tree_iter.t
  = "ml_gtk_list_store_insert_before"
(** Inserts a new row before [sibling]. If [sibling] is [NULL], then the row
    will be appended to the end of the list. [iter] will be changed to point to
    this new row. The row will be empty after this function is called. To fill
    in values, you need to call gtk_list_store_set() or
    gtk_list_store_set_value(). *)

external insert_after : t -> Tree_iter.t option -> Tree_iter.t
  = "ml_gtk_list_store_insert_after"
(** Inserts a new row after [sibling]. If [sibling] is [NULL], then the row will
    be prepended to the beginning of the list. [iter] will be changed to point
    to this new row. The row will be empty after this function is called. To
    fill in values, you need to call gtk_list_store_set() or
    gtk_list_store_set_value(). *)

external insert : t -> int -> Tree_iter.t = "ml_gtk_list_store_insert"
(** Creates a new row at [position]. [iter] will be changed to point to this new
    row. If [position] is -1 or is larger than the number of rows on the list,
    then the new row will be appended to the list. The row will be empty after
    this function is called. To fill in values, you need to call
    gtk_list_store_set() or gtk_list_store_set_value(). *)

external clear : t -> unit = "ml_gtk_list_store_clear"
(** Removes all rows from the list store. *)

external append : t -> Tree_iter.t = "ml_gtk_list_store_append"
(** Appends a new row to [list_store]. [iter] will be changed to point to this
    new row. The row will be empty after this function is called. To fill in
    values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
*)
