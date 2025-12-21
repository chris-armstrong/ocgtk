(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererProgress *)

type t = [`cell_renderer_progress | `cell_renderer | `initially_unowned] Gobject.obj

val as_cell_renderer : t -> Cell_renderer.t

(** Create a new CellRendererProgress *)
external new_ : unit -> t = "ml_gtk_cell_renderer_progress_new"

(* Methods *)
(* Properties *)

(** Get property: inverted *)
external get_inverted : t -> bool = "ml_gtk_cell_renderer_progress_get_inverted"

(** Set property: inverted *)
external set_inverted : t -> bool -> unit = "ml_gtk_cell_renderer_progress_set_inverted"

(** Get property: pulse *)
external get_pulse : t -> int = "ml_gtk_cell_renderer_progress_get_pulse"

(** Set property: pulse *)
external set_pulse : t -> int -> unit = "ml_gtk_cell_renderer_progress_set_pulse"

(** Get property: text *)
external get_text : t -> string = "ml_gtk_cell_renderer_progress_get_text"

(** Set property: text *)
external set_text : t -> string -> unit = "ml_gtk_cell_renderer_progress_set_text"

(** Get property: text-xalign *)
external get_text_xalign : t -> float = "ml_gtk_cell_renderer_progress_get_text_xalign"

(** Set property: text-xalign *)
external set_text_xalign : t -> float -> unit = "ml_gtk_cell_renderer_progress_set_text_xalign"

(** Get property: text-yalign *)
external get_text_yalign : t -> float = "ml_gtk_cell_renderer_progress_get_text_yalign"

(** Set property: text-yalign *)
external set_text_yalign : t -> float -> unit = "ml_gtk_cell_renderer_progress_set_text_yalign"

(** Get property: value *)
external get_value : t -> int = "ml_gtk_cell_renderer_progress_get_value"

(** Set property: value *)
external set_value : t -> int -> unit = "ml_gtk_cell_renderer_progress_set_value"

