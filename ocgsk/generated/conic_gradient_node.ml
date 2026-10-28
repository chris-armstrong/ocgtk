class type conic_gradient_node_t = object
  inherit Render_node.render_node_t

  method get_angle : unit -> float
  (** Retrieves the angle for the gradient in radians, normalized in \[0, 2 *
      PI\].

      The angle is starting at the top and going clockwise, as expressed in the
      css specification:

      angle = 90 - gsk_conic_gradient_node_get_rotation() *)

  method get_center : unit -> Ocgraphene.Point.point_t
  (** Retrieves the center pointer for the gradient. *)

  method get_n_color_stops : unit -> Gsize.t
  (** Retrieves the number of color stops in the gradient. *)

  method get_rotation : unit -> float
  (** Retrieves the rotation for the gradient in degrees. *)

  method as_conic_gradient_node : Raw.Conic_gradient_node.t
end

(* High-level class for ConicGradientNode *)
class conic_gradient_node (obj : Raw.Conic_gradient_node.t) :
  conic_gradient_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_angle : unit -> float =
      fun () -> Raw.Conic_gradient_node.get_angle obj

    method get_center : unit -> Ocgraphene.Point.point_t =
      fun () ->
        new Ocgraphene.Point.point (Raw.Conic_gradient_node.get_center obj)

    method get_n_color_stops : unit -> Gsize.t =
      fun () -> Raw.Conic_gradient_node.get_n_color_stops obj

    method get_rotation : unit -> float =
      fun () -> Raw.Conic_gradient_node.get_rotation obj

    method as_conic_gradient_node = obj
  end

let new_ (bounds : Ocgraphene.Rect.rect_t) (center : Ocgraphene.Point.point_t)
    (rotation : float) (color_stops : Raw.Color_stop.t array)
    (n_color_stops : Gsize.t) : conic_gradient_node_t =
  let bounds = bounds#as_rect in
  let center = center#as_point in
  let obj_ =
    Raw.Conic_gradient_node.new_ bounds center rotation color_stops
      n_color_stops
  in
  new conic_gradient_node obj_
