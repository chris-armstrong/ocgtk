(** Preserves the aspect ratio of its child.

    Its methods, signals and properties are on {!class-type-aspect_frame_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Aspect_frame}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AspectFrame].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Preserves the aspect ratio of its child.

    The frame can respect the aspect ratio of the child widget, or use its own
    aspect ratio.

    {b CSS nodes}

    [GtkAspectFrame] uses a CSS node with name [aspectframe].

    {b Accessibility}

    Until GTK 4.10, [GtkAspectFrame] used the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GROUP}[Gtk.AccessibleRole.group]}
    role.

    Starting from GTK 4.12, [GtkAspectFrame] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GENERIC}[Gtk.AccessibleRole.generic]}
    role. *)
class type aspect_frame_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [self]. *)

  method get_obey_child : unit -> bool
  (** Returns whether the child's size request should override the set aspect
      ratio of the [GtkAspectFrame]. *)

  method get_ratio : unit -> float
  (** Returns the desired aspect ratio of the child. *)

  method get_xalign : unit -> float
  (** Returns the horizontal alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method get_yalign : unit -> float
  (** Returns the vertical alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [self]. *)

  method set_obey_child : bool -> unit
  (** Sets whether the aspect ratio of the child's size request should override
      the set aspect ratio of the [GtkAspectFrame]. *)

  method set_ratio : float -> unit
  (** Sets the desired aspect ratio of the child. *)

  method set_xalign : float -> unit
  (** Sets the horizontal alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method set_yalign : float -> unit
  (** Sets the vertical alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  (** {2:conversions Conversions} *)

  method as_aspect_frame : Raw.Aspect_frame.t
end

class aspect_frame : Raw.Aspect_frame.t -> aspect_frame_t
(** Wraps a raw handle of {!Ocgtk.Raw.Aspect_frame.t}. *)

(** {1:description Description}

    Preserves the aspect ratio of its child.

    The frame can respect the aspect ratio of the child widget, or use its own
    aspect ratio.

    {b CSS nodes}

    [GtkAspectFrame] uses a CSS node with name [aspectframe].

    {b Accessibility}

    Until GTK 4.10, [GtkAspectFrame] used the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GROUP}[Gtk.AccessibleRole.group]}
    role.

    Starting from GTK 4.12, [GtkAspectFrame] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GENERIC}[Gtk.AccessibleRole.generic]}
    role. *)

(** {1:constructors Constructors} *)

val new_ : float -> float -> float -> bool -> aspect_frame_t
(** Create a new [GtkAspectFrame]. *)
