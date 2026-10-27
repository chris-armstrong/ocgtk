(** A render node for a repeating linear gradient.

    Its methods, signals and properties are on
    {!class-type-repeating_linear_gradient_node_t}. The functions it is built on
    are in {!Ocgsk.Raw.Repeating_linear_gradient_node}. *)

(** The methods, signals and properties of a [GskRepeatingLinearGradientNode].
*)
class type repeating_linear_gradient_node_t = object
  inherit Render_node.render_node_t

  method as_repeating_linear_gradient_node :
    Raw.Repeating_linear_gradient_node.t
end

class repeating_linear_gradient_node :
  Raw.Repeating_linear_gradient_node.t ->
  repeating_linear_gradient_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Repeating_linear_gradient_node.t}. Apply
    it directly only to convert a handle obtained from layer 1: constructors,
    and methods that return a [GskRepeatingLinearGradientNode], give one already
    wrapped. *)

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  Ocgraphene.Point.point_t ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  repeating_linear_gradient_node_t
