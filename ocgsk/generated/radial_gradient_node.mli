(** A render node for a radial gradient.

    Its methods, signals and properties are on
    {!class-type-radial_gradient_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Radial_gradient_node}. *)

(** The methods, signals and properties of a [RadialGradientNode]. *)
class type radial_gradient_node_t = object
  inherit Render_node.render_node_t

  method get_center : unit -> Ocgraphene.Point.point_t
  (** Retrieves the center pointer for the gradient. *)

  method get_end : unit -> float
  (** Retrieves the end value for the gradient. *)

  method get_hradius : unit -> float
  (** Retrieves the horizontal radius for the gradient. *)

  method get_n_color_stops : unit -> Gsize.t
  (** Retrieves the number of color stops in the gradient. *)

  method get_start : unit -> float
  (** Retrieves the start value for the gradient. *)

  method get_vradius : unit -> float
  (** Retrieves the vertical radius for the gradient. *)

  method as_radial_gradient_node : Raw.Radial_gradient_node.t
end

class radial_gradient_node :
  Raw.Radial_gradient_node.t ->
  radial_gradient_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Radial_gradient_node.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  float ->
  float ->
  float ->
  float ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  radial_gradient_node_t
(** Creates a [GskRenderNode] that draws a radial gradient.

    The radial gradient starts around [center]. The size of the gradient is
    dictated by [hradius] in horizontal orientation and by [vradius] in vertical
    orientation. *)
