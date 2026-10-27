(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ColumnViewColumn from cyclic group Column_view_and__column_view_column *)

(** Represents the columns in a [GtkColumnView].

    The main ingredient for a [GtkColumnViewColumn] is the [GtkListItemFactory]
    that tells the columnview how to create cells for this column from items in
    the model.

    Columns have a title, and can optionally have a header menu set with
    [Gtk.ColumnViewColumn.set_header_menu].

    A sorter can be associated with a column using
    [Gtk.ColumnViewColumn.set_sorter], to let users influence sorting by
    clicking on the column header.

    Its methods, signals and properties are on
    {!class-type-column_view_column_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Column_view_column}. *)

class type column_view_column_t =
  Column_view_and__column_view_column.column_view_column_t
(** The methods, signals and properties of a [GtkColumnViewColumn]. *)

class column_view_column : Raw.Column_view_column.t -> column_view_column_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Column_view_column.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkColumnViewColumn], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ :
  string option ->
  List_item_factory.list_item_factory_t option ->
  column_view_column_t
[@@ocaml.doc
  "Creates a new [GtkColumnViewColumn] that uses the given [factory] for\n\
   mapping items to widgets.\n\n\
   You most likely want to call [Gtk.ColumnView.append_column] next.\n\n\
   The function takes ownership of the argument, so you can write code like:\n\n\
   {[\n\
   column = gtk_column_view_column_new (_(\"Name\"),\n\
  \  gtk_builder_list_item_factory_new_from_resource (\"/name.ui\"));\n\
   ]}"]
