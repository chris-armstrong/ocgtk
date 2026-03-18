(* GENERATED CODE - DO NOT EDIT *)
(* ConicGradientNode: ConicGradientNode *)

type t = [`conic_gradient_node | `render_node] Gobject.obj

(* Methods *)
(** Retrieves the rotation for the gradient in degrees. *)
external get_rotation : t -> float = "ml_gsk_conic_gradient_node_get_rotation"

(** Retrieves the center pointer for the gradient. *)
external get_center : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t = "ml_gsk_conic_gradient_node_get_center"

(** Retrieves the angle for the gradient in radians, normalized in [0, 2 * PI].

The angle is starting at the top and going clockwise, as expressed
in the css specification:

    angle = 90 - gsk_conic_gradient_node_get_rotation() *)
external get_angle : t -> float = "ml_gsk_conic_gradient_node_get_angle"

