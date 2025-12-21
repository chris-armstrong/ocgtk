(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererSpinner *)

type t = [`cell_renderer_spinner | `cell_renderer | `initially_unowned] Gobject.obj

val as_cell_renderer : t -> Cell_renderer.t

(** Create a new CellRendererSpinner *)
external new_ : unit -> t = "ml_gtk_cell_renderer_spinner_new"

(* Methods *)
(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_cell_renderer_spinner_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_cell_renderer_spinner_set_active"

(** Get property: pulse *)
external get_pulse : t -> int = "ml_gtk_cell_renderer_spinner_get_pulse"

(** Set property: pulse *)
external set_pulse : t -> int -> unit = "ml_gtk_cell_renderer_spinner_set_pulse"

(** Get property: size *)
external get_size : t -> Gtk_enums.iconsize = "ml_gtk_cell_renderer_spinner_get_size"

(** Set property: size *)
external set_size : t -> Gtk_enums.iconsize -> unit = "ml_gtk_cell_renderer_spinner_set_size"

