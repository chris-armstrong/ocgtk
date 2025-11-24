(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GridView *)

type t = Gtk.Widget.t

(** Create a new GridView *)
external new_ : Gtk.Widget.t option -> Gtk.Widget.t option -> t = "ml_gtk_grid_view_new"

(* Properties *)

(** Get property: enable-rubberband *)
external get_enable_rubberband : t -> bool = "ml_gtk_grid_view_get_enable_rubberband"

(** Set property: enable-rubberband *)
external set_enable_rubberband : t -> bool -> unit = "ml_gtk_grid_view_set_enable_rubberband"

(** Get property: max-columns *)
external get_max_columns : t -> int = "ml_gtk_grid_view_get_max_columns"

(** Set property: max-columns *)
external set_max_columns : t -> int -> unit = "ml_gtk_grid_view_set_max_columns"

(** Get property: min-columns *)
external get_min_columns : t -> int = "ml_gtk_grid_view_get_min_columns"

(** Set property: min-columns *)
external set_min_columns : t -> int -> unit = "ml_gtk_grid_view_set_min_columns"

(** Get property: single-click-activate *)
external get_single_click_activate : t -> bool = "ml_gtk_grid_view_get_single_click_activate"

(** Set property: single-click-activate *)
external set_single_click_activate : t -> bool -> unit = "ml_gtk_grid_view_set_single_click_activate"

external set_tab_behavior : t -> Gtk_enums.listtabbehavior -> unit = "ml_gtk_grid_view_set_tab_behavior"

external set_model : t -> Gtk.Widget.t option -> unit = "ml_gtk_grid_view_set_model"

external set_factory : t -> Gtk.Widget.t option -> unit = "ml_gtk_grid_view_set_factory"

external scroll_to : t -> int -> Gtk_enums.listscrollflags -> Gtk.Widget.t option -> unit = "ml_gtk_grid_view_scroll_to"

external get_tab_behavior : t -> Gtk_enums.listtabbehavior = "ml_gtk_grid_view_get_tab_behavior"

external get_model : t -> Gtk.Widget.t = "ml_gtk_grid_view_get_model"

external get_factory : t -> Gtk.Widget.t = "ml_gtk_grid_view_get_factory"

