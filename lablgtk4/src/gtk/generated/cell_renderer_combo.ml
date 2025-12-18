(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererCombo *)

type t = [`cell_renderer_combo | `cell_renderer_text | `cell_renderer | `initially_unowned] Gobject.obj

let as_cell_renderer (obj : t) : Cell_renderer.t = Obj.magic obj

(** Create a new CellRendererCombo *)
external new_ : unit -> t = "ml_gtk_cell_renderer_combo_new"

(* Properties *)

(** Get property: has-entry *)
external get_has_entry : t -> bool = "ml_gtk_cell_renderer_combo_get_has_entry"

(** Set property: has-entry *)
external set_has_entry : t -> bool -> unit = "ml_gtk_cell_renderer_combo_set_has_entry"

(** Get property: text-column *)
external get_text_column : t -> int = "ml_gtk_cell_renderer_combo_get_text_column"

(** Set property: text-column *)
external set_text_column : t -> int -> unit = "ml_gtk_cell_renderer_combo_set_text_column"

