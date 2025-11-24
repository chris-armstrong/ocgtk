(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DropDown *)

type t = Gtk.Widget.t

external new_ : unit -> Gtk.Widget.t option -> t = "ml_gtk_drop_down_new"

external new_from_strings : unit -> t = "ml_gtk_drop_down_new_from_strings"

(* Properties *)

external get_enable_search : t -> bool = "ml_gtk_drop_down_get_enable_search"

external set_enable_search : t -> bool -> unit = "ml_gtk_drop_down_set_enable_search"

external get_selected : t -> int = "ml_gtk_drop_down_get_selected"

external set_selected : t -> int -> unit = "ml_gtk_drop_down_set_selected"

external get_show_arrow : t -> bool = "ml_gtk_drop_down_get_show_arrow"

external set_show_arrow : t -> bool -> unit = "ml_gtk_drop_down_set_show_arrow"

external set_search_match_mode : t -> Gtk_enums.stringfiltermatchmode -> unit = "ml_gtk_drop_down_set_search_match_mode"

external set_list_factory : t -> Gtk.Widget.t option -> unit = "ml_gtk_drop_down_set_list_factory"

external set_header_factory : t -> Gtk.Widget.t option -> unit = "ml_gtk_drop_down_set_header_factory"

external set_factory : t -> Gtk.Widget.t option -> unit = "ml_gtk_drop_down_set_factory"

external set_expression : t -> Gtk.Widget.t option -> unit = "ml_gtk_drop_down_set_expression"

external get_search_match_mode : t -> Gtk_enums.stringfiltermatchmode = "ml_gtk_drop_down_get_search_match_mode"

external get_list_factory : t -> Gtk.Widget.t = "ml_gtk_drop_down_get_list_factory"

external get_header_factory : t -> Gtk.Widget.t = "ml_gtk_drop_down_get_header_factory"

external get_factory : t -> Gtk.Widget.t = "ml_gtk_drop_down_get_factory"

external get_expression : t -> Gtk.Widget.t = "ml_gtk_drop_down_get_expression"

