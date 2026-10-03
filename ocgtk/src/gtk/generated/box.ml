(* GENERATED CODE - DO NOT EDIT *)
(* Box: Box *)

type t = [ `box | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Arranges child widgets into a single row or column.

    An example GtkBox

    Whether it is a row or column depends on the value of its
    [Gtk.Orientable:orientation] property. Within the other dimension, all
    children are allocated the same size. The [Gtk.Widget:halign] and
    [Gtk.Widget:valign] properties can be used on the children to influence
    their allocation.

    Use repeated calls to [Gtk.Box.append] to pack widgets into a [GtkBox] from
    start to end. Use [Gtk.Box.remove] to remove widgets from the [GtkBox].
    [Gtk.Box.insert_child_after] can be used to add a child at a particular
    position.

    Use [Gtk.Box.set_homogeneous] to specify whether or not all children of the
    [GtkBox] are forced to get the same amount of space.

    Use [Gtk.Box.set_spacing] to determine how much space will be minimally
    placed between all children in the [GtkBox]. Note that spacing is added
    {i between} the children.

    Use [Gtk.Box.reorder_child_after] to move a child to a different place in
    the box.

    {b CSS nodes}

    [GtkBox] uses a single CSS node with name box.

    {b Accessibility}

    Until GTK 4.10, [GtkBox] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkBox] uses the [Gtk.AccessibleRole.generic] role.
*)

external new_ : Gtk_enums.orientation -> int -> t = "ml_gtk_box_new"
(** Create a new Box *)

(* Methods *)

external set_spacing : t -> int -> unit = "ml_gtk_box_set_spacing"
(** Sets the number of pixels to place between children. *)

external set_homogeneous : t -> bool -> unit = "ml_gtk_box_set_homogeneous"
(** Sets whether or not all children are given equal space in the box. *)

external set_baseline_position : t -> Gtk_enums.baselineposition -> unit
  = "ml_gtk_box_set_baseline_position"
(** Sets the baseline position of a box.

    This affects only horizontal boxes with at least one baseline aligned child.
    If there is more vertical space available than requested, and the baseline
    is not allocated by the parent then [position] is used to allocate the
    baseline with respect to the extra space available. *)

external set_baseline_child : t -> int -> unit = "ml_gtk_box_set_baseline_child"
(** Sets the baseline child of a box.

    This affects only vertical boxes. *)

external reorder_child_after :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_box_reorder_child_after"
(** Moves a child to a different position.

    The child is moved to the position after [sibling] in the list of [box]
    children.

    If [sibling] is [NULL], the child is placed at the beginning. *)

external remove :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_box_remove"
(** Removes a child widget from the box.

    The child must have been added before with [Gtk.Box.append],
    [Gtk.Box.prepend], or [Gtk.Box.insert_child_after]. *)

external prepend :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_box_prepend"
(** Adds a child at the beginning. *)

external insert_child_after :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_box_insert_child_after"
(** Inserts a child at a specific position.

    The child is added after [sibling] in the list of [box] children.

    If [sibling] is [NULL], the [child] is placed at the beginning. *)

external get_spacing : t -> int = "ml_gtk_box_get_spacing"
(** Gets the value set by [Gtk.Box.set_spacing]. *)

external get_homogeneous : t -> bool = "ml_gtk_box_get_homogeneous"
(** Returns whether the box is homogeneous.

    In a homogeneous box all children are the same size. *)

external get_baseline_position : t -> Gtk_enums.baselineposition
  = "ml_gtk_box_get_baseline_position"
(** Gets the value set by [Gtk.Box.set_baseline_position]. *)

external get_baseline_child : t -> int = "ml_gtk_box_get_baseline_child"
(** Gets the value set by [Gtk.Box.set_baseline_child]. *)

external append :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_box_append"
(** Adds a child at the end. *)

(* Properties *)
