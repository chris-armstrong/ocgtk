(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ColumnViewColumn from cyclic group Column_view_and__column_view_column *)

(** Represents the columns in a [GtkColumnView].

    Its methods, signals and properties are on
    {!class-type-column_view_column_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Column_view_column}. *)

(** {1:class Class} *)

class type column_view_column_t =
  Column_view_and__column_view_column.column_view_column_t
(** {b The methods, signals and properties of a [ColumnViewColumn].}

    Represents the columns in a [GtkColumnView].

    The main ingredient for a [GtkColumnViewColumn] is the [GtkListItemFactory]
    that tells the columnview how to create cells for this column from items in
    the model.

    Columns have a title, and can optionally have a header menu set with
    {{!Ocgtk.Column_view_column.class-type-column_view_column_t.method-set_header_menu}
     [Gtk.ColumnViewColumn.set_header_menu]}.

    A sorter can be associated with a column using
    {{!Ocgtk.Column_view_column.class-type-column_view_column_t.method-set_sorter}
     [Gtk.ColumnViewColumn.set_sorter]}, to let users influence sorting by
    clicking on the column header. *)

class column_view_column : Raw.Column_view_column.t -> column_view_column_t
(** Wraps a raw handle of {!Ocgtk.Raw.Column_view_column.t}. *)

(** {1:description Description}

    Represents the columns in a [GtkColumnView].

    The main ingredient for a [GtkColumnViewColumn] is the [GtkListItemFactory]
    that tells the columnview how to create cells for this column from items in
    the model.

    Columns have a title, and can optionally have a header menu set with
    {{!Ocgtk.Column_view_column.class-type-column_view_column_t.method-set_header_menu}
     [Gtk.ColumnViewColumn.set_header_menu]}.

    A sorter can be associated with a column using
    {{!Ocgtk.Column_view_column.class-type-column_view_column_t.method-set_sorter}
     [Gtk.ColumnViewColumn.set_sorter]}, to let users influence sorting by
    clicking on the column header. *)

(** {1:constructors Constructors} *)

val new_ :
  string option ->
  List_item_factory.list_item_factory_t option ->
  column_view_column_t
[@@ocaml.doc
  "Creates a new [GtkColumnViewColumn] that uses the given [factory] for\n\
   mapping items to widgets.\n\n\
   You most likely want to call \
   {{!Ocgtk.Column_view.class-type-column_view_t.method-append_column}[Gtk.ColumnView.append_column]} \
   next.\n\n\
   The function takes ownership of the argument, so you can write code like:\n\n\
   {[\n\
   column = gtk_column_view_column_new (_(\"Name\"),\n\
  \  gtk_builder_list_item_factory_new_from_resource (\"/name.ui\"));\n\
   ]}"]
