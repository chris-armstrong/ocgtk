class transform : Transform.t ->
  object
    method equal : Transform.t option -> bool
    method get_category : unit -> Gsk_enums.transformcategory
    method invert : unit -> Transform.t option
    method matrix : #Ocgtk_graphene.Graphene.matrix -> Transform.t
    method perspective : float -> Transform.t
    method ref : unit -> Transform.t option
    method rotate : float -> Transform.t option
    method rotate_3d : float -> #Ocgtk_graphene.Graphene.vec3 -> Transform.t option
    method scale : float -> float -> Transform.t option
    method scale_3d : float -> float -> float -> Transform.t option
    method skew : float -> float -> Transform.t option
    method to_string : unit -> string
    method transform : Transform.t option -> Transform.t option
    method translate : #Ocgtk_graphene.Graphene.point -> Transform.t option
    method translate_3d : #Ocgtk_graphene.Graphene.point3_d -> Transform.t option
    method unref : unit -> unit
    method as_transform : Transform.t
  end

