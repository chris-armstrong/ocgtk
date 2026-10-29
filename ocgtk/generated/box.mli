(** Arranges child widgets into a single row or column.

    Its methods, signals and properties are on {!class-type-box_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Box}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Box].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Arranges child widgets into a single row or column.

    An example GtkBox

    Whether it is a row or column depends on the value of its
    {{!Ocgtk.Orientable.class-type-orientable_t.method-get_orientation}[Gtk.Orientable:orientation]}
    property. Within the other dimension, all children are allocated the same
    size. The
    {{!Ocgtk.Widget.class-type-widget_t.method-get_halign}[Gtk.Widget:halign]}
    and
    {{!Ocgtk.Widget.class-type-widget_t.method-get_valign}[Gtk.Widget:valign]}
    properties can be used on the children to influence their allocation.

    Use repeated calls to
    {{!Ocgtk.Box.class-type-box_t.method-append}[Gtk.Box.append]} to pack
    widgets into a [GtkBox] from start to end. Use
    {{!Ocgtk.Box.class-type-box_t.method-remove}[Gtk.Box.remove]} to remove
    widgets from the [GtkBox].
    {{!Ocgtk.Box.class-type-box_t.method-insert_child_after}[Gtk.Box.insert_child_after]}
    can be used to add a child at a particular position.

    Use
    {{!Ocgtk.Box.class-type-box_t.method-set_homogeneous}[Gtk.Box.set_homogeneous]}
    to specify whether or not all children of the [GtkBox] are forced to get the
    same amount of space.

    Use {{!Ocgtk.Box.class-type-box_t.method-set_spacing}[Gtk.Box.set_spacing]}
    to determine how much space will be minimally placed between all children in
    the [GtkBox]. Note that spacing is added {i between} the children.

    Use
    {{!Ocgtk.Box.class-type-box_t.method-reorder_child_after}[Gtk.Box.reorder_child_after]}
    to move a child to a different place in the box.

    {b CSS nodes}

    [GtkBox] uses a single CSS node with name box.

    {b Accessibility}

    Until GTK 4.10, [GtkBox] used the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GROUP}[Gtk.AccessibleRole.group]}
    role.

    Starting from GTK 4.12, [GtkBox] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GENERIC}[Gtk.AccessibleRole.generic]}
    role. *)
class type box_t = object
  inherit Widget.widget_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method append : Widget.widget_t -> unit
  (** Adds a child at the end. *)

  method get_baseline_child : unit -> int
  (** Gets the value set by [Gtk.Box.set_baseline_child]. *)

  method get_baseline_position : unit -> Enums.baselineposition
  (** Gets the value set by [Gtk.Box.set_baseline_position]. *)

  method get_homogeneous : unit -> bool
  (** Returns whether the box is homogeneous.

      In a homogeneous box all children are the same size. *)

  method get_spacing : unit -> int
  (** Gets the value set by [Gtk.Box.set_spacing]. *)

  method insert_child_after : Widget.widget_t -> Widget.widget_t option -> unit
  (** Inserts a child at a specific position.

      The child is added after [sibling] in the list of [box] children.

      If [sibling] is [None], the [child] is placed at the beginning. *)

  method prepend : Widget.widget_t -> unit
  (** Adds a child at the beginning. *)

  method remove : Widget.widget_t -> unit
  (** Removes a child widget from the box.

      The child must have been added before with [Gtk.Box.append],
      [Gtk.Box.prepend], or [Gtk.Box.insert_child_after]. *)

  method reorder_child_after : Widget.widget_t -> Widget.widget_t option -> unit
  (** Moves a child to a different position.

      The child is moved to the position after [sibling] in the list of [box]
      children.

      If [sibling] is [None], the child is placed at the beginning. *)

  method set_baseline_child : int -> unit
  (** Sets the baseline child of a box.

      This affects only vertical boxes. *)

  method set_baseline_position : Enums.baselineposition -> unit
  (** Sets the baseline position of a box.

      This affects only horizontal boxes with at least one baseline aligned
      child. If there is more vertical space available than requested, and the
      baseline is not allocated by the parent then [position] is used to
      allocate the baseline with respect to the extra space available. *)

  method set_homogeneous : bool -> unit
  (** Sets whether or not all children are given equal space in the box. *)

  method set_spacing : int -> unit
  (** Sets the number of pixels to place between children. *)

  (** {2:conversions Conversions} *)

  method as_box : Raw.Box.t
end

class box : Raw.Box.t -> box_t
(** Wraps a raw handle of {!Ocgtk.Raw.Box.t}. *)

(** {1:description Description}

    Arranges child widgets into a single row or column.

    An example GtkBox

    Whether it is a row or column depends on the value of its
    {{!Ocgtk.Orientable.class-type-orientable_t.method-get_orientation}[Gtk.Orientable:orientation]}
    property. Within the other dimension, all children are allocated the same
    size. The
    {{!Ocgtk.Widget.class-type-widget_t.method-get_halign}[Gtk.Widget:halign]}
    and
    {{!Ocgtk.Widget.class-type-widget_t.method-get_valign}[Gtk.Widget:valign]}
    properties can be used on the children to influence their allocation.

    Use repeated calls to
    {{!Ocgtk.Box.class-type-box_t.method-append}[Gtk.Box.append]} to pack
    widgets into a [GtkBox] from start to end. Use
    {{!Ocgtk.Box.class-type-box_t.method-remove}[Gtk.Box.remove]} to remove
    widgets from the [GtkBox].
    {{!Ocgtk.Box.class-type-box_t.method-insert_child_after}[Gtk.Box.insert_child_after]}
    can be used to add a child at a particular position.

    Use
    {{!Ocgtk.Box.class-type-box_t.method-set_homogeneous}[Gtk.Box.set_homogeneous]}
    to specify whether or not all children of the [GtkBox] are forced to get the
    same amount of space.

    Use {{!Ocgtk.Box.class-type-box_t.method-set_spacing}[Gtk.Box.set_spacing]}
    to determine how much space will be minimally placed between all children in
    the [GtkBox]. Note that spacing is added {i between} the children.

    Use
    {{!Ocgtk.Box.class-type-box_t.method-reorder_child_after}[Gtk.Box.reorder_child_after]}
    to move a child to a different place in the box.

    {b CSS nodes}

    [GtkBox] uses a single CSS node with name box.

    {b Accessibility}

    Until GTK 4.10, [GtkBox] used the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GROUP}[Gtk.AccessibleRole.group]}
    role.

    Starting from GTK 4.12, [GtkBox] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GENERIC}[Gtk.AccessibleRole.generic]}
    role. *)

(** {1:constructors Constructors} *)

val new_ : Enums.orientation -> int -> box_t
(** Creates a new box. *)
