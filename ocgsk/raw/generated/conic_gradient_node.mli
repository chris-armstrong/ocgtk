(* GENERATED CODE - DO NOT EDIT *)
(* ConicGradientNode: ConicGradientNode *)

(** A render node for a conic gradient.

    The class built on this module is in {!Ocgsk.Conic_gradient_node}. *)

type t = [ `conic_gradient_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_conic_gradient_node_get_type"

external new_ :
  Ocgraphene_raw.Rect.t ->
  Ocgraphene_raw.Point.t ->
  float ->
  Color_stop.t array ->
  Gsize.t ->
  t = "ml_gsk_conic_gradient_node_new"
(** Creates a [GskRenderNode] that draws a conic gradient.

    The conic gradient starts around [center] in the direction of [rotation]. A
    rotation of 0 means that the gradient points up. Color stops are then added
    clockwise. *)

(* Methods *)

external get_rotation : t -> float = "ml_gsk_conic_gradient_node_get_rotation"
(** Retrieves the rotation for the gradient in degrees. *)

external get_n_color_stops : t -> Gsize.t
  = "ml_gsk_conic_gradient_node_get_n_color_stops"
(** Retrieves the number of color stops in the gradient. *)

external get_color_stops : t -> Color_stop.t array * Gsize.t
  = "ml_gsk_conic_gradient_node_get_color_stops"
(** Retrieves the color stops in the gradient. *)

external get_center : t -> Ocgraphene_raw.Point.t
  = "ml_gsk_conic_gradient_node_get_center"
(** Retrieves the center pointer for the gradient. *)

external get_angle : t -> float = "ml_gsk_conic_gradient_node_get_angle"
(** Retrieves the angle for the gradient in radians, normalized in \[0, 2 *
    PI\].

    The angle is starting at the top and going clockwise, as expressed in the
    css specification:

    angle = 90 - gsk_conic_gradient_node_get_rotation() *)
