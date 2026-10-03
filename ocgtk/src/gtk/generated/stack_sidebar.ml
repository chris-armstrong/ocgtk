(* GENERATED CODE - DO NOT EDIT *)
(* StackSidebar: StackSidebar *)

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
    style class to the widgets representing the stack pages. *)

type t =
  [ `stack_sidebar | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_stack_sidebar_new"
(** Create a new StackSidebar *)

(* Methods *)

external set_stack : t -> Stack.t -> unit = "ml_gtk_stack_sidebar_set_stack"
(** Set the [GtkStack] associated with this [GtkStackSidebar].

    The sidebar widget will automatically update according to the order and
    items within the given [GtkStack]. *)

external get_stack : t -> Stack.t option = "ml_gtk_stack_sidebar_get_stack"
(** Retrieves the stack. *)

(* Properties *)
