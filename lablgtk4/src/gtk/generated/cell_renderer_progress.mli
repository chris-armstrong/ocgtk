(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererProgress *)

type t = [`cell_renderer_progress | `cell_renderer | `initially_unowned] Gobject.obj

val as_cell_renderer : t -> Cell_renderer.t

(** Create a new CellRendererProgress *)
external new_ : unit -> t = "ml_gtk_cell_renderer_progress_new"

(* Properties *)

(** Get property: inverted *)
external get_inverted : t -> bool = "ml_gtk_cell_renderer_progress_get_inverted"

(** Set property: inverted *)
external set_inverted : t -> bool -> unit = "ml_gtk_cell_renderer_progress_set_inverted"

