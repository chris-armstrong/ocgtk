class type color_matrix_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting its colors modified by the given
      [node]. *)

  method get_color_matrix : unit -> Ocgraphene.Matrix.matrix_t
  (** Retrieves the color matrix used by the [node]. *)

  method get_color_offset : unit -> Ocgraphene.Vec4.vec4_t
  (** Retrieves the color offset used by the [node]. *)

  method as_color_matrix_node : Raw.Color_matrix_node.t
end

(* High-level class for ColorMatrixNode *)
class color_matrix_node (obj : Raw.Color_matrix_node.t) : color_matrix_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () ->
        new Render_node.render_node (Raw.Color_matrix_node.get_child obj)

    method get_color_matrix : unit -> Ocgraphene.Matrix.matrix_t =
      fun () ->
        new Ocgraphene.Matrix.matrix
          (Raw.Color_matrix_node.get_color_matrix obj)

    method get_color_offset : unit -> Ocgraphene.Vec4.vec4_t =
      fun () ->
        new Ocgraphene.Vec4.vec4 (Raw.Color_matrix_node.get_color_offset obj)

    method as_color_matrix_node = obj
  end

let new_ (child : Render_node.render_node_t)
    (color_matrix : Ocgraphene.Matrix.matrix_t)
    (color_offset : Ocgraphene.Vec4.vec4_t) : color_matrix_node_t =
  let child = child#as_render_node in
  let color_matrix = color_matrix#as_matrix in
  let color_offset = color_offset#as_vec4 in
  let obj_ = Raw.Color_matrix_node.new_ child color_matrix color_offset in
  new color_matrix_node obj_
