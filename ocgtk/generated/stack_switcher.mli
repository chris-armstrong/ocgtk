(** Shows a row of buttons to switch between [GtkStack] pages.

    Its methods, signals and properties are on {!class-type-stack_switcher_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Stack_switcher}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [StackSwitcher].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Shows a row of buttons to switch between [GtkStack] pages.

    An example GtkStackSwitcher

    It acts as a controller for the associated [GtkStack].

    All the content for the buttons comes from the properties of the stacks
    {{!Ocgtk.Stack_page.class-type-stack_page_t}[Gtk.StackPage]} objects; the
    button visibility in a [GtkStackSwitcher] widget is controlled by the
    visibility of the child in the [GtkStack].

    It is possible to associate multiple [GtkStackSwitcher] widgets with the
    same [GtkStack] widget.

    {b CSS nodes}

    [GtkStackSwitcher] has a single CSS node named stackswitcher and style class
    .stack-switcher.

    When circumstances require it, [GtkStackSwitcher] adds the .needs-attention
    style class to the widgets representing the stack pages.

    {b Accessibility}

    [GtkStackSwitcher] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB_LIST}[Gtk.AccessibleRole.tab_list]}
    role and uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB}[Gtk.AccessibleRole.tab]}
    role for its buttons.

    {b Orientable}

    Since GTK 4.4, [GtkStackSwitcher] implements [GtkOrientable] allowing the
    stack switcher to be made vertical with [gtk_orientable_set_orientation()].
*)
class type stack_switcher_t = object
  inherit Widget.widget_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method get_stack : unit -> Stack.stack_t option
  (** Retrieves the stack. *)

  method set_stack : Stack.stack_t option -> unit
  (** Sets the stack to control. *)

  (** {2:conversions Conversions} *)

  method as_stack_switcher : Raw.Stack_switcher.t
end

class stack_switcher : Raw.Stack_switcher.t -> stack_switcher_t
(** Wraps a raw handle of {!Ocgtk.Raw.Stack_switcher.t}. *)

(** {1:description Description}

    Shows a row of buttons to switch between [GtkStack] pages.

    An example GtkStackSwitcher

    It acts as a controller for the associated [GtkStack].

    All the content for the buttons comes from the properties of the stacks
    {{!Ocgtk.Stack_page.class-type-stack_page_t}[Gtk.StackPage]} objects; the
    button visibility in a [GtkStackSwitcher] widget is controlled by the
    visibility of the child in the [GtkStack].

    It is possible to associate multiple [GtkStackSwitcher] widgets with the
    same [GtkStack] widget.

    {b CSS nodes}

    [GtkStackSwitcher] has a single CSS node named stackswitcher and style class
    .stack-switcher.

    When circumstances require it, [GtkStackSwitcher] adds the .needs-attention
    style class to the widgets representing the stack pages.

    {b Accessibility}

    [GtkStackSwitcher] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB_LIST}[Gtk.AccessibleRole.tab_list]}
    role and uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB}[Gtk.AccessibleRole.tab]}
    role for its buttons.

    {b Orientable}

    Since GTK 4.4, [GtkStackSwitcher] implements [GtkOrientable] allowing the
    stack switcher to be made vertical with [gtk_orientable_set_orientation()].
*)

(** {1:constructors Constructors} *)

val new_ : unit -> stack_switcher_t
(** Create a new [GtkStackSwitcher]. *)
