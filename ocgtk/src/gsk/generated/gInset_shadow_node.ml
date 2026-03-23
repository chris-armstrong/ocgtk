class type inset_shadow_node_t = object
    inherit GRender_node.render_node_t
    method get_blur_radius : unit -> float
    method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method get_dx : unit -> float
    method get_dy : unit -> float
    method get_outline : unit -> Rounded_rect.t
    method get_spread : unit -> float
    method as_inset_shadow_node : Inset_shadow_node.t
end

(* High-level class for InsetShadowNode *)
class inset_shadow_node (obj : Inset_shadow_node.t) : inset_shadow_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_blur_radius : unit -> float =
    fun () ->
      (Inset_shadow_node.get_blur_radius obj)

  method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Rgb_a.rgb_a(Inset_shadow_node.get_color obj)

  method get_dx : unit -> float =
    fun () ->
      (Inset_shadow_node.get_dx obj)

  method get_dy : unit -> float =
    fun () ->
      (Inset_shadow_node.get_dy obj)

  method get_outline : unit -> Rounded_rect.t =
    fun () ->
      (Inset_shadow_node.get_outline obj)

  method get_spread : unit -> float =
    fun () ->
      (Inset_shadow_node.get_spread obj)

    method as_inset_shadow_node = obj
end

let new_ (outline : Rounded_rect.t) (color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t) (dx : float) (dy : float) (spread : float) (blur_radius : float) : inset_shadow_node_t =
  let color = color#as_rgb_a in
  new inset_shadow_node (Inset_shadow_node.new_ outline color dx dy spread blur_radius)

