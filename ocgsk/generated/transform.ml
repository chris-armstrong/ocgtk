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

(* High-level class for Transform *)
class transform (obj : Raw.Transform.t) : transform_t =
  object (self)
    method equal : Raw.Transform.t option -> bool =
      fun second -> Raw.Transform.equal obj second

    method get_category : unit -> Enums.transformcategory =
      fun () -> Raw.Transform.get_category obj

    method invert : unit -> Raw.Transform.t option =
      fun () -> Raw.Transform.invert obj

    method matrix : Ocgraphene.Matrix.matrix_t -> Raw.Transform.t =
      fun matrix ->
        let matrix = matrix#as_matrix in
        Raw.Transform.matrix obj matrix

    method matrix_2d :
        float ->
        float ->
        float ->
        float ->
        float ->
        float ->
        Raw.Transform.t option =
      fun xx yx xy yy dx dy -> Raw.Transform.matrix_2d obj xx yx xy yy dx dy

    method perspective : float -> Raw.Transform.t =
      fun depth -> Raw.Transform.perspective obj depth

    method ref : unit -> Raw.Transform.t option =
      fun () -> Raw.Transform.ref obj

    method rotate : float -> Raw.Transform.t option =
      fun angle -> Raw.Transform.rotate obj angle

    method rotate_3d : float -> Ocgraphene.Vec3.vec3_t -> Raw.Transform.t option
        =
      fun angle axis ->
        let axis = axis#as_vec3 in
        Raw.Transform.rotate_3d obj angle axis

    method scale : float -> float -> Raw.Transform.t option =
      fun factor_x factor_y -> Raw.Transform.scale obj factor_x factor_y

    method scale_3d : float -> float -> float -> Raw.Transform.t option =
      fun factor_x factor_y factor_z ->
        Raw.Transform.scale_3d obj factor_x factor_y factor_z

    method skew : float -> float -> Raw.Transform.t option =
      fun skew_x skew_y -> Raw.Transform.skew obj skew_x skew_y

    method to_string : unit -> string = fun () -> Raw.Transform.to_string obj

    method transform : Raw.Transform.t option -> Raw.Transform.t option =
      fun other -> Raw.Transform.transform obj other

    method translate : Ocgraphene.Point.point_t -> Raw.Transform.t option =
      fun point ->
        let point = point#as_point in
        Raw.Transform.translate obj point

    method translate_3d :
        Ocgraphene.Point3_d.point3_d_t -> Raw.Transform.t option =
      fun point ->
        let point = point#as_point3_d in
        Raw.Transform.translate_3d obj point

    method as_transform = obj
  end

let new_ () : transform_t = new transform (Raw.Transform.new_ ())
