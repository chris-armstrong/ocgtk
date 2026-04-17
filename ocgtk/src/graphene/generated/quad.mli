(* GENERATED CODE - DO NOT EDIT *)
(* Quad: Quad *)

(** A 4 vertex quadrilateral, as represented by four #graphene_point_t.

The contents of a #graphene_quad_t are private and should never be
accessed directly. *)
type t = [`quad] Gobject.obj

(** Create a new Quad *)
external alloc : unit -> t = "ml_graphene_quad_alloc"

(* Methods *)
(** Initializes a #graphene_quad_t using the four corners of the
given #graphene_rect_t. *)
external init_from_rect : t -> Rect.t -> t = "ml_graphene_quad_init_from_rect"

(** Initializes a #graphene_quad_t using an array of points. *)
external init_from_points : t -> Point.t array -> t = "ml_graphene_quad_init_from_points"

(** Initializes a #graphene_quad_t with the given points. *)
external init : t -> Point.t -> Point.t -> Point.t -> Point.t -> t = "ml_graphene_quad_init"

(** Retrieves the point of a #graphene_quad_t at the given index. *)
external get_point : t -> int -> Point.t = "ml_graphene_quad_get_point"

(** Frees the resources allocated by graphene_quad_alloc() *)
external free : t -> unit = "ml_graphene_quad_free"

(** Checks if the given #graphene_quad_t contains the given #graphene_point_t. *)
external contains : t -> Point.t -> bool = "ml_graphene_quad_contains"

(** Computes the bounding rectangle of @q and places it into @r. *)
external bounds : t -> Rect.t = "ml_graphene_quad_bounds"

