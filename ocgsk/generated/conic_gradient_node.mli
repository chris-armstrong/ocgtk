(** A render node for a conic gradient.

    Its methods, signals and properties are on
    {!class-type-conic_gradient_node_t}. The functions it is built on are in
    {!Ocgsk.Raw.Conic_gradient_node}. *)

(** The methods, signals and properties of a [GskConicGradientNode]. *)
class type conic_gradient_node_t = object
  inherit Render_node.render_node_t

  method get_angle : unit -> float
  (** Retrieves the angle for the gradient in radians, normalized in \[0, 2 *
      PI\].

      The angle is starting at the top and going clockwise, as expressed in the
      css specification:

      angle = 90 - gsk_conic_gradient_node_get_rotation() *)

  method get_center : unit -> Ocgraphene.Point.point_t
  (** Retrieves the center pointer for the gradient. *)

  method get_n_color_stops : unit -> Gsize.t
  (** Retrieves the number of color stops in the gradient. *)

  method get_rotation : unit -> float
  (** Retrieves the rotation for the gradient in degrees. *)

  method as_conic_gradient_node : Raw.Conic_gradient_node.t
end

class conic_gradient_node : Raw.Conic_gradient_node.t -> conic_gradient_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Conic_gradient_node.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GskConicGradientNode], give one already wrapped. *)

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  float ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  conic_gradient_node_t
