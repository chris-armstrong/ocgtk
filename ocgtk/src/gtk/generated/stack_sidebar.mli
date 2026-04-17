(* GENERATED CODE - DO NOT EDIT *)
(* StackSidebar: StackSidebar *)

type t = [`stack_sidebar | `widget | `initially_unowned | `object_] Gobject.obj

(** Create a new StackSidebar *)
external new_ : unit -> t = "ml_gtk_stack_sidebar_new"

(* Methods *)
(** Set the `GtkStack` associated with this `GtkStackSidebar`.

The sidebar widget will automatically update according to
the order and items within the given `GtkStack`. *)
external set_stack : t -> Stack.t -> unit = "ml_gtk_stack_sidebar_set_stack"

(** Retrieves the stack. *)
external get_stack : t -> Stack.t option = "ml_gtk_stack_sidebar_get_stack"

(* Properties *)

