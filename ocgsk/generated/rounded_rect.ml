class type rounded_rect_t = object
  method contains_point : Ocgraphene.Point.point_t -> bool
  (** Checks if the given point is inside the rounded rectangle. *)

  method contains_rect : Ocgraphene.Rect.rect_t -> bool
  (** Checks if the given rectangle is contained inside the rounded rectangle.
  *)

  method init :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Size.size_t ->
    Ocgraphene.Size.size_t ->
    Ocgraphene.Size.size_t ->
    Ocgraphene.Size.size_t ->
    Raw.Rounded_rect.t
  (** Initializes a rounded rectangle with the given values.

      This function will implicitly normalize the rounded rectangle before
      returning. *)

  method init_from_rect : Ocgraphene.Rect.rect_t -> float -> Raw.Rounded_rect.t
  (** Initializes a rounded rectangle to the given bounds and sets the radius of
      all four corners equally. *)

  method intersects_rect : Ocgraphene.Rect.rect_t -> bool
  (** Checks if part a rectangle is contained inside the rounded rectangle. *)

  method is_rectilinear : unit -> bool
  (** Checks if all corners of a rounded rectangle are right angles and the
      rectangle covers all of its bounds.

      This information can be used to decide if [Gsk.ClipNode.new] or
      [Gsk.RoundedClipNode.new] should be called. *)

  method normalize : unit -> Raw.Rounded_rect.t
  (** Normalizes a rounded rectangle.

      This function will ensure that the bounds of the rounded rectangle are
      normalized and ensure that the corner values are positive and the corners
      do not overlap. *)

  method offset : float -> float -> Raw.Rounded_rect.t
  (** Offsets the rounded rectangle's origin by [dx] and [dy].

      The size and corners of the rounded rectangle are unchanged. *)

  method shrink : float -> float -> float -> float -> Raw.Rounded_rect.t
  (** Shrinks (or grows) a rounded rectangle by moving the 4 sides according to
      the offsets given.

      The corner radii will be changed in a way that tries to keep the center of
      the corner circle intact. This emulates CSS behavior.

      This function also works for growing rounded rectangles if you pass
      negative values for the [top], [right], [bottom] or [left]. *)

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
