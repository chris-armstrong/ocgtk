(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListView *)

type t = Gtk.widget

external new_ : Gtk.widget option -> Gtk.widget option -> t = "ml_gtk_list_view_new"

(* Properties *)

external get_enable_rubberband : t -> bool = "ml_gtk_list_view_get_enable_rubberband"

external set_enable_rubberband : t -> bool -> unit = "ml_gtk_list_view_set_enable_rubberband"

external get_show_separators : t -> bool = "ml_gtk_list_view_get_show_separators"

external set_show_separators : t -> bool -> unit = "ml_gtk_list_view_set_show_separators"

external get_single_click_activate : t -> bool = "ml_gtk_list_view_get_single_click_activate"

external set_single_click_activate : t -> bool -> unit = "ml_gtk_list_view_set_single_click_activate"

external set_tab_behavior : t -> Gtk_enums.listtabbehavior -> unit = "ml_gtk_list_view_set_tab_behavior"

external set_model : t -> Gtk.widget option -> unit = "ml_gtk_list_view_set_model"

external set_header_factory : t -> Gtk.widget option -> unit = "ml_gtk_list_view_set_header_factory"

external set_factory : t -> Gtk.widget option -> unit = "ml_gtk_list_view_set_factory"

external scroll_to : t -> int -> Gtk_enums.listscrollflags -> Gtk.widget option -> unit = "ml_gtk_list_view_scroll_to"

external get_tab_behavior : t -> Gtk_enums.listtabbehavior = "ml_gtk_list_view_get_tab_behavior"

external get_model : t -> Gtk.widget = "ml_gtk_list_view_get_model"

external get_header_factory : t -> Gtk.widget = "ml_gtk_list_view_get_header_factory"

external get_factory : t -> Gtk.widget = "ml_gtk_list_view_get_factory"

