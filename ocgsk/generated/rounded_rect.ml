class type rounded_rect_t = object
  method contains_point : Ocgraphene.Point.point_t -> bool
  method contains_rect : Ocgraphene.Rect.rect_t -> bool

  method init :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Size.size_t ->
    Ocgraphene.Size.size_t ->
    Ocgraphene.Size.size_t ->
    Ocgraphene.Size.size_t ->
    Raw.Rounded_rect.t

  method init_from_rect : Ocgraphene.Rect.rect_t -> float -> Raw.Rounded_rect.t
  method intersects_rect : Ocgraphene.Rect.rect_t -> bool
  method is_rectilinear : unit -> bool
  method normalize : unit -> Raw.Rounded_rect.t
  method offset : float -> float -> Raw.Rounded_rect.t
  method shrink : float -> float -> float -> float -> Raw.Rounded_rect.t
  method as_rounded_rect : Raw.Rounded_rect.t
end

(* High-level class for RoundedRect *)
class rounded_rect (obj : Raw.Rounded_rect.t) : rounded_rect_t =
  object (self)
    method contains_point : Ocgraphene.Point.point_t -> bool =
      fun point ->
        let point = point#as_point in
        Raw.Rounded_rect.contains_point obj point

    method contains_rect : Ocgraphene.Rect.rect_t -> bool =
      fun rect ->
        let rect = rect#as_rect in
        Raw.Rounded_rect.contains_rect obj rect

    method init :
        Ocgraphene.Rect.rect_t ->
        Ocgraphene.Size.size_t ->
        Ocgraphene.Size.size_t ->
        Ocgraphene.Size.size_t ->
        Ocgraphene.Size.size_t ->
        Raw.Rounded_rect.t =
      fun bounds top_left top_right bottom_right bottom_left ->
        let bounds = bounds#as_rect in
        let top_left = top_left#as_size in
        let top_right = top_right#as_size in
        let bottom_right = bottom_right#as_size in
        let bottom_left = bottom_left#as_size in
        Raw.Rounded_rect.init obj bounds top_left top_right bottom_right
          bottom_left

    method init_from_rect :
        Ocgraphene.Rect.rect_t -> float -> Raw.Rounded_rect.t =
      fun bounds radius ->
        let bounds = bounds#as_rect in
        Raw.Rounded_rect.init_from_rect obj bounds radius

    method intersects_rect : Ocgraphene.Rect.rect_t -> bool =
      fun rect ->
        let rect = rect#as_rect in
        Raw.Rounded_rect.intersects_rect obj rect

    method is_rectilinear : unit -> bool =
      fun () -> Raw.Rounded_rect.is_rectilinear obj

    method normalize : unit -> Raw.Rounded_rect.t =
      fun () -> Raw.Rounded_rect.normalize obj

    method offset : float -> float -> Raw.Rounded_rect.t =
      fun dx dy -> Raw.Rounded_rect.offset obj dx dy

    method shrink : float -> float -> float -> float -> Raw.Rounded_rect.t =
      fun top right bottom left ->
        Raw.Rounded_rect.shrink obj top right bottom left

    method as_rounded_rect = obj
  end
