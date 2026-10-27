(** Sorts [Gtk.ColumnView] columns.

    The sorter returned by [Gtk.ColumnView.get_sorter] is a
    [GtkColumnViewSorter].

    In column views, sorting can be configured by associating sorters with
    columns, and users can invert sort order by clicking on column headers. The
    API of [GtkColumnViewSorter] is designed to allow saving and restoring this
    configuration.

    If you are only interested in the primary sort column (i.e. the column where
    a sort indicator is shown in the header), then you can just look at
    [Gtk.ColumnViewSorter:primary-sort-column] and
    [Gtk.ColumnViewSorter:primary-sort-order].

    If you want to store the full sort configuration, including secondary sort
    columns that are used for tie breaking, then you can use
    [Gtk.ColumnViewSorter.get_nth_sort_column]. To get notified about changes,
    use [Gtk.Sorter::changed].

    To restore a saved sort configuration on a [GtkColumnView], use code like:

    {[
    sorter = gtk_column_view_get_sorter (view);
    for (i = gtk_column_view_sorter_get_n_sort_columns (sorter) - 1; i >= 0; i--)
      {
        column = gtk_column_view_sorter_get_nth_sort_column (sorter, i, &order);
        gtk_column_view_sort_by_column (view, column, order);
      }
    ]}

    Its methods, signals and properties are on
    {!class-type-column_view_sorter_t}. The functions it is built on are in
    {!Ocgtk.Raw.Column_view_sorter}. *)

(** The methods, signals and properties of a [GtkColumnViewSorter]. *)
class type column_view_sorter_t = object
  inherit Sorter.sorter_t
  method get_n_sort_columns : unit -> int

  method get_primary_sort_column :
    unit -> Column_view_and__column_view_column.column_view_column_t option

  method get_primary_sort_order : unit -> Enums.sorttype
  method as_column_view_sorter : Raw.Column_view_sorter.t
end

class column_view_sorter : Raw.Column_view_sorter.t -> column_view_sorter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Column_view_sorter.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkColumnViewSorter], give one already wrapped. *)
