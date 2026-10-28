(** The classes of {!Ocgtk.Column_view}, {!Ocgtk.Column_view_column}, defined
    together because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** {b The methods, signals and properties of a [ColumnView].}

    Presents a large dynamic list of items using multiple columns with headers.

    [GtkColumnView] uses the factories of its columns to generate a cell widget
    for each column, for each visible item and displays them together as the row
    for this item.

    The [Gtk.ColumnView:show-row-separators] and
    [Gtk.ColumnView:show-column-separators] properties offer a simple way to
    display separators between the rows or columns.

    [GtkColumnView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on {i rubberband selection}, using
    [Gtk.ColumnView:enable-rubberband].

    The column view supports sorting that can be customized by the user by
    clicking on column headers. To set this up, the [GtkSorter] returned by
    [Gtk.ColumnView.get_sorter] must be attached to a sort model for the data
    that the view is showing, and the columns must have sorters attached to them
    by calling [Gtk.ColumnViewColumn.set_sorter]. The initial sort order can be
    set with [Gtk.ColumnView.sort_by_column].

    The column view also supports interactive resizing and reordering of
    columns, via Drag-and-Drop of the column headers. This can be enabled or
    disabled with the [Gtk.ColumnView:reorderable] and
    [Gtk.ColumnViewColumn:resizable] properties.

    To learn more about the list widget framework, see the overview.

    {b CSS nodes}

    {[
    columnview[.column-separators][.rich-list][.navigation-sidebar][.data-table]
    ├── header
    │   ├── <column header>
    ┊   ┊
    │   ╰── <column header>
    │
    ├── listview
    │
    ┊
    ╰── [rubberband]
    ]}

    [GtkColumnView] uses a single CSS node named columnview. It may carry the
    .column-separators style class, when [Gtk.ColumnView:show-column-separators]
    property is set. Header widgets appear below a node with name header. The
    rows are contained in a [GtkListView] widget, so there is a listview node
    with the same structure as for a standalone [GtkListView] widget. If
    [Gtk.ColumnView:show-row-separators] is set, it will be passed on to the
    list view, causing its CSS node to carry the .separators style class. For
    rubberband selection, a node with name rubberband is used.

    The main columnview node may also carry style classes to select the style of
    list presentation: .rich-list, .navigation-sidebar or .data-table.

    {b Accessibility}

    [GtkColumnView] uses the [Gtk.AccessibleRole.tree_grid] role, header title
    widgets are using the [Gtk.AccessibleRole.column_header] role. The row
    widgets are using the [Gtk.AccessibleRole.row] role, and individual cells
    are using the [Gtk.AccessibleRole.grid_cell] role *)
class type column_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool ->
    callback:(position:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a row has been activated by the user, usually via activating
      the GtkListBase|list.activate-item action.

      This allows for a convenient way to handle activation in a columnview. See
      [Gtk.ListItem.set_activatable] for details on how to use this signal. *)

  (** {2:methods Methods} *)

  method append_column : column_view_column_t -> unit
  (** Appends the [column] to the end of the columns in [self]. *)

  method get_columns : unit -> Ocgio.List_model.list_model_t
  (** Gets the list of columns in this column view.

      This list is constant over the lifetime of [self] and can be used to
      monitor changes to the columns of [self] by connecting to the
      [Gio.ListModel::items-changed] signal. *)

  method get_enable_rubberband : unit -> bool
  (** Returns whether rows can be selected by dragging with the mouse. *)

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate section headers. *)

  method get_model : unit -> Selection_model.selection_model_t option
  (** Gets the model that's currently used to read the items displayed. *)

  method get_reorderable : unit -> bool
  (** Returns whether columns are reorderable. *)

  method get_row_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory set via [Gtk.ColumnView.set_row_factory]. *)

  method get_show_column_separators : unit -> bool
  (** Returns whether the list should show separators between columns. *)

  method get_show_row_separators : unit -> bool
  (** Returns whether the list should show separators between rows. *)

  method get_single_click_activate : unit -> bool
  (** Returns whether rows will be activated on single click and selected on
      hover. *)

  method get_sorter : unit -> Sorter.sorter_t option
  (** Returns a special sorter that reflects the users sorting choices in the
      column view.

      To allow users to customizable sorting by clicking on column headers, this
      sorter needs to be set on the sort model underneath the model that is
      displayed by the view.

      See [Gtk.ColumnViewColumn.set_sorter] for setting up per-column sorting.

      Here is an example:

      {[
      gtk_column_view_column_set_sorter (column, sorter);
      gtk_column_view_append_column (view, column);
      sorter = g_object_ref (gtk_column_view_get_sorter (view)));
      model = gtk_sort_list_model_new (store, sorter);
      selection = gtk_no_selection_new (model);
      gtk_column_view_set_model (view, selection);
      ]} *)

  method get_tab_behavior : unit -> Enums.listtabbehavior
  (** Gets the behavior set for the <kbd>Tab</kbd> key. *)

  method insert_column : int -> column_view_column_t -> unit
  (** Inserts a column at the given position in the columns of [self].

      If [column] is already a column of [self], it will be repositioned. *)

  method remove_column : column_view_column_t -> unit
  (** Removes the [column] from the list of columns of [self]. *)

  method scroll_to :
    int ->
    column_view_column_t option ->
    Enums.listscrollflags ->
    Raw.Scroll_info.t option ->
    unit
  (** Scroll to the row at the given position - or cell if a column is given -
      and performs the actions specified in [flags].

      This function works no matter if the columnview is shown or focused. If it
      isn't, then the changes will take effect once that happens. *)

  method set_enable_rubberband : bool -> unit
  (** Sets whether selections can be changed by dragging with the mouse. *)

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit
  (** Sets the factory to use for populating the [Gtk.ListHeader] objects used
      in section headers.

      If this factory is set to [NULL], the list will not show section headers.
  *)

  method set_model : Selection_model.selection_model_t option -> unit
  (** Sets the model to use.

      This must be a [Gtk.SelectionModel]. *)

  method set_reorderable : bool -> unit
  (** Sets whether columns should be reorderable by dragging. *)

  method set_row_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the factory used for configuring rows.

      The factory must be for configuring [Gtk.ColumnViewRow] objects.

      If this factory is not set - which is the default - then the defaults will
      be used.

      This factory is not used to set the widgets displayed in the individual
      cells. For that see [GtkColumnViewColumn.set_factory] and
      [GtkColumnViewCell]. *)

  method set_show_column_separators : bool -> unit
  (** Sets whether the list should show separators between columns. *)

  method set_show_row_separators : bool -> unit
  (** Sets whether the list should show separators between rows. *)

  method set_single_click_activate : bool -> unit
  (** Sets whether rows should be activated on single click and selected on
      hover. *)

  method set_tab_behavior : Enums.listtabbehavior -> unit
  (** Sets the <kbd>Tab</kbd> key behavior.

      This influences how the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd>
      keys move the focus in the columnview. *)

  method sort_by_column : column_view_column_t option -> Enums.sorttype -> unit
  (** Sets the sorting of the view.

      This function should be used to set up the initial sorting. At runtime,
      users can change the sorting of a column view by clicking on the list
      headers.

      This call only has an effect if the sorter returned by
      [Gtk.ColumnView.get_sorter] is set on a sort model, and
      [Gtk.ColumnViewColumn.set_sorter] has been called on [column] to associate
      a sorter with the column.

      If [column] is unset, the view will be unsorted. *)

  (** {2:conversions Conversions} *)

  method as_column_view : Raw.Column_view.t
