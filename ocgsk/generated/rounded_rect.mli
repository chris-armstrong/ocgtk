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

class rounded_rect : Raw.Rounded_rect.t -> rounded_rect_t
