class type rect_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_rect : Raw.Rect.t
end

(* High-level class for Rect *)
class rect (obj : Raw.Rect.t) : rect_t =
  object (self)
    method contains_point : Raw.Point.t -> bool =
      fun p -> Raw.Rect.contains_point obj p

    method contains_rect : Raw.Rect.t -> bool =
      fun b -> Raw.Rect.contains_rect obj b

    method equal : Raw.Rect.t -> bool = fun b -> Raw.Rect.equal obj b
    method get_area : unit -> float = fun () -> Raw.Rect.get_area obj
    method get_height : unit -> float = fun () -> Raw.Rect.get_height obj
    method get_width : unit -> float = fun () -> Raw.Rect.get_width obj
    method get_x : unit -> float = fun () -> Raw.Rect.get_x obj
    method get_y : unit -> float = fun () -> Raw.Rect.get_y obj

    method init : float -> float -> float -> float -> Raw.Rect.t =
      fun x y width height -> Raw.Rect.init obj x y width height

    method init_from_rect : Raw.Rect.t -> Raw.Rect.t =
      fun src -> Raw.Rect.init_from_rect obj src

    method inset : float -> float -> Raw.Rect.t =
      fun d_x d_y -> Raw.Rect.inset obj d_x d_y

    method normalize : unit -> Raw.Rect.t = fun () -> Raw.Rect.normalize obj

    method offset : float -> float -> Raw.Rect.t =
      fun d_x d_y -> Raw.Rect.offset obj d_x d_y

    method round_to_pixel : unit -> Raw.Rect.t =
      fun () -> Raw.Rect.round_to_pixel obj

    method as_rect = obj
  end
