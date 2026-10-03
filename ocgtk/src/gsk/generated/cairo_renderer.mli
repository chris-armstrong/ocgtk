(* GENERATED CODE - DO NOT EDIT *)
(* CairoRenderer: CairoRenderer *)

(** Renders a GSK rendernode tree with cairo.

    Since it is using cairo, this renderer cannot support 3D transformations. *)

type t = [ `cairo_renderer | `renderer | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gsk_cairo_renderer_new"
(** Create a new CairoRenderer *)

(* Methods *)
