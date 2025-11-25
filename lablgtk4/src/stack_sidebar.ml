(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StackSidebar *)

type t = [`stack_sidebar | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new StackSidebar *)
external new_ : unit -> t = "ml_gtk_stack_sidebar_new"

(* Properties *)

(** Set the `GtkStack` associated with this `GtkStackSidebar`.

The sidebar widget will automatically update according to
the order and items within the given `GtkStack`. *)
external set_stack : t -> Gtk.widget -> unit = "ml_gtk_stack_sidebar_set_stack"

(** Retrieves the stack. *)
external get_stack : t -> Gtk.widget option = "ml_gtk_stack_sidebar_get_stack"

