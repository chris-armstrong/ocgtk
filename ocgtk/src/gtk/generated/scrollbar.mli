(* GENERATED CODE - DO NOT EDIT *)
(* Scrollbar: Scrollbar *)

type t = [`scrollbar | `widget | `initially_unowned] Gobject.obj

(** Create a new Scrollbar *)
external new_ : Gtk_enums.orientation -> Adjustment.t option -> t = "ml_gtk_scrollbar_new"

(* Methods *)
(** Makes the scrollbar use the given adjustment. *)
external set_adjustment : t -> Adjustment.t option -> unit = "ml_gtk_scrollbar_set_adjustment"

(** Returns the scrollbar's adjustment. *)
external get_adjustment : t -> Adjustment.t = "ml_gtk_scrollbar_get_adjustment"

(* Properties *)

