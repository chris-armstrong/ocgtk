(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListBox *)

type t = Gtk.Widget.t

(** Create a new ListBox *)
external new_ : unit -> t = "ml_gtk_list_box_new"

(* Properties *)

(** Get property: accept-unpaired-release *)
external get_accept_unpaired_release : t -> bool = "ml_gtk_list_box_get_accept_unpaired_release"

(** Set property: accept-unpaired-release *)
external set_accept_unpaired_release : t -> bool -> unit = "ml_gtk_list_box_set_accept_unpaired_release"

(** Get property: activate-on-single-click *)
external get_activate_on_single_click : t -> bool = "ml_gtk_list_box_get_activate_on_single_click"

(** Set property: activate-on-single-click *)
external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_list_box_set_activate_on_single_click"

(** Get property: show-separators *)
external get_show_separators : t -> bool = "ml_gtk_list_box_get_show_separators"

(** Set property: show-separators *)
external set_show_separators : t -> bool -> unit = "ml_gtk_list_box_set_show_separators"

external unselect_row : t -> Gtk.Widget.t -> unit = "ml_gtk_list_box_unselect_row"

external unselect_all : t -> unit = "ml_gtk_list_box_unselect_all"

external set_sort_func : t -> unit -> unit -> unit -> unit = "ml_gtk_list_box_set_sort_func"

external set_selection_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_list_box_set_selection_mode"

external set_placeholder : t -> Gtk.Widget.t option -> unit = "ml_gtk_list_box_set_placeholder"

external set_header_func : t -> unit -> unit -> unit -> unit = "ml_gtk_list_box_set_header_func"

external set_filter_func : t -> unit -> unit -> unit -> unit = "ml_gtk_list_box_set_filter_func"

external set_adjustment : t -> Gtk.Widget.t option -> unit = "ml_gtk_list_box_set_adjustment"

external selected_foreach : t -> unit -> unit -> unit = "ml_gtk_list_box_selected_foreach"

external select_row : t -> Gtk.Widget.t option -> unit = "ml_gtk_list_box_select_row"

external select_all : t -> unit = "ml_gtk_list_box_select_all"

external remove_all : t -> unit = "ml_gtk_list_box_remove_all"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_list_box_remove"

external prepend : t -> Gtk.Widget.t -> unit = "ml_gtk_list_box_prepend"

external invalidate_sort : t -> unit = "ml_gtk_list_box_invalidate_sort"

external invalidate_headers : t -> unit = "ml_gtk_list_box_invalidate_headers"

external invalidate_filter : t -> unit = "ml_gtk_list_box_invalidate_filter"

external insert : t -> Gtk.Widget.t -> int -> unit = "ml_gtk_list_box_insert"

external get_selection_mode : t -> Gtk_enums.selectionmode = "ml_gtk_list_box_get_selection_mode"

external get_selected_row : t -> Gtk.Widget.t = "ml_gtk_list_box_get_selected_row"

external get_row_at_y : t -> int -> Gtk.Widget.t = "ml_gtk_list_box_get_row_at_y"

external get_row_at_index : t -> int -> Gtk.Widget.t = "ml_gtk_list_box_get_row_at_index"

external get_adjustment : t -> Gtk.Widget.t = "ml_gtk_list_box_get_adjustment"

external drag_unhighlight_row : t -> unit = "ml_gtk_list_box_drag_unhighlight_row"

external drag_highlight_row : t -> Gtk.Widget.t -> unit = "ml_gtk_list_box_drag_highlight_row"

external bind_model : t -> unit -> unit -> unit -> unit -> unit = "ml_gtk_list_box_bind_model"

external append : t -> Gtk.Widget.t -> unit = "ml_gtk_list_box_append"

