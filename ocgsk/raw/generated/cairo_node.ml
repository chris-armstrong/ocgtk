(* GENERATED CODE - DO NOT EDIT *)
(* CairoNode: CairoNode *)

(** A render node for a Cairo surface. *)

type t = [ `cairo_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_cairo_node_get_type"

external new_ : Ocgraphene_raw.Rect.t -> t = "ml_gsk_cairo_node_new"
(** Create a new CairoNode *)

(* Methods *)

external get_surface : t -> Occairo_raw.Surface.t
  = "ml_gsk_cairo_node_get_surface"
(** Retrieves the Cairo surface used by the render node. *)

external get_draw_context : t -> Occairo_raw.Context.t
  = "ml_gsk_cairo_node_get_draw_context"
(** Creates a Cairo context for drawing using the surface associated to the
    render node.

    If no surface exists yet, a surface will be created optimized for rendering
    to [renderer]. *)
