(* GENERATED CODE - DO NOT EDIT *)
(* Transform: Transform *)

(** `GskTransform` is an object to describe transform matrices.

Unlike `graphene_matrix_t`, `GskTransform` retains the steps in how
a transform was constructed, and allows inspecting them. It is modeled
after the way CSS describes transforms.

`GskTransform` objects are immutable and cannot be changed after creation.
This means code can safely expose them as properties of objects without
having to worry about others changing them. *)
type t = [`transform] Gobject.obj

(** Create a new Transform *)
external new_ : unit -> t = "ml_gsk_transform_new"

(* Methods *)
(** Releases a reference on the given `GskTransform`.

If the reference was the last, the resources associated to the @self are
freed. *)
external unref : t -> unit = "ml_gsk_transform_unref"

(** Translates @next by @point. *)
external translate_3d : t -> Ocgtk_graphene.Graphene.Wrappers.Point3_d.t -> t option = "ml_gsk_transform_translate_3d"

(** Translates @next in 2-dimensional space by @point. *)
external translate : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t -> t option = "ml_gsk_transform_translate"

(** Transforms a `graphene_point_t` using the given transform @self. *)
external transform_point : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t -> Ocgtk_graphene.Graphene.Wrappers.Point.t = "ml_gsk_transform_transform_point"

(** Transforms a `graphene_rect_t` using the given transform @self.

The result is the bounding box containing the coplanar quad. *)
external transform_bounds : t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t = "ml_gsk_transform_transform_bounds"

(** Applies all the operations from @other to @next. *)
external transform : t -> t option -> t option = "ml_gsk_transform_transform"

(** Converts a `GskTransform` to a translation operation.

@self must be a 2D transformation. If you are not
sure, use

    gsk_transform_get_category() >= %GSK_TRANSFORM_CATEGORY_2D_TRANSLATE

to check. *)
external to_translate : t -> float * float = "ml_gsk_transform_to_translate"

(** Converts a matrix into a string that is suitable for printing.

The resulting string can be parsed with [func@Gsk.Transform.parse].

This is a wrapper around [method@Gsk.Transform.print]. *)
external to_string : t -> string = "ml_gsk_transform_to_string"

(** Computes the actual value of @self and stores it in @out_matrix.

The previous value of @out_matrix will be ignored. *)
external to_matrix : t -> Ocgtk_graphene.Graphene.Wrappers.Matrix.t = "ml_gsk_transform_to_matrix"

(** Converts a `GskTransform` to 2D affine transformation factors.

To recreate an equivalent transform from the factors returned
by this function, use

    gsk_transform_scale (gsk_transform_translate (NULL,
                                                  &GRAPHENE_POINT_T (dx, dy)),
                         sx, sy)

@self must be a 2D affine transformation. If you are not
sure, use

    gsk_transform_get_category() >= %GSK_TRANSFORM_CATEGORY_2D_AFFINE

to check. *)
external to_affine : t -> float * float * float * float = "ml_gsk_transform_to_affine"

(** Converts a `GskTransform` to 2D transformation factors.

To recreate an equivalent transform from the factors returned
by this function, use

    gsk_transform_skew (
        gsk_transform_scale (
            gsk_transform_rotate (
                gsk_transform_translate (NULL, &GRAPHENE_POINT_T (dx, dy)),
                angle),
            scale_x, scale_y),
        skew_x, skew_y)

@self must be a 2D transformation. If you are not sure, use

    gsk_transform_get_category() >= %GSK_TRANSFORM_CATEGORY_2D

to check. *)
external to_2d_components : t -> float * float * float * float * float * float * float = "ml_gsk_transform_to_2d_components"

(** Converts a `GskTransform` to a 2D transformation matrix.

@self must be a 2D transformation. If you are not
sure, use gsk_transform_get_category() >=
%GSK_TRANSFORM_CATEGORY_2D to check.

The returned values have the following layout:

```
  | xx yx |   |  a  b  0 |
  | xy yy | = |  c  d  0 |
  | dx dy |   | tx ty  1 |
```

This function can be used to convert between a `GskTransform`
and a matrix type from other 2D drawing libraries, in particular
Cairo. *)
external to_2d : t -> float * float * float * float * float * float = "ml_gsk_transform_to_2d"

(** Applies a skew transform. *)
external skew : t -> float -> float -> t option = "ml_gsk_transform_skew"

(** Scales @next by the given factors. *)
external scale_3d : t -> float -> float -> float -> t option = "ml_gsk_transform_scale_3d"

(** Scales @next in 2-dimensional space by the given factors.

Use [method@Gsk.Transform.scale_3d] to scale in all 3 dimensions. *)
external scale : t -> float -> float -> t option = "ml_gsk_transform_scale"

(** Rotates @next @angle degrees around @axis.

For a rotation in 2D space, use [method@Gsk.Transform.rotate] *)
external rotate_3d : t -> float -> Ocgtk_graphene.Graphene.Wrappers.Vec3.t -> t option = "ml_gsk_transform_rotate_3d"

(** Rotates @next @angle degrees in 2D - or in 3D-speak, around the Z axis.
The rotation happens around the origin point of (0, 0). *)
external rotate : t -> float -> t option = "ml_gsk_transform_rotate"

(** Acquires a reference on the given `GskTransform`. *)
external ref : t -> t option = "ml_gsk_transform_ref"

(** Applies a perspective projection transform.

This transform scales points in X and Y based on their Z value,
scaling points with positive Z values away from the origin, and
those with negative Z values towards the origin. Points
on the z=0 plane are unchanged. *)
external perspective : t -> float -> t = "ml_gsk_transform_perspective"

(** Multiplies @next with the given @matrix. *)
external matrix : t -> Ocgtk_graphene.Graphene.Wrappers.Matrix.t -> t = "ml_gsk_transform_matrix"

(** Inverts the given transform.

If @self is not invertible, %NULL is returned.
Note that inverting %NULL also returns %NULL, which is
the correct inverse of %NULL. If you need to differentiate
between those cases, you should check @self is not %NULL
before calling this function. *)
external invert : t -> t option = "ml_gsk_transform_invert"

(** Returns the category this transform belongs to. *)
external get_category : t -> Gsk_enums.transformcategory = "ml_gsk_transform_get_category"

(** Checks two transforms for equality. *)
external equal : t -> t option -> bool = "ml_gsk_transform_equal"

