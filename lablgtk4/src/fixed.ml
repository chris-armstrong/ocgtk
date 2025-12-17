(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Fixed *)

type t = [`fixed | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Fixed *)
external new_ : unit -> t = "ml_gtk_fixed_new"

(** Removes a child from @fixed. *)
external remove : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_fixed_remove"

(** Adds a widget to a `GtkFixed` at the given position. *)
external put : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> float -> float -> unit = "ml_gtk_fixed_put"

(** Sets a translation transformation to the given @x and @y
coordinates to the child @widget of the `GtkFixed`. *)
external move : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> float -> float -> unit = "ml_gtk_fixed_move"

