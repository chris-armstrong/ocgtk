(* GENERATED CODE - DO NOT EDIT *)
(* ColumnViewSorter: ColumnViewSorter *)

type t = [ `column_view_sorter | `sorter | `object_ ] Gobject.obj
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
    ]} *)

(* Methods *)

external get_primary_sort_order : t -> Gtk_enums.sorttype
  = "ml_gtk_column_view_sorter_get_primary_sort_order"
(** Returns the primary sort order.

    The primary sort order determines whether the triangle displayed in the
    column view header of the primary sort column points upwards or downwards.

    If there is no primary sort column, then this function returns
    [GTK_SORT_ASCENDING]. *)

external get_primary_sort_column :
  t -> Column_view_and__column_view_column.Column_view_column.t option
  = "ml_gtk_column_view_sorter_get_primary_sort_column"
(** Returns the primary sort column.

    The primary sort column is the one that displays the triangle in a column
    view header. *)

external get_nth_sort_column :
  t ->
  int ->
  Column_view_and__column_view_column.Column_view_column.t option
  * Gtk_enums.sorttype = "ml_gtk_column_view_sorter_get_nth_sort_column"
(** Gets the [position]'th sort column and its associated sort order.

    Use the [Gtk.Sorter::changed] signal to get notified when sort columns
    change. *)

external get_n_sort_columns : t -> int
  = "ml_gtk_column_view_sorter_get_n_sort_columns"
(** Returns the number of columns by which the sorter sorts.

    If the sorter of the primary sort column does not determine a total order,
    then the secondary sorters are consulted to break the ties.

    Use the [Gtk.Sorter::changed] signal to get notified when the number of sort
    columns changes. *)

(* Properties *)
