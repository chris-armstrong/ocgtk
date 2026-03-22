class type radial_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_center : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method get_end : unit -> float
    method get_hradius : unit -> float
    method get_start : unit -> float
    method get_vradius : unit -> float
    method as_radial_gradient_node : Radial_gradient_node.t
end

(* High-level class for RadialGradientNode *)
class radial_gradient_node (obj : Radial_gradient_node.t) : radial_gradient_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_center : unit -> Ocgtk_graphene.Graphene.Point.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.Point.point(Radial_gradient_node.get_center obj)

  method get_end : unit -> float =
    fun () ->
      (Radial_gradient_node.get_end obj)

  method get_hradius : unit -> float =
    fun () ->
      (Radial_gradient_node.get_hradius obj)

  method get_start : unit -> float =
    fun () ->
      (Radial_gradient_node.get_start obj)

  method get_vradius : unit -> float =
    fun () ->
      (Radial_gradient_node.get_vradius obj)

    method as_radial_gradient_node = obj
end

