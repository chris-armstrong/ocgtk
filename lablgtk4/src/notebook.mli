(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Notebook *)

type t = Gtk.Widget.t

(** Create a new Notebook *)
external new_ : unit -> t = "ml_gtk_notebook_new"

(* Properties *)

(** Get property: enable-popup *)
external get_enable_popup : t -> bool = "ml_gtk_notebook_get_enable_popup"

(** Set property: enable-popup *)
external set_enable_popup : t -> bool -> unit = "ml_gtk_notebook_set_enable_popup"

(** Get property: group-name *)
external get_group_name : t -> string = "ml_gtk_notebook_get_group_name"

(** Set property: group-name *)
external set_group_name : t -> string -> unit = "ml_gtk_notebook_set_group_name"

(** Get property: page *)
external get_page : t -> int = "ml_gtk_notebook_get_page"

(** Set property: page *)
external set_page : t -> int -> unit = "ml_gtk_notebook_set_page"

(** Get property: scrollable *)
external get_scrollable : t -> bool = "ml_gtk_notebook_get_scrollable"

(** Set property: scrollable *)
external set_scrollable : t -> bool -> unit = "ml_gtk_notebook_set_scrollable"

(** Get property: show-border *)
external get_show_border : t -> bool = "ml_gtk_notebook_get_show_border"

(** Set property: show-border *)
external set_show_border : t -> bool -> unit = "ml_gtk_notebook_set_show_border"

(** Get property: show-tabs *)
external get_show_tabs : t -> bool = "ml_gtk_notebook_get_show_tabs"

(** Set property: show-tabs *)
external set_show_tabs : t -> bool -> unit = "ml_gtk_notebook_set_show_tabs"

external set_tab_reorderable : t -> Gtk.Widget.t -> bool -> unit = "ml_gtk_notebook_set_tab_reorderable"

external set_tab_pos : t -> Gtk_enums.positiontype -> unit = "ml_gtk_notebook_set_tab_pos"

external set_tab_label_text : t -> Gtk.Widget.t -> string -> unit = "ml_gtk_notebook_set_tab_label_text"

external set_tab_label : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_notebook_set_tab_label"

external set_tab_detachable : t -> Gtk.Widget.t -> bool -> unit = "ml_gtk_notebook_set_tab_detachable"

external set_menu_label_text : t -> Gtk.Widget.t -> string -> unit = "ml_gtk_notebook_set_menu_label_text"

external set_menu_label : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_notebook_set_menu_label"

external set_current_page : t -> int -> unit = "ml_gtk_notebook_set_current_page"

external set_action_widget : t -> Gtk.Widget.t -> Gtk_enums.packtype -> unit = "ml_gtk_notebook_set_action_widget"

external reorder_child : t -> Gtk.Widget.t -> int -> unit = "ml_gtk_notebook_reorder_child"

external remove_page : t -> int -> unit = "ml_gtk_notebook_remove_page"

external prev_page : t -> unit = "ml_gtk_notebook_prev_page"

external prepend_page_menu : t -> Gtk.Widget.t -> Gtk.Widget.t option -> Gtk.Widget.t option -> int = "ml_gtk_notebook_prepend_page_menu"

external prepend_page : t -> Gtk.Widget.t -> Gtk.Widget.t option -> int = "ml_gtk_notebook_prepend_page"

external popup_enable : t -> unit = "ml_gtk_notebook_popup_enable"

external popup_disable : t -> unit = "ml_gtk_notebook_popup_disable"

external page_num : t -> Gtk.Widget.t -> int = "ml_gtk_notebook_page_num"

external next_page : t -> unit = "ml_gtk_notebook_next_page"

external insert_page_menu : t -> Gtk.Widget.t -> Gtk.Widget.t option -> Gtk.Widget.t option -> int -> int = "ml_gtk_notebook_insert_page_menu"

external insert_page : t -> Gtk.Widget.t -> Gtk.Widget.t option -> int -> int = "ml_gtk_notebook_insert_page"

external get_tab_reorderable : t -> Gtk.Widget.t -> bool = "ml_gtk_notebook_get_tab_reorderable"

external get_tab_pos : t -> Gtk_enums.positiontype = "ml_gtk_notebook_get_tab_pos"

external get_tab_label_text : t -> Gtk.Widget.t -> string = "ml_gtk_notebook_get_tab_label_text"

external get_tab_label : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_notebook_get_tab_label"

external get_tab_detachable : t -> Gtk.Widget.t -> bool = "ml_gtk_notebook_get_tab_detachable"

external get_pages : t -> unit = "ml_gtk_notebook_get_pages"

external get_nth_page : t -> int -> Gtk.Widget.t = "ml_gtk_notebook_get_nth_page"

external get_n_pages : t -> int = "ml_gtk_notebook_get_n_pages"

external get_menu_label_text : t -> Gtk.Widget.t -> string = "ml_gtk_notebook_get_menu_label_text"

external get_menu_label : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_notebook_get_menu_label"

external get_current_page : t -> int = "ml_gtk_notebook_get_current_page"

external get_action_widget : t -> Gtk_enums.packtype -> Gtk.Widget.t = "ml_gtk_notebook_get_action_widget"

external detach_tab : t -> Gtk.Widget.t -> unit = "ml_gtk_notebook_detach_tab"

external append_page_menu : t -> Gtk.Widget.t -> Gtk.Widget.t option -> Gtk.Widget.t option -> int = "ml_gtk_notebook_append_page_menu"

external append_page : t -> Gtk.Widget.t -> Gtk.Widget.t option -> int = "ml_gtk_notebook_append_page"

