(* High-level class for ColumnViewSorter *)
class column_view_sorter (obj : Column_view_sorter.t) = object (self)

  method get_n_sort_columns : unit -> int = fun () -> (Column_view_sorter.get_n_sort_columns obj )

  method get_primary_sort_column : unit -> GColumn_view_and__column_view_column.column_view_column option = fun () -> Option.map (fun ret -> new GColumn_view_and__column_view_column.column_view_column ret) (Column_view_sorter.get_primary_sort_column obj )

  method get_primary_sort_order : unit -> Gtk_enums.sorttype = fun () -> (Column_view_sorter.get_primary_sort_order obj )

    method as_column_view_sorter = obj
end

