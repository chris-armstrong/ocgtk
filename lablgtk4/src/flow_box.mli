(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FlowBox *)

type t = [`flow_box | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new FlowBox *)
external new_ : unit -> t = "ml_gtk_flow_box_new"

(* Properties *)

(** Get property: accept-unpaired-release *)
external get_accept_unpaired_release : t -> bool = "ml_gtk_flow_box_get_accept_unpaired_release"

(** Set property: accept-unpaired-release *)
external set_accept_unpaired_release : t -> bool -> unit = "ml_gtk_flow_box_set_accept_unpaired_release"

(** Unselects a single child of @box, if the selection
mode allows it. *)
external unselect_child : t -> Gtk.widget -> unit = "ml_gtk_flow_box_unselect_child"

(** Unselect all children of @box, if the selection
mode allows it. *)
external unselect_all : t -> unit = "ml_gtk_flow_box_unselect_all"

(** Hooks up an adjustment to focus handling in @box.

The adjustment is also used for autoscrolling during
rubberband selection. See [method@Gtk.ScrolledWindow.get_vadjustment]
for a typical way of obtaining the adjustment, and
[method@Gtk.FlowBox.set_hadjustment] for setting the horizontal
adjustment.

The adjustments have to be in pixel units and in the same
coordinate system as the allocation for immediate children
of the box. *)
external set_vadjustment : t -> Gtk.widget -> unit = "ml_gtk_flow_box_set_vadjustment"

(** Sets how selection works in @box. *)
external set_selection_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_flow_box_set_selection_mode"

(** Sets the vertical space to add between children. *)
external set_row_spacing : t -> int -> unit = "ml_gtk_flow_box_set_row_spacing"

(** Sets the minimum number of children to line up
in @box’s orientation before flowing. *)
external set_min_children_per_line : t -> int -> unit = "ml_gtk_flow_box_set_min_children_per_line"

(** Sets the maximum number of children to request and
allocate space for in @box’s orientation.

Setting the maximum number of children per line
limits the overall natural size request to be no more
than @n_children children long in the given orientation. *)
external set_max_children_per_line : t -> int -> unit = "ml_gtk_flow_box_set_max_children_per_line"

(** Sets whether or not all children of @box are given
equal space in the box. *)
external set_homogeneous : t -> bool -> unit = "ml_gtk_flow_box_set_homogeneous"

(** Hooks up an adjustment to focus handling in @box.

The adjustment is also used for autoscrolling during
rubberband selection. See [method@Gtk.ScrolledWindow.get_hadjustment]
for a typical way of obtaining the adjustment, and
[method@Gtk.FlowBox.set_vadjustment] for setting the vertical
adjustment.

The adjustments have to be in pixel units and in the same
coordinate system as the allocation for immediate children
of the box. *)
external set_hadjustment : t -> Gtk.widget -> unit = "ml_gtk_flow_box_set_hadjustment"

(** Sets the horizontal space to add between children. *)
external set_column_spacing : t -> int -> unit = "ml_gtk_flow_box_set_column_spacing"

(** If @single is %TRUE, children will be activated when you click
on them, otherwise you need to double-click. *)
external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_flow_box_set_activate_on_single_click"

(** Selects a single child of @box, if the selection
mode allows it. *)
external select_child : t -> Gtk.widget -> unit = "ml_gtk_flow_box_select_child"

(** Select all children of @box, if the selection
mode allows it. *)
external select_all : t -> unit = "ml_gtk_flow_box_select_all"

(** Removes all children from @box.

This function does nothing if @box is backed by a model. *)
external remove_all : t -> unit = "ml_gtk_flow_box_remove_all"

(** Removes a child from @box. *)
external remove : t -> Gtk.widget -> unit = "ml_gtk_flow_box_remove"

(** Adds @child to the start of @self.

If a sort function is set, the widget will
actually be inserted at the calculated position.

See also: [method@Gtk.FlowBox.insert]. *)
external prepend : t -> Gtk.widget -> unit = "ml_gtk_flow_box_prepend"

(** Updates the sorting for all children.

Call this when the result of the sort function on
@box is changed due to an external factor. *)
external invalidate_sort : t -> unit = "ml_gtk_flow_box_invalidate_sort"

(** Updates the filtering for all children.

Call this function when the result of the filter
function on the @box is changed due to an external
factor. For instance, this would be used if the
filter function just looked for a specific search
term, and the entry with the string has changed. *)
external invalidate_filter : t -> unit = "ml_gtk_flow_box_invalidate_filter"

(** Inserts the @widget into @box at @position.

If a sort function is set, the widget will actually be inserted
at the calculated position.

If @position is -1, or larger than the total number of children
in the @box, then the @widget will be appended to the end. *)
external insert : t -> Gtk.widget -> int -> unit = "ml_gtk_flow_box_insert"

(** Gets the selection mode of @box. *)
external get_selection_mode : t -> Gtk_enums.selectionmode = "ml_gtk_flow_box_get_selection_mode"

(** Gets the vertical spacing. *)
external get_row_spacing : t -> int = "ml_gtk_flow_box_get_row_spacing"

(** Gets the minimum number of children per line. *)
external get_min_children_per_line : t -> int = "ml_gtk_flow_box_get_min_children_per_line"

(** Gets the maximum number of children per line. *)
external get_max_children_per_line : t -> int = "ml_gtk_flow_box_get_max_children_per_line"

(** Returns whether the box is homogeneous. *)
external get_homogeneous : t -> bool = "ml_gtk_flow_box_get_homogeneous"

(** Gets the horizontal spacing. *)
external get_column_spacing : t -> int = "ml_gtk_flow_box_get_column_spacing"

(** Gets the child in the (@x, @y) position.

Both @x and @y are assumed to be relative to the origin of @box. *)
external get_child_at_pos : t -> int -> int -> Gtk.widget option = "ml_gtk_flow_box_get_child_at_pos"

(** Gets the nth child in the @box. *)
external get_child_at_index : t -> int -> Gtk.widget option = "ml_gtk_flow_box_get_child_at_index"

(** Returns whether children activate on single clicks. *)
external get_activate_on_single_click : t -> bool = "ml_gtk_flow_box_get_activate_on_single_click"

(** Adds @child to the end of @self.

If a sort function is set, the widget will
actually be inserted at the calculated position.

See also: [method@Gtk.FlowBox.insert]. *)
external append : t -> Gtk.widget -> unit = "ml_gtk_flow_box_append"

