(* GENERATED CODE - DO NOT EDIT *)
(* RoundedRect: RoundedRect *)

type t = [ `rounded_rect ] Gobject.obj
(** A rectangular region with rounded corners.

    Application code should normalize rectangles using
    [method@Gsk.RoundedRect.normalize]; this function will ensure that the
    bounds of the rectangle are normalized and ensure that the corner values are
    positive and the corners do not overlap.

    All functions taking a `GskRoundedRect` as an argument will internally
    operate on a normalized copy; all functions returning a `GskRoundedRect`
    will always return a normalized one.

    The algorithm used for normalizing corner sizes is described in
    [the CSS specification](https://drafts.csswg.org/css-backgrounds-3/#border-radius).
*)

(* Methods *)

external shrink : t -> float -> float -> float -> float -> t
  = "ml_gsk_rounded_rect_shrink"
(** Shrinks (or grows) the given rectangle by moving the 4 sides
according to the offsets given.

The corner radii will be changed in a way that tries to keep
the center of the corner circle intact. This emulates CSS behavior.

This function also works for growing rectangles if you pass
negative values for the @top, @right, @bottom or @left. *)

external offset : t -> float -> float -> t = "ml_gsk_rounded_rect_offset"
(** Offsets the bound's origin by @dx and @dy.

The size and corners of the rectangle are unchanged. *)

external normalize : t -> t = "ml_gsk_rounded_rect_normalize"
(** Normalizes the passed rectangle.

    This function will ensure that the bounds of the rectangle are normalized
    and ensure that the corner values are positive and the corners do not
    overlap. *)

external is_rectilinear : t -> bool = "ml_gsk_rounded_rect_is_rectilinear"
(** Checks if all corners of @self are right angles and the
rectangle covers all of its bounds.

This information can be used to decide if [ctor@Gsk.ClipNode.new]
or [ctor@Gsk.RoundedClipNode.new] should be called. *)

external intersects_rect : t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> bool
  = "ml_gsk_rounded_rect_intersects_rect"
(** Checks if part of the given @rect is contained inside the rounded rectangle. *)

external init_from_rect :
  t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> float -> t
  = "ml_gsk_rounded_rect_init_from_rect"
(** Initializes @self to the given @bounds and sets the radius
of all four corners to @radius. *)

external init_copy : t -> t -> t = "ml_gsk_rounded_rect_init_copy"
(** Initializes @self using the given @src rectangle.

This function will not normalize the `GskRoundedRect`,
so make sure the source is normalized. *)

external init :
  t ->
  Ocgtk_graphene.Graphene.Wrappers.Rect.t ->
  Ocgtk_graphene.Graphene.Wrappers.Size.t ->
  Ocgtk_graphene.Graphene.Wrappers.Size.t ->
  Ocgtk_graphene.Graphene.Wrappers.Size.t ->
  Ocgtk_graphene.Graphene.Wrappers.Size.t ->
  t = "ml_gsk_rounded_rect_init_bytecode" "ml_gsk_rounded_rect_init_native"
(** Initializes the given `GskRoundedRect` with the given values.

    This function will implicitly normalize the `GskRoundedRect` before
    returning. *)

external contains_rect : t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> bool
  = "ml_gsk_rounded_rect_contains_rect"
(** Checks if the given @rect is contained inside the rounded rectangle. *)

external contains_point : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t -> bool
  = "ml_gsk_rounded_rect_contains_point"
(** Checks if the given @point is inside the rounded rectangle. *)
