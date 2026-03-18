(* High-level class for Transform *)
class transform (obj : Transform.t) = object (self)

  method equal : Transform.t option -> bool =
    fun second ->
      (Transform.equal obj second)

  method get_category : unit -> Gsk_enums.transformcategory =
    fun () ->
      (Transform.get_category obj)

  method invert : unit -> Transform.t option =
    fun () ->
      (Transform.invert obj)

  method matrix : 'p1. (#Ocgtk_graphene.Graphene.matrix as 'p1) -> Transform.t =
    fun matrix ->
      let matrix = matrix#as_matrix in
      (Transform.matrix obj matrix)

  method perspective : float -> Transform.t =
    fun depth ->
      (Transform.perspective obj depth)

  method ref : unit -> Transform.t option =
    fun () ->
      (Transform.ref obj)

  method rotate : float -> Transform.t option =
    fun angle ->
      (Transform.rotate obj angle)

  method rotate_3d : 'p1. float -> (#Ocgtk_graphene.Graphene.vec3 as 'p1) -> Transform.t option =
    fun angle axis ->
      let axis = axis#as_vec3 in
      (Transform.rotate_3d obj angle axis)

  method scale : float -> float -> Transform.t option =
    fun factor_x factor_y ->
      (Transform.scale obj factor_x factor_y)

  method scale_3d : float -> float -> float -> Transform.t option =
    fun factor_x factor_y factor_z ->
      (Transform.scale_3d obj factor_x factor_y factor_z)

  method skew : float -> float -> Transform.t option =
    fun skew_x skew_y ->
      (Transform.skew obj skew_x skew_y)

  method to_string : unit -> string =
    fun () ->
      (Transform.to_string obj)

  method transform : Transform.t option -> Transform.t option =
    fun other ->
      (Transform.transform obj other)

  method translate : 'p1. (#Ocgtk_graphene.Graphene.point as 'p1) -> Transform.t option =
    fun point ->
      let point = point#as_point in
      (Transform.translate obj point)

  method translate_3d : 'p1. (#Ocgtk_graphene.Graphene.point3_d as 'p1) -> Transform.t option =
    fun point ->
      let point = point#as_point3_d in
      (Transform.translate_3d obj point)

  method unref : unit -> unit =
    fun () ->
      (Transform.unref obj)

    method as_transform = obj
end

