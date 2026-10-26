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
  method as_rounded_rect : Rounded_rect.t
end

class rounded_rect : Rounded_rect.t -> rounded_rect_t
