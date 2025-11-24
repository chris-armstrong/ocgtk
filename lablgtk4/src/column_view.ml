(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColumnView *)

type t = Gtk.widget

external new_ : Gtk.widget option -> t = "ml_gtk_column_view_new"

(* Properties *)

external get_enable_rubberband : t -> bool = "ml_gtk_column_view_get_enable_rubberband"

external set_enable_rubberband : t -> bool -> unit = "ml_gtk_column_view_set_enable_rubberband"

external get_reorderable : t -> bool = "ml_gtk_column_view_get_reorderable"

external set_reorderable : t -> bool -> unit = "ml_gtk_column_view_set_reorderable"

external get_show_column_separators : t -> bool = "ml_gtk_column_view_get_show_column_separators"

external set_show_column_separators : t -> bool -> unit = "ml_gtk_column_view_set_show_column_separators"

external get_show_row_separators : t -> bool = "ml_gtk_column_view_get_show_row_separators"

external set_show_row_separators : t -> bool -> unit = "ml_gtk_column_view_set_show_row_separators"

external get_single_click_activate : t -> bool = "ml_gtk_column_view_get_single_click_activate"

external set_single_click_activate : t -> bool -> unit = "ml_gtk_column_view_set_single_click_activate"

external sort_by_column : t -> Gtk.widget option -> Gtk_enums.sorttype -> unit = "ml_gtk_column_view_sort_by_column"

external set_tab_behavior : t -> Gtk_enums.listtabbehavior -> unit = "ml_gtk_column_view_set_tab_behavior"

external set_row_factory : t -> Gtk.widget option -> unit = "ml_gtk_column_view_set_row_factory"

external set_model : t -> Gtk.widget option -> unit = "ml_gtk_column_view_set_model"

external set_header_factory : t -> Gtk.widget option -> unit = "ml_gtk_column_view_set_header_factory"

external scroll_to : t -> int -> Gtk.widget option -> Gtk_enums.listscrollflags -> Gtk.widget option -> unit = "ml_gtk_column_view_scroll_to"

external remove_column : t -> Gtk.widget -> unit = "ml_gtk_column_view_remove_column"

external insert_column : t -> int -> Gtk.widget -> unit = "ml_gtk_column_view_insert_column"

external get_tab_behavior : t -> Gtk_enums.listtabbehavior = "ml_gtk_column_view_get_tab_behavior"

external get_sorter : t -> Gtk.widget = "ml_gtk_column_view_get_sorter"

external get_row_factory : t -> Gtk.widget = "ml_gtk_column_view_get_row_factory"

external get_model : t -> Gtk.widget = "ml_gtk_column_view_get_model"

external get_header_factory : t -> Gtk.widget = "ml_gtk_column_view_get_header_factory"

external append_column : t -> Gtk.widget -> unit = "ml_gtk_column_view_append_column"

