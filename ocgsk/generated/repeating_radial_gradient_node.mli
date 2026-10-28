(** A render node for a repeating radial gradient.

    Its methods, signals and properties are on
    {!class-type-repeating_radial_gradient_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Repeating_radial_gradient_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [RepeatingRadialGradientNode].}

    A render node for a repeating radial gradient. *)
class type repeating_radial_gradient_node_t = object
  inherit Render_node.render_node_t

  method as_repeating_radial_gradient_node :
    Raw.Repeating_radial_gradient_node.t
end

class repeating_radial_gradient_node :
  Raw.Repeating_radial_gradient_node.t ->
  repeating_radial_gradient_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Repeating_radial_gradient_node.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  float ->
  float ->
  float ->
  float ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  repeating_radial_gradient_node_t
(** Creates a [GskRenderNode] that draws a repeating radial gradient.

    The radial gradient starts around [center]. The size of the gradient is
    dictated by [hradius] in horizontal orientation and by [vradius] in vertical
    orientation. *)
