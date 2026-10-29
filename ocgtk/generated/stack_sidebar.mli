(** Uses a sidebar to switch between [GtkStack] pages.

    Its methods, signals and properties are on {!class-type-stack_sidebar_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Stack_sidebar}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [StackSidebar].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Uses a sidebar to switch between [GtkStack] pages.

    An example GtkStackSidebar

    In order to use a [GtkStackSidebar], you simply use a [GtkStack] to organize
    your UI flow, and add the sidebar to your sidebar area. You can use
    {{!Ocgtk.Stack_sidebar.class-type-stack_sidebar_t.method-set_stack}[Gtk.StackSidebar.set_stack]}
    to connect the [GtkStackSidebar] to the [GtkStack].

    {b CSS nodes}

    [GtkStackSidebar] has a single CSS node with name stacksidebar and style
    class .sidebar.

    When circumstances require it, [GtkStackSidebar] adds the .needs-attention
    style class to the widgets representing the stack pages. *)
class type stack_sidebar_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_stack : unit -> Stack.stack_t option
  (** Retrieves the stack. *)

  method set_stack : Stack.stack_t -> unit
  (** Set the [GtkStack] associated with this [GtkStackSidebar].

      The sidebar widget will automatically update according to the order and
      items within the given [GtkStack]. *)

  (** {2:conversions Conversions} *)

  method as_stack_sidebar : Raw.Stack_sidebar.t
end

class stack_sidebar : Raw.Stack_sidebar.t -> stack_sidebar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Stack_sidebar.t}. *)

(** {1:description Description}

    Uses a sidebar to switch between [GtkStack] pages.

    An example GtkStackSidebar

    In order to use a [GtkStackSidebar], you simply use a [GtkStack] to organize
    your UI flow, and add the sidebar to your sidebar area. You can use
    {{!Ocgtk.Stack_sidebar.class-type-stack_sidebar_t.method-set_stack}[Gtk.StackSidebar.set_stack]}
    to connect the [GtkStackSidebar] to the [GtkStack].

    {b CSS nodes}

    [GtkStackSidebar] has a single CSS node with name stacksidebar and style
    class .sidebar.

    When circumstances require it, [GtkStackSidebar] adds the .needs-attention
    style class to the widgets representing the stack pages. *)

(** {1:constructors Constructors} *)

val new_ : unit -> stack_sidebar_t
(** Creates a new [GtkStackSidebar]. *)
