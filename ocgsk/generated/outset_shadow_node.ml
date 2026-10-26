class type outset_shadow_node_t = object
  inherit Render_node.render_node_t
  method get_blur_radius : unit -> float
  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  method get_dx : unit -> float
  method get_dy : unit -> float
  method get_outline : unit -> Raw.Rounded_rect.t
  method get_spread : unit -> float
  method as_outset_shadow_node : Raw.Outset_shadow_node.t
end

(* High-level class for OutsetShadowNode *)
class outset_shadow_node (obj : Raw.Outset_shadow_node.t) : outset_shadow_node_t
  =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_blur_radius : unit -> float =
      fun () -> Raw.Outset_shadow_node.get_blur_radius obj

    method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t =
      fun () -> new Ocgdk.Rgb_a.rgb_a (Raw.Outset_shadow_node.get_color obj)

    method get_dx : unit -> float = fun () -> Raw.Outset_shadow_node.get_dx obj
    method get_dy : unit -> float = fun () -> Raw.Outset_shadow_node.get_dy obj

    method get_outline : unit -> Raw.Rounded_rect.t =
      fun () -> Raw.Outset_shadow_node.get_outline obj

    method get_spread : unit -> float =
      fun () -> Raw.Outset_shadow_node.get_spread obj

    method as_outset_shadow_node = obj
  end

let new_ (outline : Raw.Rounded_rect.t) (color : Ocgdk.Rgb_a.rgb_a_t)
    (dx : float) (dy : float) (spread : float) (blur_radius : float) :
    outset_shadow_node_t =
  let color = color#as_rgb_a in
  let obj_ =
    Raw.Outset_shadow_node.new_ outline color dx dy spread blur_radius
  in
  new outset_shadow_node obj_
