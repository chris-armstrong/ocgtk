class type column_view_sorter_t = object
  inherit Sorter.sorter_t

  (** {2:methods Methods} *)

  method get_n_sort_columns : unit -> int
  (** Returns the number of columns by which the sorter sorts.

      If the sorter of the primary sort column does not determine a total order,
      then the secondary sorters are consulted to break the ties.

      Use the [Gtk.Sorter::changed] signal to get notified when the number of
      sort columns changes. *)

  method get_primary_sort_column :
    unit -> Column_view_and__column_view_column.column_view_column_t option
  (** Returns the primary sort column.

      The primary sort column is the one that displays the triangle in a column
      view header. *)

  method get_primary_sort_order : unit -> Enums.sorttype
  (** Returns the primary sort order.

      The primary sort order determines whether the triangle displayed in the
      column view header of the primary sort column points upwards or downwards.

      If there is no primary sort column, then this function returns
      [GTK_SORT_ASCENDING]. *)

  (** {2:conversions Conversions} *)

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
