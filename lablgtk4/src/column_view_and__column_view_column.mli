(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Column_view : sig
  type t = [`column_view | `widget | `initially_unowned] Gobject.obj

  val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

  (** Create a new ColumnView *)
  external new_ : Selection_model.t option -> t = "ml_gtk_column_view_new"

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
  external sort_by_column : t -> Column_view_column.t option -> Gtk_enums.sorttype -> unit = "ml_gtk_column_view_sort_by_column"

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
  external set_row_factory : t -> List_item_factory.t option -> unit = "ml_gtk_column_view_set_row_factory"

  (** Sets whether columns should be reorderable by dragging. *)
  external set_reorderable : t -> bool -> unit = "ml_gtk_column_view_set_reorderable"

  (** Sets the model to use.

  This must be a [iface@Gtk.SelectionModel]. *)
  external set_model : t -> Selection_model.t option -> unit = "ml_gtk_column_view_set_model"

  (** Sets the `GtkListItemFactory` to use for populating the
  [class@Gtk.ListHeader] objects used in section headers.

  If this factory is set to %NULL, the list will not show
  section headers. *)
  external set_header_factory : t -> List_item_factory.t option -> unit = "ml_gtk_column_view_set_header_factory"

  (** Sets whether selections can be changed by dragging with the mouse. *)
  external set_enable_rubberband : t -> bool -> unit = "ml_gtk_column_view_set_enable_rubberband"

  (** Scroll to the row at the given position - or cell if a column is
  given - and performs the actions specified in @flags.

  This function works no matter if the listview is shown or focused.
  If it isn't, then the changes will take effect once that happens. *)
  external scroll_to : t -> int -> Column_view_column.t option -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit = "ml_gtk_column_view_scroll_to"

  (** Removes the @column from the list of columns of @self. *)
  external remove_column : t -> Column_view_column.t -> unit = "ml_gtk_column_view_remove_column"

  (** Inserts a column at the given position in the columns of @self.

  If @column is already a column of @self, it will be repositioned. *)
  external insert_column : t -> int -> Column_view_column.t -> unit = "ml_gtk_column_view_insert_column"

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
  external get_sorter : t -> Sorter.t option = "ml_gtk_column_view_get_sorter"

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
  external get_row_factory : t -> List_item_factory.t option = "ml_gtk_column_view_get_row_factory"

  (** Returns whether columns are reorderable. *)
  external get_reorderable : t -> bool = "ml_gtk_column_view_get_reorderable"

  (** Gets the model that's currently used to read the items displayed. *)
  external get_model : t -> Selection_model.t option = "ml_gtk_column_view_get_model"

  (** Gets the factory that's currently used to populate section headers. *)
  external get_header_factory : t -> List_item_factory.t option = "ml_gtk_column_view_get_header_factory"

  (** Returns whether rows can be selected by dragging with the mouse. *)
  external get_enable_rubberband : t -> bool = "ml_gtk_column_view_get_enable_rubberband"

  (** Appends the @column to the end of the columns in @self. *)
  external append_column : t -> Column_view_column.t -> unit = "ml_gtk_column_view_append_column"


end

and Column_view_column
 : sig
  type t = [`column_view_column | `object_] Gobject.obj

  (** Create a new ColumnViewColumn *)
  external new_ : string option -> List_item_factory.t option -> t = "ml_gtk_column_view_column_new"

  (* Properties *)

  (** Sets whether this column should be visible in views. *)
  external set_visible : t -> bool -> unit = "ml_gtk_column_view_column_set_visible"

  (** Sets the title of this column.

  The title is displayed in the header of a `GtkColumnView`
  for this column and is therefore user-facing text that should
  be translated. *)
  external set_title : t -> string option -> unit = "ml_gtk_column_view_column_set_title"

  (** Associates a sorter with the column.

  If @sorter is %NULL, the column will not let users change
  the sorting by clicking on its header.

  This sorter can be made active by clicking on the column
  header, or by calling [method@Gtk.ColumnView.sort_by_column].

  See [method@Gtk.ColumnView.get_sorter] for the necessary steps
  for setting up customizable sorting for [class@Gtk.ColumnView]. *)
  external set_sorter : t -> Sorter.t option -> unit = "ml_gtk_column_view_column_set_sorter"

  (** Sets whether this column should be resizable by dragging. *)
  external set_resizable : t -> bool -> unit = "ml_gtk_column_view_column_set_resizable"

  (** Sets the id of this column.

  GTK makes no use of this, but applications can use it when
  storing column view configuration.

  It is up to callers to ensure uniqueness of IDs. *)
  external set_id : t -> string option -> unit = "ml_gtk_column_view_column_set_id"

  (** If @fixed_width is not -1, sets the fixed width of @column;
  otherwise unsets it.

  Setting a fixed width overrides the automatically calculated
  width. Interactive resizing also sets the “fixed-width” property. *)
  external set_fixed_width : t -> int -> unit = "ml_gtk_column_view_column_set_fixed_width"

  (** Sets the `GtkListItemFactory` to use for populating list items for this
  column. *)
  external set_factory : t -> List_item_factory.t option -> unit = "ml_gtk_column_view_column_set_factory"

  (** Sets the column to take available extra space.

  The extra space is shared equally amongst all columns that
  have the expand set to %TRUE. *)
  external set_expand : t -> bool -> unit = "ml_gtk_column_view_column_set_expand"

  (** Returns whether this column is visible. *)
  external get_visible : t -> bool = "ml_gtk_column_view_column_get_visible"

  (** Returns the title set with gtk_column_view_column_set_title(). *)
  external get_title : t -> string option = "ml_gtk_column_view_column_get_title"

  (** Returns the sorter that is associated with the column. *)
  external get_sorter : t -> Sorter.t option = "ml_gtk_column_view_column_get_sorter"

  (** Returns whether this column is resizable. *)
  external get_resizable : t -> bool = "ml_gtk_column_view_column_get_resizable"

  (** Returns the ID set with gtk_column_view_column_set_id(). *)
  external get_id : t -> string option = "ml_gtk_column_view_column_get_id"

  (** Gets the fixed width of the column. *)
  external get_fixed_width : t -> int = "ml_gtk_column_view_column_get_fixed_width"

  (** Gets the factory that's currently used to populate list items for
  this column. *)
  external get_factory : t -> List_item_factory.t option = "ml_gtk_column_view_column_get_factory"

  (** Returns whether this column should expand. *)
  external get_expand : t -> bool = "ml_gtk_column_view_column_get_expand"

  (** Gets the column view that's currently displaying this column.

  If @self has not been added to a column view yet, %NULL is returned. *)
  external get_column_view : t -> Column_view.t option = "ml_gtk_column_view_column_get_column_view"


end
