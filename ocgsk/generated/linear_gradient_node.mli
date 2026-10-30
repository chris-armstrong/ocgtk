(** A render node for a linear gradient.

    Its methods, signals and properties are on
    {!class-type-linear_gradient_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Linear_gradient_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [LinearGradientNode].}

    Inherits from:
    {{!Ocgsk.Render_node.class-type-render_node_t}Ocgsk.Render_node}

    A render node for a linear gradient. *)
class type linear_gradient_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_end : unit -> Ocgraphene.Point.point_t
  (** Retrieves the final point of the linear gradient. *)

  method get_n_color_stops : unit -> Gsize.t
  (** Retrieves the number of color stops in the gradient. *)

  method get_start : unit -> Ocgraphene.Point.point_t
  (** Retrieves the initial point of the linear gradient. *)

  (** {2:conversions Conversions} *)

  method as_linear_gradient_node : Raw.Linear_gradient_node.t
end

class linear_gradient_node :
  Raw.Linear_gradient_node.t ->
  linear_gradient_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Linear_gradient_node.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  Ocgraphene.Point.point_t ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  linear_gradient_node_t
(** Creates a [GskRenderNode] that will create a linear gradient from the given
    points and color stops, and render that into the area given by [bounds]. *)
