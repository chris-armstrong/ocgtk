class type column_view_sorter_t = object
  inherit Sorter.sorter_t
  method get_n_sort_columns : unit -> int

  method get_primary_sort_column :
    unit -> Column_view_and__column_view_column.column_view_column_t option

  method get_primary_sort_order : unit -> Enums.sorttype
  method as_column_view_sorter : Raw.Column_view_sorter.t
end

(* High-level class for ColumnViewSorter *)
class column_view_sorter (obj : Raw.Column_view_sorter.t) : column_view_sorter_t
  =
  object (self)
    inherit Sorter.sorter (obj :> Raw.Sorter.t)

    method get_n_sort_columns : unit -> int =
      fun () -> Raw.Column_view_sorter.get_n_sort_columns obj

    method get_primary_sort_column :
        unit -> Column_view_and__column_view_column.column_view_column_t option
        =
      fun () ->
        Option.map
          (fun ret ->
            new Column_view_and__column_view_column.column_view_column ret)
          (Raw.Column_view_sorter.get_primary_sort_column obj)

    method get_primary_sort_order : unit -> Enums.sorttype =
      fun () -> Raw.Column_view_sorter.get_primary_sort_order obj

    method as_column_view_sorter = obj
  end
