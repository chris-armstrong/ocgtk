(* High-level class for ConicGradientNode *)
class conic_gradient_node (obj : Conic_gradient_node.t) = object (self)

  method get_angle : unit -> float =
    fun () ->
      (Conic_gradient_node.get_angle obj)

  method get_rotation : unit -> float =
    fun () ->
      (Conic_gradient_node.get_rotation obj)

    method as_conic_gradient_node = obj
end

