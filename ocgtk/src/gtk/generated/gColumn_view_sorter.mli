class column_view_sorter : Column_view_sorter.t ->
  object
    method get_n_sort_columns : unit -> int
    method get_primary_sort_column : unit -> GColumn_view_and__column_view_column.column_view_column option
    method get_primary_sort_order : unit -> Gtk_enums.sorttype
    method as_column_view_sorter : Column_view_sorter.t
  end

