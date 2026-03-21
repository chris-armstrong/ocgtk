class type radial_gradient_node_t = object
    method get_center : unit -> Ocgtk_graphene.Graphene.point_t
    method get_end : unit -> float
    method get_hradius : unit -> float
    method get_start : unit -> float
    method get_vradius : unit -> float
    method as_radial_gradient_node : Radial_gradient_node.t
end

(* High-level class for RadialGradientNode *)
class radial_gradient_node (obj : Radial_gradient_node.t) : radial_gradient_node_t = object (self)

  method get_center : unit -> Ocgtk_graphene.Graphene.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.point(Radial_gradient_node.get_center obj)

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

