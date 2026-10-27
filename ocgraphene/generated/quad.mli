(** A 4 vertex quadrilateral, as represented by four #graphene_point_t.

    The contents of a #graphene_quad_t are private and should never be accessed
    directly.

    Its methods, signals and properties are on {!class-type-quad_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Quad}. *)

(** The methods, signals and properties of a [graphene_quad_t]. *)
class type quad_t = object
  method contains : Raw.Point.t -> bool
  (** Checks if the given #graphene_quad_t contains the given #graphene_point_t.
  *)

  method get_point : int -> Raw.Point.t
  (** Retrieves the point of a #graphene_quad_t at the given index. *)

  method init :
    Raw.Point.t -> Raw.Point.t -> Raw.Point.t -> Raw.Point.t -> Raw.Quad.t
  (** Initializes a #graphene_quad_t with the given points. *)

  method init_from_points : Raw.Point.t array -> Raw.Quad.t
  (** Initializes a #graphene_quad_t using an array of points. *)

  method init_from_rect : Raw.Rect.t -> Raw.Quad.t
  (** Initializes a #graphene_quad_t using the four corners of the given
      #graphene_rect_t. *)

  method as_quad : Raw.Quad.t
end

class quad : Raw.Quad.t -> quad_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Quad.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_quad_t], give one already wrapped. *)

(** {2:constructors Constructors} *)

val alloc : unit -> quad_t
(** Allocates a new #graphene_quad_t instance.

    The contents of the returned instance are undefined. *)
