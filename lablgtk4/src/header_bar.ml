(* GENERATED CODE - DO NOT EDIT *)
(* Widget: HeaderBar *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_header_bar_new"

(* Properties *)

external get_decoration_layout : t -> string = "ml_gtk_header_bar_get_decoration_layout"

external set_decoration_layout : t -> string -> unit = "ml_gtk_header_bar_set_decoration_layout"

external get_show_title_buttons : t -> bool = "ml_gtk_header_bar_get_show_title_buttons"

external set_show_title_buttons : t -> bool -> unit = "ml_gtk_header_bar_set_show_title_buttons"

external set_title_widget : t -> Gtk.widget option -> unit = "ml_gtk_header_bar_set_title_widget"

external remove : t -> Gtk.widget -> unit = "ml_gtk_header_bar_remove"

external pack_start : t -> Gtk.widget -> unit = "ml_gtk_header_bar_pack_start"

external pack_end : t -> Gtk.widget -> unit = "ml_gtk_header_bar_pack_end"

external get_title_widget : t -> Gtk.widget = "ml_gtk_header_bar_get_title_widget"

