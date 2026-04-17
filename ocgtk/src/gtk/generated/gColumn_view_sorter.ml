class type column_view_sorter_t = object
    inherit GSorter.sorter_t
    method get_n_sort_columns : unit -> int
    method get_primary_sort_column : unit -> GColumn_view_and__column_view_column.column_view_column_t option
    method get_primary_sort_order : unit -> Gtk_enums.sorttype
    method as_column_view_sorter : Column_view_sorter.t
end

(* High-level class for ColumnViewSorter *)
class column_view_sorter (obj : Column_view_sorter.t) : column_view_sorter_t = object (self)
  inherit GSorter.sorter (obj :> Sorter.t)

  method get_n_sort_columns : unit -> int =
    fun () ->
      (Column_view_sorter.get_n_sort_columns obj)

  method get_primary_sort_column : unit -> GColumn_view_and__column_view_column.column_view_column_t option =
    fun () ->
      Option.map (fun ret -> new GColumn_view_and__column_view_column.column_view_column ret) (Column_view_sorter.get_primary_sort_column obj)

  method get_primary_sort_order : unit -> Gtk_enums.sorttype =
    fun () ->
      (Column_view_sorter.get_primary_sort_order obj)

    method as_column_view_sorter = obj
end

