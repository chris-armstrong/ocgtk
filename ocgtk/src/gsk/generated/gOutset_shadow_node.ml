(* High-level class for OutsetShadowNode *)
class outset_shadow_node (obj : Outset_shadow_node.t) = object (self)

  method get_blur_radius : unit -> float =
    fun () ->
      (Outset_shadow_node.get_blur_radius obj)

  method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a =
    fun () ->
      new  Ocgtk_gdk.Gdk.rgb_a(Outset_shadow_node.get_color obj)

  method get_dx : unit -> float =
    fun () ->
      (Outset_shadow_node.get_dx obj)

  method get_dy : unit -> float =
    fun () ->
      (Outset_shadow_node.get_dy obj)

  method get_outline : unit -> Rounded_rect.t =
    fun () ->
      (Outset_shadow_node.get_outline obj)

  method get_spread : unit -> float =
    fun () ->
      (Outset_shadow_node.get_spread obj)

    method as_outset_shadow_node = obj
end

