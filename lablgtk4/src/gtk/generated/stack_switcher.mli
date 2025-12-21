(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StackSwitcher *)

type t = [`stack_switcher | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new StackSwitcher *)
external new_ : unit -> t = "ml_gtk_stack_switcher_new"

(* Methods *)
(** Sets the stack to control. *)
external set_stack : t -> Stack.t option -> unit = "ml_gtk_stack_switcher_set_stack"

(** Retrieves the stack. *)
external get_stack : t -> Stack.t option = "ml_gtk_stack_switcher_get_stack"

(* Properties *)

