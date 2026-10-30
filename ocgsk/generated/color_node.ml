class type color_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  (** Retrieves the color of the given [node].

      The value returned by this function will not be correct if the render node
      was created for a non-sRGB color. *)

  (** {2:conversions Conversions} *)

  method as_color_node : Raw.Color_node.t
end

(* High-level class for ColorNode *)
class color_node (obj : Raw.Color_node.t) : color_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t =
      fun () -> new Ocgdk.Rgb_a.rgb_a (Raw.Color_node.get_color obj)

    method as_color_node = obj
  end

let new_ (rgba : Ocgdk.Rgb_a.rgb_a_t) (bounds : Ocgraphene.Rect.rect_t) :
    color_node_t =
  let rgba = rgba#as_rgb_a in
  let bounds = bounds#as_rect in
  let obj_ = Raw.Color_node.new_ rgba bounds in
  new color_node obj_
