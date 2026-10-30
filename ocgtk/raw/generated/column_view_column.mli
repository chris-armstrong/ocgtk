(* GENERATED CODE - DO NOT EDIT *)
(* ColumnViewColumn, a member of the cyclic module Column_view_and__column_view_column *)

(** Represents the columns in a [GtkColumnView].

    The main ingredient for a [GtkColumnViewColumn] is the [GtkListItemFactory]
    that tells the columnview how to create cells for this column from items in
    the model.

    Columns have a title, and can optionally have a header menu set with
    {{!Ocgtk.Raw.Column_view_column.val-set_header_menu}[Gtk.ColumnViewColumn.set_header_menu]}.

    A sorter can be associated with a column using
    {{!Ocgtk.Raw.Column_view_column.val-set_sorter}[Gtk.ColumnViewColumn.set_sorter]},
    to let users influence sorting by clicking on the column header.

    The class built on this module is in {!Ocgtk.Column_view_column}. *)

include module type of struct
  include Column_view_and__column_view_column.Column_view_column
end
