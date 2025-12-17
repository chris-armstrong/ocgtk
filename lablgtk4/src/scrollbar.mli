(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Scrollbar *)

type t = [`scrollbar | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Scrollbar *)
external new_ : Gtk_enums.orientation -> Adjustment.t option -> t = "ml_gtk_scrollbar_new"

(* Properties *)

(** Makes the scrollbar use the given adjustment. *)
external set_adjustment : t -> Adjustment.t option -> unit = "ml_gtk_scrollbar_set_adjustment"

(** Returns the scrollbar's adjustment. *)
external get_adjustment : t -> Adjustment.t = "ml_gtk_scrollbar_get_adjustment"

