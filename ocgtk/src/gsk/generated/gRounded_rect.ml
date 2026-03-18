(* High-level class for RoundedRect *)
class rounded_rect (obj : Rounded_rect.t) = object (self)

  method contains_point : 'p1. (#Ocgtk_graphene.Graphene.point as 'p1) -> bool =
    fun point ->
      let point = point#as_point in
      (Rounded_rect.contains_point obj point)

  method contains_rect : 'p1. (#Ocgtk_graphene.Graphene.rect as 'p1) -> bool =
    fun rect ->
      let rect = rect#as_rect in
      (Rounded_rect.contains_rect obj rect)

  method init : 'p1 'p2 'p3 'p4 'p5. (#Ocgtk_graphene.Graphene.rect as 'p1) -> (#Ocgtk_graphene.Graphene.size as 'p2) -> (#Ocgtk_graphene.Graphene.size as 'p3) -> (#Ocgtk_graphene.Graphene.size as 'p4) -> (#Ocgtk_graphene.Graphene.size as 'p5) -> Rounded_rect.t =
    fun bounds top_left top_right bottom_right bottom_left ->
      let bounds = bounds#as_rect in
      let top_left = top_left#as_size in
      let top_right = top_right#as_size in
      let bottom_right = bottom_right#as_size in
      let bottom_left = bottom_left#as_size in
      (Rounded_rect.init obj bounds top_left top_right bottom_right bottom_left)

  method init_copy : Rounded_rect.t -> Rounded_rect.t =
    fun src ->
      (Rounded_rect.init_copy obj src)

  method init_from_rect : 'p1. (#Ocgtk_graphene.Graphene.rect as 'p1) -> float -> Rounded_rect.t =
    fun bounds radius ->
      let bounds = bounds#as_rect in
      (Rounded_rect.init_from_rect obj bounds radius)

  method intersects_rect : 'p1. (#Ocgtk_graphene.Graphene.rect as 'p1) -> bool =
    fun rect ->
      let rect = rect#as_rect in
      (Rounded_rect.intersects_rect obj rect)

  method is_rectilinear : unit -> bool =
    fun () ->
      (Rounded_rect.is_rectilinear obj)

  method normalize : unit -> Rounded_rect.t =
    fun () ->
      (Rounded_rect.normalize obj)

  method offset : float -> float -> Rounded_rect.t =
    fun dx dy ->
      (Rounded_rect.offset obj dx dy)

  method shrink : float -> float -> float -> float -> Rounded_rect.t =
    fun top right bottom left ->
      (Rounded_rect.shrink obj top right bottom left)

    method as_rounded_rect = obj
end

