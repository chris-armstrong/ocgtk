(** A rectangular region with rounded corners.

    Application code should normalize rectangles using
    [Gsk.RoundedRect.normalize]; this function will ensure that the bounds of
    the rectangle are normalized and ensure that the corner values are positive
    and the corners do not overlap.

    All functions taking a [GskRoundedRect] as an argument will internally
    operate on a normalized copy; all functions returning a [GskRoundedRect]
    will always return a normalized one.

    The algorithm used for normalizing corner sizes is described in
    {{:https://drafts.csswg.org/css-backgrounds-3/#border-radius}the CSS
     specification}.

    Its methods, signals and properties are on {!class-type-rounded_rect_t}. The
    functions it is built on are in {!Ocgsk.Raw.Rounded_rect}. *)

(** The methods, signals and properties of a [GskRoundedRect]. *)
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
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Rounded_rect.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskRoundedRect], give one already wrapped. *)
