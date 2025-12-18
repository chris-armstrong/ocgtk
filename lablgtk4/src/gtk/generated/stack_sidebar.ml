(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StackSidebar *)

type t = [`stack_sidebar | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new StackSidebar *)
external new_ : unit -> t = "ml_gtk_stack_sidebar_new"

(* Properties *)

(** Set the `GtkStack` associated with this `GtkStackSidebar`.

The sidebar widget will automatically update according to
the order and items within the given `GtkStack`. *)
external set_stack : t -> Stack.t -> unit = "ml_gtk_stack_sidebar_set_stack"

(** Retrieves the stack. *)
external get_stack : t -> Stack.t option = "ml_gtk_stack_sidebar_get_stack"

