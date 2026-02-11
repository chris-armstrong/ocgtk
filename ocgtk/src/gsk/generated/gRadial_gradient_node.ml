(* High-level class for RadialGradientNode *)
class radial_gradient_node (obj : Radial_gradient_node.t) = object (self)

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

