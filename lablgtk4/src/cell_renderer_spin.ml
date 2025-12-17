(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererSpin *)

type t = [`cell_renderer_spin | `cell_renderer_text | `cell_renderer | `initially_unowned] Gobject.obj

let as_cell_renderer (obj : t) : Cell_renderer.t = Obj.magic obj

(** Create a new CellRendererSpin *)
external new_ : unit -> t = "ml_gtk_cell_renderer_spin_new"

(* Properties *)

