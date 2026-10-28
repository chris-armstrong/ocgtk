(** The location and size of a rectangle region.

    Its methods, signals and properties are on {!class-type-rect_t}. Its full
    description is under {!section-description}. The functions it is built on
    are in {!Ocgraphene.Raw.Rect}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Rect].}

    The location and size of a rectangle region.

    The width and height of a #graphene_rect_t can be negative; for instance, a
    #graphene_rect_t with an origin of \[ 0, 0 \] and a size of \[ 10, 10 \] is
    equivalent to a #graphene_rect_t with an origin of \[ 10, 10 \] and a size
    of \[ -10, -10 \].

    Application code can normalize rectangles using graphene_rect_normalize();
    this function will ensure that the width and height of a rectangle are
    positive values. All functions taking a #graphene_rect_t as an argument will
    internally operate on a normalized copy; all functions returning a
    #graphene_rect_t will always return a normalized rectangle. *)
class type rect_t = object
  method contains_point : Raw.Point.t -> bool
  (** Checks whether a #graphene_rect_t contains the given coordinates. *)

  method contains_rect : Raw.Rect.t -> bool
  (** Checks whether a #graphene_rect_t fully contains the given rectangle. *)

  method equal : Raw.Rect.t -> bool
  (** Checks whether the two given rectangle are equal. *)

  method get_area : unit -> float
  (** Compute the area of given normalized rectangle. *)

  method get_height : unit -> float
  (** Retrieves the normalized height of the given rectangle. *)

  method get_width : unit -> float
  (** Retrieves the normalized width of the given rectangle. *)

  method get_x : unit -> float
  (** Retrieves the normalized X coordinate of the origin of the given
      rectangle. *)

  method get_y : unit -> float
  (** Retrieves the normalized Y coordinate of the origin of the given
      rectangle. *)

  method init : float -> float -> float -> float -> Raw.Rect.t
  (** Initializes the given #graphene_rect_t with the given values.

      This function will implicitly normalize the #graphene_rect_t before
      returning. *)

  method init_from_rect : Raw.Rect.t -> Raw.Rect.t
  (** Initializes [r] using the given [src] rectangle.

      This function will implicitly normalize the #graphene_rect_t before
      returning. *)

  method inset : float -> float -> Raw.Rect.t
  (** Changes the given rectangle to be smaller, or larger depending on the
      given inset parameters.

      To create an inset rectangle, use positive [d_x] or [d_y] values; to
      create a larger, encompassing rectangle, use negative [d_x] or [d_y]
      values.

      The origin of the rectangle is offset by [d_x] and [d_y], while the size
      is adjusted by [(2 * @d_x, 2 * @d_y)]. If [d_x] and [d_y] are positive
      values, the size of the rectangle is decreased; if [d_x] and [d_y] are
      negative values, the size of the rectangle is increased.

      If the size of the resulting inset rectangle has a negative width or
      height then the size will be set to zero. *)

  method normalize : unit -> Raw.Rect.t
  (** Normalizes the passed rectangle.

      This function ensures that the size of the rectangle is made of positive
      values, and that the origin is the top-left corner of the rectangle. *)

  method offset : float -> float -> Raw.Rect.t
  (** Offsets the origin by [d_x] and [d_y].

      The size of the rectangle is unchanged. *)

  method round_to_pixel : unit -> Raw.Rect.t
  (** Rounds the origin and the size of the given rectangle to their nearest
      integer values; the rounding is guaranteed to be large enough to contain
      the original rectangle. *)

  method as_rect : Raw.Rect.t
end

class rect : Raw.Rect.t -> rect_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Rect.t}. *)

(** {1:description Description}

    The location and size of a rectangle region.

    The width and height of a #graphene_rect_t can be negative; for instance, a
    #graphene_rect_t with an origin of \[ 0, 0 \] and a size of \[ 10, 10 \] is
    equivalent to a #graphene_rect_t with an origin of \[ 10, 10 \] and a size
    of \[ -10, -10 \].

    Application code can normalize rectangles using graphene_rect_normalize();
    this function will ensure that the width and height of a rectangle are
    positive values. All functions taking a #graphene_rect_t as an argument will
    internally operate on a normalized copy; all functions returning a
    #graphene_rect_t will always return a normalized rectangle. *)
