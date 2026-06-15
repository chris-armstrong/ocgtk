class type rounded_rect_t = object
  method contains_point : Ocgtk_graphene.Graphene.Point.point_t -> bool
  method contains_rect : Ocgtk_graphene.Graphene.Rect.rect_t -> bool

  method init :
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    Ocgtk_graphene.Graphene.Size.size_t ->
    Ocgtk_graphene.Graphene.Size.size_t ->
    Ocgtk_graphene.Graphene.Size.size_t ->
    Ocgtk_graphene.Graphene.Size.size_t ->
    Rounded_rect.t

  method init_from_rect :
    Ocgtk_graphene.Graphene.Rect.rect_t -> float -> Rounded_rect.t

  method intersects_rect : Ocgtk_graphene.Graphene.Rect.rect_t -> bool
  method is_rectilinear : unit -> bool
  method normalize : unit -> Rounded_rect.t
  method offset : float -> float -> Rounded_rect.t
  method shrink : float -> float -> float -> float -> Rounded_rect.t
  method get_bounds : Ocgtk_graphene.Graphene.Rect.rect_t
  method set_bounds : Ocgtk_graphene.Graphene.Rect.rect_t -> unit
  method get_corner : Ocgtk_graphene.Graphene.Wrappers.Size.t array
  method set_corner : Ocgtk_graphene.Graphene.Wrappers.Size.t array -> unit
  method as_rounded_rect : Rounded_rect.t
end

(* High-level class for RoundedRect *)
class rounded_rect (obj : Rounded_rect.t) : rounded_rect_t =
  object (self)
    method contains_point : Ocgtk_graphene.Graphene.Point.point_t -> bool =
      fun point ->
        let point = point#as_point in
        Rounded_rect.contains_point obj point

    method contains_rect : Ocgtk_graphene.Graphene.Rect.rect_t -> bool =
      fun rect ->
        let rect = rect#as_rect in
        Rounded_rect.contains_rect obj rect

    method init :
        Ocgtk_graphene.Graphene.Rect.rect_t ->
        Ocgtk_graphene.Graphene.Size.size_t ->
        Ocgtk_graphene.Graphene.Size.size_t ->
        Ocgtk_graphene.Graphene.Size.size_t ->
        Ocgtk_graphene.Graphene.Size.size_t ->
        Rounded_rect.t =
      fun bounds top_left top_right bottom_right bottom_left ->
        let bounds = bounds#as_rect in
        let top_left = top_left#as_size in
        let top_right = top_right#as_size in
        let bottom_right = bottom_right#as_size in
        let bottom_left = bottom_left#as_size in
        Rounded_rect.init obj bounds top_left top_right bottom_right bottom_left

    method init_from_rect :
        Ocgtk_graphene.Graphene.Rect.rect_t -> float -> Rounded_rect.t =
      fun bounds radius ->
        let bounds = bounds#as_rect in
        Rounded_rect.init_from_rect obj bounds radius

    method intersects_rect : Ocgtk_graphene.Graphene.Rect.rect_t -> bool =
      fun rect ->
        let rect = rect#as_rect in
        Rounded_rect.intersects_rect obj rect

    method is_rectilinear : unit -> bool =
      fun () -> Rounded_rect.is_rectilinear obj

    method normalize : unit -> Rounded_rect.t =
      fun () -> Rounded_rect.normalize obj

    method offset : float -> float -> Rounded_rect.t =
      fun dx dy -> Rounded_rect.offset obj dx dy

    method shrink : float -> float -> float -> float -> Rounded_rect.t =
      fun top right bottom left -> Rounded_rect.shrink obj top right bottom left

    method get_bounds : Ocgtk_graphene.Graphene.Rect.rect_t =
      new Ocgtk_graphene.Graphene.Rect.rect (Rounded_rect.get_bounds obj)

    method set_bounds : Ocgtk_graphene.Graphene.Rect.rect_t -> unit =
      fun v -> Rounded_rect.set_bounds obj v#as_rect

    method get_corner : Ocgtk_graphene.Graphene.Wrappers.Size.t array =
      Rounded_rect.get_corner obj

    method set_corner : Ocgtk_graphene.Graphene.Wrappers.Size.t array -> unit =
      fun v -> Rounded_rect.set_corner obj v

    method as_rounded_rect = obj
  end

let make (bounds : Ocgtk_graphene.Graphene.Rect.rect_t)
    (corner : Ocgtk_graphene.Graphene.Wrappers.Size.t array) : rounded_rect_t =
  new rounded_rect (Rounded_rect.make bounds#as_rect corner)
