class type column_view_sorter_t = object
    method get_n_sort_columns : unit -> int
    method get_primary_sort_column : unit -> GColumn_view_and__column_view_column.column_view_column_t option
    method get_primary_sort_order : unit -> Gtk_enums.sorttype
    method as_column_view_sorter : Column_view_sorter.t
end

class column_view_sorter : Column_view_sorter.t -> column_view_sorter_t

