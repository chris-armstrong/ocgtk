(** A render node for a repeating linear gradient.

    Its methods, signals and properties are on
    {!class-type-repeating_linear_gradient_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Repeating_linear_gradient_node}. *)

(** {b The methods, signals and properties of a [RepeatingLinearGradientNode].}

    A render node for a repeating linear gradient. *)
class type repeating_linear_gradient_node_t = object
  inherit Render_node.render_node_t

  method as_repeating_linear_gradient_node :
    Raw.Repeating_linear_gradient_node.t
end

class repeating_linear_gradient_node :
  Raw.Repeating_linear_gradient_node.t ->
  repeating_linear_gradient_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Repeating_linear_gradient_node.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  Ocgraphene.Point.point_t ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  repeating_linear_gradient_node_t
(** Creates a [GskRenderNode] that will create a repeating linear gradient from
    the given points and color stops, and render that into the area given by
    [bounds]. *)
