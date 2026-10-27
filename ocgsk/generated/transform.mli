(** Describes a 3D transform.

    Unlike [graphene_matrix_t], [GskTransform] retains the steps in how a
    transform was constructed, and allows inspecting them. It is modeled after
    the way CSS describes transforms.

    [GskTransform] objects are immutable and cannot be changed after creation.
    This means code can safely expose them as properties of objects without
    having to worry about others changing them.

    Its methods, signals and properties are on {!class-type-transform_t}. The
    functions it is built on are in {!Ocgsk.Raw.Transform}. *)

(** The methods, signals and properties of a [GskTransform]. *)
class type transform_t = object
  method equal : Raw.Transform.t option -> bool
  method get_category : unit -> Enums.transformcategory
  method invert : unit -> Raw.Transform.t option
  method matrix : Ocgraphene.Matrix.matrix_t -> Raw.Transform.t

  method matrix_2d :
    float -> float -> float -> float -> float -> float -> Raw.Transform.t option

  method perspective : float -> Raw.Transform.t
  method ref : unit -> Raw.Transform.t option
  method rotate : float -> Raw.Transform.t option
  method rotate_3d : float -> Ocgraphene.Vec3.vec3_t -> Raw.Transform.t option
  method scale : float -> float -> Raw.Transform.t option
  method scale_3d : float -> float -> float -> Raw.Transform.t option
  method skew : float -> float -> Raw.Transform.t option
  method to_string : unit -> string
  method transform : Raw.Transform.t option -> Raw.Transform.t option
  method translate : Ocgraphene.Point.point_t -> Raw.Transform.t option
  method translate_3d : Ocgraphene.Point3_d.point3_d_t -> Raw.Transform.t option
  method as_transform : Raw.Transform.t
end

class transform : Raw.Transform.t -> transform_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Transform.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskTransform], give one already wrapped. *)

val new_ : unit -> transform_t
