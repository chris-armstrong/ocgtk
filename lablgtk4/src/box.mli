(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Box *)

type t = [`box | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Box *)
external new_ : Gtk_enums.orientation -> int -> t = "ml_gtk_box_new"

(* Properties *)

(** Sets the number of pixels to place between children of @box. *)
external set_spacing : t -> int -> unit = "ml_gtk_box_set_spacing"

(** Sets whether or not all children of @box are given equal space
in the box. *)
external set_homogeneous : t -> bool -> unit = "ml_gtk_box_set_homogeneous"

(** Sets the baseline position of a box.

This affects only horizontal boxes with at least one baseline
aligned child. If there is more vertical space available than
requested, and the baseline is not allocated by the parent then
@position is used to allocate the baseline with respect to the
extra space available. *)
external set_baseline_position : t -> Gtk_enums.baselineposition -> unit = "ml_gtk_box_set_baseline_position"

(** Sets the baseline child of a box.

This affects only vertical boxes. *)
external set_baseline_child : t -> int -> unit = "ml_gtk_box_set_baseline_child"

(** Moves @child to the position after @sibling in the list
of @box children.

If @sibling is %NULL, move @child to the first position. *)
external reorder_child_after : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_box_reorder_child_after"

(** Removes a child widget from @box.

The child must have been added before with
[method@Gtk.Box.append], [method@Gtk.Box.prepend], or
[method@Gtk.Box.insert_child_after]. *)
external remove : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_box_remove"

(** Adds @child as the first child to @box. *)
external prepend : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_box_prepend"

(** Inserts @child in the position after @sibling in the list
of @box children.

If @sibling is %NULL, insert @child at the first position. *)
external insert_child_after : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_box_insert_child_after"

(** Gets the value set by gtk_box_set_spacing(). *)
external get_spacing : t -> int = "ml_gtk_box_get_spacing"

(** Returns whether the box is homogeneous (all children are the
same size). *)
external get_homogeneous : t -> bool = "ml_gtk_box_get_homogeneous"

(** Gets the value set by gtk_box_set_baseline_position(). *)
external get_baseline_position : t -> Gtk_enums.baselineposition = "ml_gtk_box_get_baseline_position"

(** Gets the value set by gtk_box_set_baseline_child(). *)
external get_baseline_child : t -> int = "ml_gtk_box_get_baseline_child"

(** Adds @child as the last child to @box. *)
external append : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_box_append"

