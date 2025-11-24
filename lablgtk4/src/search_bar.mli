(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SearchBar *)

type t = Gtk.Widget.t

(** Create a new SearchBar *)
external new_ : unit -> t = "ml_gtk_search_bar_new"

(* Properties *)

(** Get property: search-mode-enabled *)
external get_search_mode_enabled : t -> bool = "ml_gtk_search_bar_get_search_mode_enabled"

(** Set property: search-mode-enabled *)
external set_search_mode_enabled : t -> bool -> unit = "ml_gtk_search_bar_set_search_mode_enabled"

(** Get property: show-close-button *)
external get_show_close_button : t -> bool = "ml_gtk_search_bar_get_show_close_button"

(** Set property: show-close-button *)
external set_show_close_button : t -> bool -> unit = "ml_gtk_search_bar_set_show_close_button"

external set_search_mode : t -> bool -> unit = "ml_gtk_search_bar_set_search_mode"

external set_key_capture_widget : t -> Gtk.Widget.t option -> unit = "ml_gtk_search_bar_set_key_capture_widget"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_search_bar_set_child"

external get_search_mode : t -> bool = "ml_gtk_search_bar_get_search_mode"

external get_key_capture_widget : t -> Gtk.Widget.t = "ml_gtk_search_bar_get_key_capture_widget"

external get_child : t -> Gtk.Widget.t = "ml_gtk_search_bar_get_child"

external connect_entry : t -> Gtk.Widget.t -> unit = "ml_gtk_search_bar_connect_entry"

