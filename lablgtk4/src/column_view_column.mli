(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColumnViewColumn *)

type t = Gtk.widget

(** Create a new ColumnViewColumn *)
external new_ : string option -> Gtk.widget option -> t = "ml_gtk_column_view_column_new"

(* Properties *)

(** Sets whether this column should be visible in views. *)
external set_visible : t -> bool -> unit = "ml_gtk_column_view_column_set_visible"

(** Sets the title of this column.

The title is displayed in the header of a `GtkColumnView`
for this column and is therefore user-facing text that should
be translated. *)
external set_title : t -> string option -> unit = "ml_gtk_column_view_column_set_title"

(** Associates a sorter with the column.

If @sorter is %NULL, the column will not let users change
the sorting by clicking on its header.

This sorter can be made active by clicking on the column
header, or by calling [method@Gtk.ColumnView.sort_by_column].

See [method@Gtk.ColumnView.get_sorter] for the necessary steps
for setting up customizable sorting for [class@Gtk.ColumnView]. *)
external set_sorter : t -> Gtk.widget option -> unit = "ml_gtk_column_view_column_set_sorter"

(** Sets whether this column should be resizable by dragging. *)
external set_resizable : t -> bool -> unit = "ml_gtk_column_view_column_set_resizable"

(** Sets the id of this column.

GTK makes no use of this, but applications can use it when
storing column view configuration.

It is up to callers to ensure uniqueness of IDs. *)
external set_id : t -> string option -> unit = "ml_gtk_column_view_column_set_id"

(** If @fixed_width is not -1, sets the fixed width of @column;
otherwise unsets it.

Setting a fixed width overrides the automatically calculated
width. Interactive resizing also sets the “fixed-width” property. *)
external set_fixed_width : t -> int -> unit = "ml_gtk_column_view_column_set_fixed_width"

(** Sets the `GtkListItemFactory` to use for populating list items for this
column. *)
external set_factory : t -> Gtk.widget option -> unit = "ml_gtk_column_view_column_set_factory"

(** Sets the column to take available extra space.

The extra space is shared equally amongst all columns that
have the expand set to %TRUE. *)
external set_expand : t -> bool -> unit = "ml_gtk_column_view_column_set_expand"

(** Returns whether this column is visible. *)
external get_visible : t -> bool = "ml_gtk_column_view_column_get_visible"

(** Returns the title set with gtk_column_view_column_set_title(). *)
external get_title : t -> string = "ml_gtk_column_view_column_get_title"

(** Returns the sorter that is associated with the column. *)
external get_sorter : t -> Gtk.widget = "ml_gtk_column_view_column_get_sorter"

(** Returns whether this column is resizable. *)
external get_resizable : t -> bool = "ml_gtk_column_view_column_get_resizable"

(** Returns the ID set with gtk_column_view_column_set_id(). *)
external get_id : t -> string = "ml_gtk_column_view_column_get_id"

(** Gets the fixed width of the column. *)
external get_fixed_width : t -> int = "ml_gtk_column_view_column_get_fixed_width"

(** Gets the factory that's currently used to populate list items for
this column. *)
external get_factory : t -> Gtk.widget = "ml_gtk_column_view_column_get_factory"

(** Returns whether this column should expand. *)
external get_expand : t -> bool = "ml_gtk_column_view_column_get_expand"

(** Gets the column view that's currently displaying this column.

If @self has not been added to a column view yet, %NULL is returned. *)
external get_column_view : t -> Gtk.widget = "ml_gtk_column_view_column_get_column_view"

