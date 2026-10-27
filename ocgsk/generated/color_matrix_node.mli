(** A render node controlling the color matrix of its single child node.

    Its methods, signals and properties are on
    {!class-type-color_matrix_node_t}. The functions it is built on are in
    {!Ocgsk.Raw.Color_matrix_node}. *)

(** The methods, signals and properties of a [GskColorMatrixNode]. *)
class type color_matrix_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_color_matrix : unit -> Ocgraphene.Matrix.matrix_t
  method get_color_offset : unit -> Ocgraphene.Vec4.vec4_t
  method as_color_matrix_node : Raw.Color_matrix_node.t
end

class color_matrix_node : Raw.Color_matrix_node.t -> color_matrix_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Color_matrix_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskColorMatrixNode], give one already wrapped. *)

val new_ :
  Render_node.render_node_t ->
  Ocgraphene.Matrix.matrix_t ->
  Ocgraphene.Vec4.vec4_t ->
  color_matrix_node_t
