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

val new_ : unit -> transform_t
