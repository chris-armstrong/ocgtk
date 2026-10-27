(** A render node for a linear gradient.

    Its methods, signals and properties are on
    {!class-type-linear_gradient_node_t}. The functions it is built on are in
    {!Ocgsk.Raw.Linear_gradient_node}. *)

(** The methods, signals and properties of a [GskLinearGradientNode]. *)
class type linear_gradient_node_t = object
  inherit Render_node.render_node_t

  method get_end : unit -> Ocgraphene.Point.point_t
  (** Retrieves the final point of the linear gradient. *)

  method get_n_color_stops : unit -> Gsize.t
  (** Retrieves the number of color stops in the gradient. *)

  method get_start : unit -> Ocgraphene.Point.point_t
  (** Retrieves the initial point of the linear gradient. *)

  method as_linear_gradient_node : Raw.Linear_gradient_node.t
end

class linear_gradient_node :
  Raw.Linear_gradient_node.t ->
  linear_gradient_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Linear_gradient_node.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GskLinearGradientNode], give one already wrapped. *)

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  Ocgraphene.Point.point_t ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  linear_gradient_node_t
