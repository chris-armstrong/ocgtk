(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererSpin *)

type t = [`cell_renderer_spin | `cell_renderer_text | `cell_renderer | `initially_unowned] Gobject.obj

val as_cell_renderer : t -> Cell_renderer.t

(** Create a new CellRendererSpin *)
external new_ : unit -> t = "ml_gtk_cell_renderer_spin_new"

(* Methods *)
(* Properties *)

(** Get property: adjustment *)
external get_adjustment : t -> Adjustment.t = "ml_gtk_cell_renderer_spin_get_adjustment"

(** Set property: adjustment *)
external set_adjustment : t -> Adjustment.t -> unit = "ml_gtk_cell_renderer_spin_set_adjustment"

(** Get property: climb-rate *)
external get_climb_rate : t -> float = "ml_gtk_cell_renderer_spin_get_climb_rate"

(** Set property: climb-rate *)
external set_climb_rate : t -> float -> unit = "ml_gtk_cell_renderer_spin_set_climb_rate"

(** Get property: digits *)
external get_digits : t -> int = "ml_gtk_cell_renderer_spin_get_digits"

(** Set property: digits *)
external set_digits : t -> int -> unit = "ml_gtk_cell_renderer_spin_set_digits"

