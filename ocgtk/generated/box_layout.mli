(** Arranges children in a single row or column.

    Its methods, signals and properties are on {!class-type-box_layout_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Box_layout}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BoxLayout].}

    Inherits from:
    {{!Ocgtk.Layout_manager.class-type-layout_manager_t}Ocgtk.Layout_manager}

    Implements:
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Arranges children in a single row or column.

    Whether it is a row or column depends on the value of its
    [Gtk.Orientable:orientation] property. Within the other dimension all
    children all allocated the same size. The [GtkBoxLayout] will respect the
    [Gtk.Widget:halign] and [Gtk.Widget:valign] properties of each child widget.

    If you want all children to be assigned the same size, you can use the
    [Gtk.BoxLayout:homogeneous] property.

    If you want to specify the amount of space placed between each child, you
    can use the [Gtk.BoxLayout:spacing] property. *)
class type box_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method get_baseline_child : unit -> int
  (** Gets the value set by gtk_box_layout_set_baseline_child(). *)

  method get_baseline_position : unit -> Enums.baselineposition
  (** Gets the value set by gtk_box_layout_set_baseline_position(). *)

  method get_homogeneous : unit -> bool
  (** Returns whether the layout is set to be homogeneous. *)

  method get_spacing : unit -> int
  (** Returns the space that [box_layout] puts between children. *)

  method set_baseline_child : int -> unit
  (** Sets the index of the child that determines the baseline in vertical
      layout. *)

  method set_baseline_position : Enums.baselineposition -> unit
  (** Sets the baseline position of a box layout.

      The baseline position affects only horizontal boxes with at least one
      baseline aligned child. If there is more vertical space available than
      requested, and the baseline is not allocated by the parent then the given
      [position] is used to allocate the baseline within the extra space
      available. *)

  method set_homogeneous : bool -> unit
  (** Sets whether the box layout will allocate the same size to all children.
  *)

  method set_spacing : int -> unit
  (** Sets how much spacing to put between children. *)

  (** {2:conversions Conversions} *)

  method as_box_layout : Raw.Box_layout.t
end

class box_layout : Raw.Box_layout.t -> box_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Box_layout.t}. *)

(** {1:description Description}

    Arranges children in a single row or column.

    Whether it is a row or column depends on the value of its
    [Gtk.Orientable:orientation] property. Within the other dimension all
    children all allocated the same size. The [GtkBoxLayout] will respect the
    [Gtk.Widget:halign] and [Gtk.Widget:valign] properties of each child widget.

    If you want all children to be assigned the same size, you can use the
    [Gtk.BoxLayout:homogeneous] property.

    If you want to specify the amount of space placed between each child, you
    can use the [Gtk.BoxLayout:spacing] property. *)

(** {1:constructors Constructors} *)

val new_ : Enums.orientation -> box_layout_t
(** Creates a new [GtkBoxLayout]. *)
