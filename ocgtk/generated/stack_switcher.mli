(** Shows a row of buttons to switch between [GtkStack] pages.

    An example GtkStackSwitcher

    It acts as a controller for the associated [GtkStack].

    All the content for the buttons comes from the properties of the stacks
    [Gtk.StackPage] objects; the button visibility in a [GtkStackSwitcher]
    widget is controlled by the visibility of the child in the [GtkStack].

    It is possible to associate multiple [GtkStackSwitcher] widgets with the
    same [GtkStack] widget.

    {b CSS nodes}

    [GtkStackSwitcher] has a single CSS node named stackswitcher and style class
    .stack-switcher.

    When circumstances require it, [GtkStackSwitcher] adds the .needs-attention
    style class to the widgets representing the stack pages.

    {b Accessibility}

    [GtkStackSwitcher] uses the [Gtk.AccessibleRole.tab_list] role and uses the
    [Gtk.AccessibleRole.tab] role for its buttons.

    {b Orientable}

    Since GTK 4.4, [GtkStackSwitcher] implements [GtkOrientable] allowing the
    stack switcher to be made vertical with [gtk_orientable_set_orientation()].

    Its methods, signals and properties are on {!class-type-stack_switcher_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Stack_switcher}. *)

(** The methods, signals and properties of a [GtkStackSwitcher]. *)
class type stack_switcher_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method get_stack : unit -> Stack.stack_t option
  (** Retrieves the stack. *)

  method set_stack : Stack.stack_t option -> unit
  (** Sets the stack to control. *)

  method as_stack_switcher : Raw.Stack_switcher.t
end

class stack_switcher : Raw.Stack_switcher.t -> stack_switcher_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Stack_switcher.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkStackSwitcher], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> stack_switcher_t
(** Create a new [GtkStackSwitcher]. *)
