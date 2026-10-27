class type linear_gradient_node_t = object
  inherit Render_node.render_node_t

  method get_end : unit -> Ocgraphene.Point.point_t
  (** Retrieves the final point of the linear gradient. *)

  method get_n_color_stops : unit -> Gsize.t
  (** Retrieves the number of color stops in the gradient. *)

  method get_start : unit -> Ocgraphene.Point.point_t
  (** Retrieves the initial point of the linear gradient. *)

  method as_linear_gradient_node : Raw.Linear_gradient_node.t
end

(* High-level class for LinearGradientNode *)
class linear_gradient_node (obj : Raw.Linear_gradient_node.t) :
  linear_gradient_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_end : unit -> Ocgraphene.Point.point_t =
      fun () ->
        new Ocgraphene.Point.point (Raw.Linear_gradient_node.get_end obj)

    method get_n_color_stops : unit -> Gsize.t =
      fun () -> Raw.Linear_gradient_node.get_n_color_stops obj

    method get_start : unit -> Ocgraphene.Point.point_t =
      fun () ->
        new Ocgraphene.Point.point (Raw.Linear_gradient_node.get_start obj)

    method as_linear_gradient_node = obj
  end

let new_ (bounds : Ocgraphene.Rect.rect_t) (start : Ocgraphene.Point.point_t)
    (end_ : Ocgraphene.Point.point_t) (color_stops : Raw.Color_stop.t array)
    (n_color_stops : Gsize.t) : linear_gradient_node_t =
  let bounds = bounds#as_rect in
  let start = start#as_point in
  let end_ = end_#as_point in
  let obj_ =
    Raw.Linear_gradient_node.new_ bounds start end_ color_stops n_color_stops
  in
  new linear_gradient_node obj_
