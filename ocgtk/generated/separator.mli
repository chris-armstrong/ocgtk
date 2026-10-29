(** Draws a horizontal or vertical line to separate other widgets.

    Its methods, signals and properties are on {!class-type-separator_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Separator}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Separator].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Draws a horizontal or vertical line to separate other widgets.

    An example GtkSeparator

    A [GtkSeparator] can be used to group the widgets within a window. It
    displays a line with a shadow to make it appear sunken into the interface.

    {b CSS nodes}

    [GtkSeparator] has a single CSS node with name separator. The node gets one
    of the .horizontal or .vertical style classes.

    {b Accessibility}

    [GtkSeparator] uses the [Gtk.AccessibleRole.separator] role. *)
class type separator_t = object
  inherit Widget.widget_t
  inherit Orientable.orientable_t

  (** {2:conversions Conversions} *)

  method as_separator : Raw.Separator.t
end

class separator : Raw.Separator.t -> separator_t
(** Wraps a raw handle of {!Ocgtk.Raw.Separator.t}. *)

(** {1:description Description}

    Draws a horizontal or vertical line to separate other widgets.

    An example GtkSeparator

    A [GtkSeparator] can be used to group the widgets within a window. It
    displays a line with a shadow to make it appear sunken into the interface.

    {b CSS nodes}

    [GtkSeparator] has a single CSS node with name separator. The node gets one
    of the .horizontal or .vertical style classes.

    {b Accessibility}

    [GtkSeparator] uses the [Gtk.AccessibleRole.separator] role. *)

(** {1:constructors Constructors} *)

val new_ : Enums.orientation -> separator_t
(** Creates a new [GtkSeparator] with the given orientation. *)
