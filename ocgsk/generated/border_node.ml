class type border_node_t = object
  inherit Render_node.render_node_t
  method get_colors : unit -> Ocgdk.Raw.Rgb_a.t array
  method get_outline : unit -> Raw.Rounded_rect.t
  method get_widths : unit -> float array
  method as_border_node : Raw.Border_node.t
end

(* High-level class for BorderNode *)
class border_node (obj : Raw.Border_node.t) : border_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_colors : unit -> Ocgdk.Raw.Rgb_a.t array =
      fun () -> Raw.Border_node.get_colors obj

    method get_outline : unit -> Raw.Rounded_rect.t =
      fun () -> Raw.Border_node.get_outline obj

    method get_widths : unit -> float array =
      fun () -> Raw.Border_node.get_widths obj

    method as_border_node = obj
  end

let new_ (outline : Raw.Rounded_rect.t) (border_width : float array)
    (border_color : Ocgdk.Raw.Rgb_a.t array) : border_node_t =
  let obj_ = Raw.Border_node.new_ outline border_width border_color in
  new border_node obj_
