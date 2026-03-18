class rounded_rect : Rounded_rect.t ->
  object
    method contains_point : #Ocgtk_graphene.Graphene.point -> bool
    method contains_rect : #Ocgtk_graphene.Graphene.rect -> bool
    method init : #Ocgtk_graphene.Graphene.rect -> #Ocgtk_graphene.Graphene.size -> #Ocgtk_graphene.Graphene.size -> #Ocgtk_graphene.Graphene.size -> #Ocgtk_graphene.Graphene.size -> Rounded_rect.t
    method init_copy : Rounded_rect.t -> Rounded_rect.t
    method init_from_rect : #Ocgtk_graphene.Graphene.rect -> float -> Rounded_rect.t
    method intersects_rect : #Ocgtk_graphene.Graphene.rect -> bool
    method is_rectilinear : unit -> bool
    method normalize : unit -> Rounded_rect.t
    method offset : float -> float -> Rounded_rect.t
    method shrink : float -> float -> float -> float -> Rounded_rect.t
    method as_rounded_rect : Rounded_rect.t
  end

