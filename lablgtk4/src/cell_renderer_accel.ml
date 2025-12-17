(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererAccel *)

type t = [`cell_renderer_accel | `cell_renderer_text | `cell_renderer | `initially_unowned] Gobject.obj

let as_cell_renderer (obj : t) : Cell_renderer.t = Obj.magic obj

(** Create a new CellRendererAccel *)
external new_ : unit -> t = "ml_gtk_cell_renderer_accel_new"

(* Properties *)

