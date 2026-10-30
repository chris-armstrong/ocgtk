(* GENERATED CODE - DO NOT EDIT *)
(* ColumnView, a member of the cyclic module Column_view_and__column_view_column *)

(** Presents a large dynamic list of items using multiple columns with headers.

    [GtkColumnView] uses the factories of its columns to generate a cell widget
    for each column, for each visible item and displays them together as the row
    for this item.

    The
    {{!Ocgtk.Raw.Column_view.val-get_show_row_separators}[Gtk.ColumnView:show-row-separators]}
    and
    {{!Ocgtk.Raw.Column_view.val-get_show_column_separators}[Gtk.ColumnView:show-column-separators]}
    properties offer a simple way to display separators between the rows or
    columns.

    [GtkColumnView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on {i rubberband selection}, using
    {{!Ocgtk.Raw.Column_view.val-get_enable_rubberband}[Gtk.ColumnView:enable-rubberband]}.

    The column view supports sorting that can be customized by the user by
    clicking on column headers. To set this up, the [GtkSorter] returned by
    {{!Ocgtk.Raw.Column_view.val-get_sorter}[Gtk.ColumnView.get_sorter]} must be
    attached to a sort model for the data that the view is showing, and the
    columns must have sorters attached to them by calling
    {{!Ocgtk.Raw.Column_view_column.val-set_sorter}[Gtk.ColumnViewColumn.set_sorter]}.
    The initial sort order can be set with
    {{!Ocgtk.Raw.Column_view.val-sort_by_column}[Gtk.ColumnView.sort_by_column]}.

    The column view also supports interactive resizing and reordering of
    columns, via Drag-and-Drop of the column headers. This can be enabled or
    disabled with the
    {{!Ocgtk.Raw.Column_view.val-get_reorderable}[Gtk.ColumnView:reorderable]}
    and
    {{!Ocgtk.Raw.Column_view_column.val-get_resizable}[Gtk.ColumnViewColumn:resizable]}
    properties.

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
    .column-separators style class, when
    {{!Ocgtk.Raw.Column_view.val-get_show_column_separators}[Gtk.ColumnView:show-column-separators]}
    property is set. Header widgets appear below a node with name header. The
    rows are contained in a [GtkListView] widget, so there is a listview node
    with the same structure as for a standalone [GtkListView] widget. If
    {{!Ocgtk.Raw.Column_view.val-get_show_row_separators}[Gtk.ColumnView:show-row-separators]}
    is set, it will be passed on to the list view, causing its CSS node to carry
    the .separators style class. For rubberband selection, a node with name
    rubberband is used.

    The main columnview node may also carry style classes to select the style of
    list presentation: .rich-list, .navigation-sidebar or .data-table.

    {b Accessibility}

    [GtkColumnView] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-TREE_GRID}[Gtk.AccessibleRole.tree_grid]}
    role, header title widgets are using the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-COLUMN_HEADER}[Gtk.AccessibleRole.column_header]}
    role. The row widgets are using the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-ROW}[Gtk.AccessibleRole.row]}
    role, and individual cells are using the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GRID_CELL}[Gtk.AccessibleRole.grid_cell]}
    role

    The class built on this module is in {!Ocgtk.Column_view}. *)

include module type of struct
  include Column_view_and__column_view_column.Column_view
end
