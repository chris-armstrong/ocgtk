class type column_view_sorter_t = object
  inherit Sorter.sorter_t
  method get_n_sort_columns : unit -> int

  method get_primary_sort_column :
    unit -> Column_view_and__column_view_column.column_view_column_t option

  method get_primary_sort_order : unit -> Enums.sorttype
  method as_column_view_sorter : Raw.Column_view_sorter.t
end

class column_view_sorter : Raw.Column_view_sorter.t -> column_view_sorter_t
