(** Draws a horizontal or vertical line to separate other widgets.

    An example GtkSeparator

    A [GtkSeparator] can be used to group the widgets within a window. It
    displays a line with a shadow to make it appear sunken into the interface.

    {b CSS nodes}

    [GtkSeparator] has a single CSS node with name separator. The node gets one
    of the .horizontal or .vertical style classes.

    {b Accessibility}

    [GtkSeparator] uses the [Gtk.AccessibleRole.separator] role.

    Its methods, signals and properties are on {!class-type-separator_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Separator}. *)

(** {b The methods, signals and properties of a [Separator].}

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
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t
  method as_separator : Raw.Separator.t
end

class separator : Raw.Separator.t -> separator_t
(** Wraps a raw handle of {!Ocgtk.Raw.Separator.t}. *)

(** {2:constructors Constructors} *)

val new_ : Enums.orientation -> separator_t
(** Creates a new [GtkSeparator] with the given orientation. *)
