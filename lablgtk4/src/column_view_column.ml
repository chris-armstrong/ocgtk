(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColumnViewColumn *)

type t = Gtk.widget

external new_ : string option -> Gtk.widget option -> t = "ml_gtk_column_view_column_new"

(* Properties *)

external get_expand : t -> bool = "ml_gtk_column_view_column_get_expand"

external set_expand : t -> bool -> unit = "ml_gtk_column_view_column_set_expand"

external get_fixed_width : t -> int = "ml_gtk_column_view_column_get_fixed_width"

external set_fixed_width : t -> int -> unit = "ml_gtk_column_view_column_set_fixed_width"

external get_id : t -> string = "ml_gtk_column_view_column_get_id"

external set_id : t -> string -> unit = "ml_gtk_column_view_column_set_id"

external get_resizable : t -> bool = "ml_gtk_column_view_column_get_resizable"

external set_resizable : t -> bool -> unit = "ml_gtk_column_view_column_set_resizable"

external get_title : t -> string = "ml_gtk_column_view_column_get_title"

external set_title : t -> string -> unit = "ml_gtk_column_view_column_set_title"

external get_visible : t -> bool = "ml_gtk_column_view_column_get_visible"

external set_visible : t -> bool -> unit = "ml_gtk_column_view_column_set_visible"

external set_sorter : t -> Gtk.widget option -> unit = "ml_gtk_column_view_column_set_sorter"

external set_factory : t -> Gtk.widget option -> unit = "ml_gtk_column_view_column_set_factory"

external get_sorter : t -> Gtk.widget = "ml_gtk_column_view_column_get_sorter"

external get_factory : t -> Gtk.widget = "ml_gtk_column_view_column_get_factory"

external get_column_view : t -> Gtk.widget = "ml_gtk_column_view_column_get_column_view"

