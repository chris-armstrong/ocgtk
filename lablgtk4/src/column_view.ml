(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColumnView *)

type t = [`column_view | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new ColumnView *)
external new_ : Gtk.widget option -> t = "ml_gtk_column_view_new"

(* Properties *)

(** Sets the sorting of the view.

This function should be used to set up the initial sorting.
At runtime, users can change the sorting of a column view
by clicking on the list headers.

This call only has an effect if the sorter returned by
[method@Gtk.ColumnView.get_sorter] is set on a sort model,
and [method@Gtk.ColumnViewColumn.set_sorter] has been called
on @column to associate a sorter with the column.

If @column is %NULL, the view will be unsorted. *)
external sort_by_column : t -> Gtk.widget option -> Gtk_enums.sorttype -> unit = "ml_gtk_column_view_sort_by_column"

(** Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)
external set_tab_behavior : t -> Gtk_enums.listtabbehavior -> unit = "ml_gtk_column_view_set_tab_behavior"

(** Sets whether rows should be activated on single click and
selected on hover. *)
external set_single_click_activate : t -> bool -> unit = "ml_gtk_column_view_set_single_click_activate"

(** Sets whether the list should show separators
between rows. *)
external set_show_row_separators : t -> bool -> unit = "ml_gtk_column_view_set_show_row_separators"

(** Sets whether the list should show separators
between columns. *)
external set_show_column_separators : t -> bool -> unit = "ml_gtk_column_view_set_show_column_separators"

(** Sets the factory used for configuring rows. The factory must be for configuring
[class@Gtk.ColumnViewRow] objects.

If this factory is not set - which is the default - then the defaults will be used.

This factory is not used to set the widgets displayed in the individual cells. For
that see [method@GtkColumnViewColumn.set_factory] and [class@GtkColumnViewCell]. *)
external set_row_factory : t -> Gtk.widget option -> unit = "ml_gtk_column_view_set_row_factory"

(** Sets whether columns should be reorderable by dragging. *)
external set_reorderable : t -> bool -> unit = "ml_gtk_column_view_set_reorderable"

(** Sets the model to use.

This must be a [iface@Gtk.SelectionModel]. *)
external set_model : t -> Gtk.widget option -> unit = "ml_gtk_column_view_set_model"

(** Sets the `GtkListItemFactory` to use for populating the
[class@Gtk.ListHeader] objects used in section headers.

If this factory is set to %NULL, the list will not show
section headers. *)
external set_header_factory : t -> Gtk.widget option -> unit = "ml_gtk_column_view_set_header_factory"

(** Sets whether selections can be changed by dragging with the mouse. *)
external set_enable_rubberband : t -> bool -> unit = "ml_gtk_column_view_set_enable_rubberband"

(** Scroll to the row at the given position - or cell if a column is
given - and performs the actions specified in @flags.

This function works no matter if the listview is shown or focused.
If it isn't, then the changes will take effect once that happens. *)
external scroll_to : t -> int -> Gtk.widget option -> Gtk_enums.listscrollflags -> Gtk.widget option -> unit = "ml_gtk_column_view_scroll_to"

(** Removes the @column from the list of columns of @self. *)
external remove_column : t -> Gtk.widget -> unit = "ml_gtk_column_view_remove_column"

(** Inserts a column at the given position in the columns of @self.

If @column is already a column of @self, it will be repositioned. *)
external insert_column : t -> int -> Gtk.widget -> unit = "ml_gtk_column_view_insert_column"

(** Gets the behavior set for the <kbd>Tab</kbd> key. *)
external get_tab_behavior : t -> Gtk_enums.listtabbehavior = "ml_gtk_column_view_get_tab_behavior"

(** Returns a special sorter that reflects the users sorting
choices in the column view.

To allow users to customizable sorting by clicking on column
headers, this sorter needs to be set on the sort model underneath
the model that is displayed by the view.

See [method@Gtk.ColumnViewColumn.set_sorter] for setting up
per-column sorting.

Here is an example:
```c
gtk_column_view_column_set_sorter (column, sorter);
gtk_column_view_append_column (view, column);
sorter = g_object_ref (gtk_column_view_get_sorter (view)));
model = gtk_sort_list_model_new (store, sorter);
selection = gtk_no_selection_new (model);
gtk_column_view_set_model (view, selection);
``` *)
external get_sorter : t -> Gtk.widget = "ml_gtk_column_view_get_sorter"

(** Returns whether rows will be activated on single click and
selected on hover. *)
external get_single_click_activate : t -> bool = "ml_gtk_column_view_get_single_click_activate"

(** Returns whether the list should show separators
between rows. *)
external get_show_row_separators : t -> bool = "ml_gtk_column_view_get_show_row_separators"

(** Returns whether the list should show separators
between columns. *)
external get_show_column_separators : t -> bool = "ml_gtk_column_view_get_show_column_separators"

(** Gets the factory set via [method@Gtk.ColumnView.set_row_factory]. *)
external get_row_factory : t -> Gtk.widget = "ml_gtk_column_view_get_row_factory"

(** Returns whether columns are reorderable. *)
external get_reorderable : t -> bool = "ml_gtk_column_view_get_reorderable"

(** Gets the model that's currently used to read the items displayed. *)
external get_model : t -> Gtk.widget = "ml_gtk_column_view_get_model"

(** Gets the factory that's currently used to populate section headers. *)
external get_header_factory : t -> Gtk.widget = "ml_gtk_column_view_get_header_factory"

(** Returns whether rows can be selected by dragging with the mouse. *)
external get_enable_rubberband : t -> bool = "ml_gtk_column_view_get_enable_rubberband"

(** Appends the @column to the end of the columns in @self. *)
external append_column : t -> Gtk.widget -> unit = "ml_gtk_column_view_append_column"

