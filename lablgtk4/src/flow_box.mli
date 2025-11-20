(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FlowBox *)

type t = Gtk.Widget.t

(** Create a new FlowBox *)
external new_ : unit -> t = "ml_gtk_flow_box_new"

(* Properties *)

(** Get property: accept-unpaired-release *)
external get_accept_unpaired_release : t -> bool = "ml_gtk_flow_box_get_accept_unpaired_release"

(** Set property: accept-unpaired-release *)
external set_accept_unpaired_release : t -> bool -> unit = "ml_gtk_flow_box_set_accept_unpaired_release"

(** Get property: activate-on-single-click *)
external get_activate_on_single_click : t -> bool = "ml_gtk_flow_box_get_activate_on_single_click"

(** Set property: activate-on-single-click *)
external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_flow_box_set_activate_on_single_click"

(** Get property: column-spacing *)
external get_column_spacing : t -> int = "ml_gtk_flow_box_get_column_spacing"

(** Set property: column-spacing *)
external set_column_spacing : t -> int -> unit = "ml_gtk_flow_box_set_column_spacing"

(** Get property: homogeneous *)
external get_homogeneous : t -> bool = "ml_gtk_flow_box_get_homogeneous"

(** Set property: homogeneous *)
external set_homogeneous : t -> bool -> unit = "ml_gtk_flow_box_set_homogeneous"

(** Get property: max-children-per-line *)
external get_max_children_per_line : t -> int = "ml_gtk_flow_box_get_max_children_per_line"

(** Set property: max-children-per-line *)
external set_max_children_per_line : t -> int -> unit = "ml_gtk_flow_box_set_max_children_per_line"

(** Get property: min-children-per-line *)
external get_min_children_per_line : t -> int = "ml_gtk_flow_box_get_min_children_per_line"

(** Set property: min-children-per-line *)
external set_min_children_per_line : t -> int -> unit = "ml_gtk_flow_box_set_min_children_per_line"

(** Get property: row-spacing *)
external get_row_spacing : t -> int = "ml_gtk_flow_box_get_row_spacing"

(** Set property: row-spacing *)
external set_row_spacing : t -> int -> unit = "ml_gtk_flow_box_set_row_spacing"

external unselect_child : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_unselect_child"

external unselect_all : t -> unit = "ml_gtk_flow_box_unselect_all"

external set_vadjustment : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_set_vadjustment"

external set_sort_func : t -> unit -> unit -> unit -> unit = "ml_gtk_flow_box_set_sort_func"

external set_selection_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_flow_box_set_selection_mode"

external set_hadjustment : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_set_hadjustment"

external set_filter_func : t -> unit -> unit -> unit -> unit = "ml_gtk_flow_box_set_filter_func"

external selected_foreach : t -> unit -> unit -> unit = "ml_gtk_flow_box_selected_foreach"

external select_child : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_select_child"

external select_all : t -> unit = "ml_gtk_flow_box_select_all"

external remove_all : t -> unit = "ml_gtk_flow_box_remove_all"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_remove"

external prepend : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_prepend"

external invalidate_sort : t -> unit = "ml_gtk_flow_box_invalidate_sort"

external invalidate_filter : t -> unit = "ml_gtk_flow_box_invalidate_filter"

external insert : t -> Gtk.Widget.t -> int -> unit = "ml_gtk_flow_box_insert"

external get_selection_mode : t -> Gtk_enums.selectionmode = "ml_gtk_flow_box_get_selection_mode"

external get_child_at_pos : t -> int -> int -> Gtk.Widget.t = "ml_gtk_flow_box_get_child_at_pos"

external get_child_at_index : t -> int -> Gtk.Widget.t = "ml_gtk_flow_box_get_child_at_index"

external bind_model : t -> unit -> unit -> unit -> unit -> unit = "ml_gtk_flow_box_bind_model"

external append : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_append"

