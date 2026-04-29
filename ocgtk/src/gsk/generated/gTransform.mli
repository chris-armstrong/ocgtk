class type transform_t = object
  method equal : Transform.t option -> bool
  method get_category : unit -> Gsk_enums.transformcategory
  method invert : unit -> Transform.t option
  method matrix : Ocgtk_graphene.Graphene.Matrix.matrix_t -> Transform.t
  method perspective : float -> Transform.t
  method ref : unit -> Transform.t option
  method rotate : float -> Transform.t option

  method rotate_3d :
    float -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> Transform.t option

  method scale : float -> float -> Transform.t option
  method scale_3d : float -> float -> float -> Transform.t option
  method skew : float -> float -> Transform.t option
  method to_string : unit -> string
  method transform : Transform.t option -> Transform.t option
  method translate : Ocgtk_graphene.Graphene.Point.point_t -> Transform.t option

  method translate_3d :
    Ocgtk_graphene.Graphene.Point3_d.point3_d_t -> Transform.t option

  method as_transform : Transform.t
end

class transform : Transform.t -> transform_t

val new_ : unit -> transform_t
