(** A rectangular region with rounded corners.

    Its methods, signals and properties are on {!class-type-rounded_rect_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgsk.Raw.Rounded_rect}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [RoundedRect].}

    A rectangular region with rounded corners.

    Application code should normalize rectangles using
    [Gsk.RoundedRect.normalize]; this function will ensure that the bounds of
    the rectangle are normalized and ensure that the corner values are positive
    and the corners do not overlap.

    All functions taking a [GskRoundedRect] as an argument will internally
    operate on a normalized copy; all functions returning a [GskRoundedRect]
    will always return a normalized one.

    The algorithm used for normalizing corner sizes is described in
    {{:https://drafts.csswg.org/css-backgrounds-3/#border-radius}the CSS
     specification}. *)
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

class rounded_rect : Raw.Rounded_rect.t -> rounded_rect_t
(** Wraps a raw handle of {!Ocgsk.Raw.Rounded_rect.t}. *)

(** {1:description Description}

    A rectangular region with rounded corners.

    Application code should normalize rectangles using
    [Gsk.RoundedRect.normalize]; this function will ensure that the bounds of
    the rectangle are normalized and ensure that the corner values are positive
    and the corners do not overlap.

    All functions taking a [GskRoundedRect] as an argument will internally
    operate on a normalized copy; all functions returning a [GskRoundedRect]
    will always return a normalized one.

    The algorithm used for normalizing corner sizes is described in
    {{:https://drafts.csswg.org/css-backgrounds-3/#border-radius}the CSS
     specification}. *)
