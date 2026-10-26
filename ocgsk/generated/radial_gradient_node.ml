class type radial_gradient_node_t = object
  inherit Render_node.render_node_t
  method get_center : unit -> Ocgraphene.Point.point_t
  method get_end : unit -> float
  method get_hradius : unit -> float
  method get_n_color_stops : unit -> Gsize.t
  method get_start : unit -> float
  method get_vradius : unit -> float
  method as_radial_gradient_node : Raw.Radial_gradient_node.t
end

(* High-level class for RadialGradientNode *)
class radial_gradient_node (obj : Raw.Radial_gradient_node.t) :
  radial_gradient_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_center : unit -> Ocgraphene.Point.point_t =
      fun () ->
        new Ocgraphene.Point.point (Raw.Radial_gradient_node.get_center obj)

    method get_end : unit -> float =
      fun () -> Raw.Radial_gradient_node.get_end obj

    method get_hradius : unit -> float =
      fun () -> Raw.Radial_gradient_node.get_hradius obj

    method get_n_color_stops : unit -> Gsize.t =
      fun () -> Raw.Radial_gradient_node.get_n_color_stops obj

    method get_start : unit -> float =
      fun () -> Raw.Radial_gradient_node.get_start obj

    method get_vradius : unit -> float =
      fun () -> Raw.Radial_gradient_node.get_vradius obj

    method as_radial_gradient_node = obj
  end

let new_ (bounds : Ocgraphene.Rect.rect_t) (center : Ocgraphene.Point.point_t)
    (hradius : float) (vradius : float) (start : float) (end_ : float)
    (color_stops : Raw.Color_stop.t array) (n_color_stops : Gsize.t) :
    radial_gradient_node_t =
  let bounds = bounds#as_rect in
  let center = center#as_point in
  let obj_ =
    Raw.Radial_gradient_node.new_ bounds center hradius vradius start end_
      color_stops n_color_stops
  in
  new radial_gradient_node obj_
