(** A render node controlling the color matrix of its single child node.

    Its methods, signals and properties are on
    {!class-type-color_matrix_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Color_matrix_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColorMatrixNode].}

    Inherits from:
    {{!Ocgsk.Render_node.class-type-render_node_t}Ocgsk.Render_node}

    A render node controlling the color matrix of its single child node. *)
class type color_matrix_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting its colors modified by the given
      [node]. *)

  method get_color_matrix : unit -> Ocgraphene.Matrix.matrix_t
  (** Retrieves the color matrix used by the [node]. *)

  method get_color_offset : unit -> Ocgraphene.Vec4.vec4_t
  (** Retrieves the color offset used by the [node]. *)

  (** {2:conversions Conversions} *)

  method as_color_matrix_node : Raw.Color_matrix_node.t
end

class color_matrix_node : Raw.Color_matrix_node.t -> color_matrix_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Color_matrix_node.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Render_node.render_node_t ->
  Ocgraphene.Matrix.matrix_t ->
  Ocgraphene.Vec4.vec4_t ->
  color_matrix_node_t
(** Creates a [GskRenderNode] that will drawn the [child] with [color_matrix].

    In particular, the node will transform colors by applying

    pixel = transpose(color_matrix) * pixel + color_offset

    for every pixel. The transformation operates on unpremultiplied colors, with
    color components ordered R, G, B, A. *)
