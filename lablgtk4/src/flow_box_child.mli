(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FlowBoxChild *)

type t = [`flow_box_child | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new FlowBoxChild *)
external new_ : unit -> t = "ml_gtk_flow_box_child_new"

(* Properties *)

(** Sets the child widget of @self. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_flow_box_child_set_child"

(** Returns whether the @child is currently selected in its
`GtkFlowBox` container. *)
external is_selected : t -> bool = "ml_gtk_flow_box_child_is_selected"

(** Gets the current index of the @child in its `GtkFlowBox` container. *)
external get_index : t -> int = "ml_gtk_flow_box_child_get_index"

(** Gets the child widget of @self. *)
external get_child : t -> Gtk.widget option = "ml_gtk_flow_box_child_get_child"

(** Marks @child as changed, causing any state that depends on this
to be updated.

This affects sorting and filtering.

Note that calls to this method must be in sync with the data
used for the sorting and filtering functions. For instance, if
the list is mirroring some external data set, and *two* children
changed in the external data set when you call
gtk_flow_box_child_changed() on the first child, the sort function
must only read the new data for the first of the two changed
children, otherwise the resorting of the children will be wrong.

This generally means that if you don’t fully control the data
model, you have to duplicate the data that affects the sorting
and filtering functions into the widgets themselves.

Another alternative is to call [method@Gtk.FlowBox.invalidate_sort]
on any model change, but that is more expensive. *)
external changed : t -> unit = "ml_gtk_flow_box_child_changed"

