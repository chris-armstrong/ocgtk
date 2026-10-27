(** Uses a sidebar to switch between [GtkStack] pages.

    An example GtkStackSidebar

    In order to use a [GtkStackSidebar], you simply use a [GtkStack] to organize
    your UI flow, and add the sidebar to your sidebar area. You can use
    [Gtk.StackSidebar.set_stack] to connect the [GtkStackSidebar] to the
    [GtkStack].

    {b CSS nodes}

    [GtkStackSidebar] has a single CSS node with name stacksidebar and style
    class .sidebar.

    When circumstances require it, [GtkStackSidebar] adds the .needs-attention
    style class to the widgets representing the stack pages.

    Its methods, signals and properties are on {!class-type-stack_sidebar_t}.
    The functions it is built on are in {!Ocgtk.Raw.Stack_sidebar}. *)

(** The methods, signals and properties of a [GtkStackSidebar]. *)
class type stack_sidebar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_stack : unit -> Stack.stack_t option
  method set_stack : Stack.stack_t -> unit
  method as_stack_sidebar : Raw.Stack_sidebar.t
end

class stack_sidebar : Raw.Stack_sidebar.t -> stack_sidebar_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Stack_sidebar.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStackSidebar], give one already wrapped. *)

val new_ : unit -> stack_sidebar_t
