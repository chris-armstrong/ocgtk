(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StackSwitcher *)

type t = [`stack_switcher | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new StackSwitcher *)
external new_ : unit -> t = "ml_gtk_stack_switcher_new"

(* Properties *)

(** Sets the stack to control. *)
external set_stack : t -> Gtk.widget option -> unit = "ml_gtk_stack_switcher_set_stack"

(** Retrieves the stack. *)
external get_stack : t -> Gtk.widget option = "ml_gtk_stack_switcher_get_stack"

