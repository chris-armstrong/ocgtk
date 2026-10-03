(* GENERATED CODE - DO NOT EDIT *)
(* StackSwitcher: StackSwitcher *)

type t =
  [ `stack_switcher | `widget | `initially_unowned | `object_ ] Gobject.obj
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
*)

external new_ : unit -> t = "ml_gtk_stack_switcher_new"
(** Create a new StackSwitcher *)

(* Methods *)

external set_stack : t -> Stack.t option -> unit
  = "ml_gtk_stack_switcher_set_stack"
(** Sets the stack to control. *)

external get_stack : t -> Stack.t option = "ml_gtk_stack_switcher_get_stack"
(** Retrieves the stack. *)

(* Properties *)
