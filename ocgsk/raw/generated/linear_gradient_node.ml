(* GENERATED CODE - DO NOT EDIT *)
(* LinearGradientNode: LinearGradientNode *)

(** A render node for a linear gradient.

    The class built on this module is in {!Ocgsk.Linear_gradient_node}. *)

type t = [ `linear_gradient_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_linear_gradient_node_get_type"

external new_ :
  Ocgraphene_raw.Rect.t ->
  Ocgraphene_raw.Point.t ->
  Ocgraphene_raw.Point.t ->
  Color_stop.t array ->
  Gsize.t ->
  t = "ml_gsk_linear_gradient_node_new"
(** Creates a [GskRenderNode] that will create a linear gradient from the given
    points and color stops, and render that into the area given by [bounds]. *)

(* Methods *)

external get_start : t -> Ocgraphene_raw.Point.t
  = "ml_gsk_linear_gradient_node_get_start"
(** Retrieves the initial point of the linear gradient. *)

external get_n_color_stops : t -> Gsize.t
  = "ml_gsk_linear_gradient_node_get_n_color_stops"
(** Retrieves the number of color stops in the gradient. *)

external get_end : t -> Ocgraphene_raw.Point.t
  = "ml_gsk_linear_gradient_node_get_end"
(** Retrieves the final point of the linear gradient. *)

external get_color_stops : t -> Color_stop.t array * Gsize.t
  = "ml_gsk_linear_gradient_node_get_color_stops"
(** Retrieves the color stops in the gradient. *)
