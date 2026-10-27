(** The location and size of a rectangle region.

    The width and height of a #graphene_rect_t can be negative; for instance, a
    #graphene_rect_t with an origin of \[ 0, 0 \] and a size of \[ 10, 10 \] is
    equivalent to a #graphene_rect_t with an origin of \[ 10, 10 \] and a size
    of \[ -10, -10 \].

    Application code can normalize rectangles using graphene_rect_normalize();
    this function will ensure that the width and height of a rectangle are
    positive values. All functions taking a #graphene_rect_t as an argument will
    internally operate on a normalized copy; all functions returning a
    #graphene_rect_t will always return a normalized rectangle.

    Its methods, signals and properties are on {!class-type-rect_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Rect}. *)

(** The methods, signals and properties of a [graphene_rect_t]. *)
class type rect_t = object
  method contains_point : Raw.Point.t -> bool
  method contains_rect : Raw.Rect.t -> bool
  method equal : Raw.Rect.t -> bool
  method get_area : unit -> float
  method get_height : unit -> float
  method get_width : unit -> float
  method get_x : unit -> float
  method get_y : unit -> float
  method init : float -> float -> float -> float -> Raw.Rect.t
  method init_from_rect : Raw.Rect.t -> Raw.Rect.t
  method inset : float -> float -> Raw.Rect.t
  method normalize : unit -> Raw.Rect.t
  method offset : float -> float -> Raw.Rect.t
  method round_to_pixel : unit -> Raw.Rect.t
  method as_rect : Raw.Rect.t
end

class rect : Raw.Rect.t -> rect_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Rect.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_rect_t], give one already wrapped. *)
