(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FlowBox *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_flow_box_new"

(* Properties *)

external get_accept_unpaired_release : t -> bool = "ml_gtk_flow_box_get_accept_unpaired_release"

external set_accept_unpaired_release : t -> bool -> unit = "ml_gtk_flow_box_set_accept_unpaired_release"

external get_activate_on_single_click : t -> bool = "ml_gtk_flow_box_get_activate_on_single_click"

external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_flow_box_set_activate_on_single_click"

external get_column_spacing : t -> int = "ml_gtk_flow_box_get_column_spacing"

external set_column_spacing : t -> int -> unit = "ml_gtk_flow_box_set_column_spacing"

external get_homogeneous : t -> bool = "ml_gtk_flow_box_get_homogeneous"

external set_homogeneous : t -> bool -> unit = "ml_gtk_flow_box_set_homogeneous"

external get_max_children_per_line : t -> int = "ml_gtk_flow_box_get_max_children_per_line"

external set_max_children_per_line : t -> int -> unit = "ml_gtk_flow_box_set_max_children_per_line"

external get_min_children_per_line : t -> int = "ml_gtk_flow_box_get_min_children_per_line"

external set_min_children_per_line : t -> int -> unit = "ml_gtk_flow_box_set_min_children_per_line"

external get_row_spacing : t -> int = "ml_gtk_flow_box_get_row_spacing"

external set_row_spacing : t -> int -> unit = "ml_gtk_flow_box_set_row_spacing"

external unselect_child : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_unselect_child"

external unselect_all : t -> unit = "ml_gtk_flow_box_unselect_all"

external set_vadjustment : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_set_vadjustment"

external set_selection_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_flow_box_set_selection_mode"

external set_hadjustment : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_set_hadjustment"

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

external append : t -> Gtk.Widget.t -> unit = "ml_gtk_flow_box_append"