end

(** {b The methods, signals and properties of a [ColumnViewColumn].}

    Represents the columns in a [GtkColumnView].

    The main ingredient for a [GtkColumnViewColumn] is the [GtkListItemFactory]
    that tells the columnview how to create cells for this column from items in
    the model.

    Columns have a title, and can optionally have a header menu set with
    [Gtk.ColumnViewColumn.set_header_menu].

    A sorter can be associated with a column using
    [Gtk.ColumnViewColumn.set_sorter], to let users influence sorting by
    clicking on the column header. *)
and column_view_column_t = object
  (** {2:methods Methods} *)

  method get_column_view : unit -> column_view_t option
  (** Gets the column view that's currently displaying this column.

      If [self] has not been added to a column view yet, [NULL] is returned. *)

  method get_expand : unit -> bool
  (** Returns whether this column should expand. *)

  method get_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items for this
      column. *)

  method get_fixed_width : unit -> int
  (** Gets the fixed width of the column. *)

  method get_header_menu : unit -> Ocgio.Menu_model.menu_model_t option
  (** Gets the menu model that is used to create the context menu for the column
      header. *)

  method get_id : unit -> string option
  (** Returns the ID set with [Gtk.ColumnViewColumn.set_id]. *)

  method get_resizable : unit -> bool
  (** Returns whether this column is resizable. *)

  method get_sorter : unit -> Sorter.sorter_t option
  (** Returns the sorter that is associated with the column. *)

  method get_title : unit -> string option
  (** Returns the title set with [Gtk.ColumnViewColumn.set_title]. *)

  method get_visible : unit -> bool
  (** Returns whether this column is visible. *)

  method set_expand : bool -> unit
  (** Sets the column to take available extra space.

      The extra space is shared equally amongst all columns that have are set to
      expand. *)

  method set_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items for this
      column. *)

  method set_fixed_width : int -> unit
  (** Sets the fixed width of the column.

      If [fixed_width] is -1, the fixed width of the column is unset.

      Setting a fixed width overrides the automatically calculated width.
      Interactive resizing also sets the “fixed-width” property. *)

  method set_header_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets the menu model that is used to create the context menu for the column
      header. *)

  method set_id : string option -> unit
  (** Sets the id of this column.

      GTK makes no use of this, but applications can use it when storing column
      view configuration.

      It is up to callers to ensure uniqueness of IDs. *)

  method set_resizable : bool -> unit
  (** Sets whether this column should be resizable by dragging. *)

  method set_sorter : Sorter.sorter_t option -> unit
  (** Associates a sorter with the column.

      If [sorter] is unset, the column will not let users change the sorting by
      clicking on its header.

      This sorter can be made active by clicking on the column header, or by
      calling [Gtk.ColumnView.sort_by_column].

      See [Gtk.ColumnView.get_sorter] for the necessary steps for setting up
      customizable sorting for [Gtk.ColumnView]. *)

  method set_title : string option -> unit
  (** Sets the title of this column.

      The title is displayed in the header of a [GtkColumnView] for this column
      and is therefore user-facing text that should be translated. *)

  method set_visible : bool -> unit
  (** Sets whether this column should be visible in views. *)

  (** {2:conversions Conversions} *)

  method as_column_view_column : Raw.Column_view_column.t
end

(** Wraps a raw handle of {!Ocgtk.Raw.Column_view.t}. *)
class column_view : Raw.Column_view.t -> column_view_t
(** Wraps a raw handle of {!Ocgtk.Raw.Column_view_column.t}. *)

and column_view_column : Raw.Column_view_column.t -> column_view_column_t

val new_ : Selection_model.selection_model_t option -> column_view_t
(** Creates a new [GtkColumnView].

    You most likely want to call [Gtk.ColumnView.append_column] to add columns
    next. *)

val new_ :
  string option ->
  List_item_factory.list_item_factory_t option ->
  column_view_column_t
[@@ocaml.doc
  "Creates a new [GtkColumnViewColumn] that uses the given [factory] for\n\
   mapping items to widgets.\n\n\
   You most likely want to call [Gtk.ColumnView.append_column] next.\n\n\
   The function takes ownership of the argument, so you can write code like:\n\n\
   {[\n\
   column = gtk_column_view_column_new (_(\"Name\"),\n\
  \  gtk_builder_list_item_factory_new_from_resource (\"/name.ui\"));\n\
   ]}"]
