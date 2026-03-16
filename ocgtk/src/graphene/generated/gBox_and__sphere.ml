(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
class box (obj : Box_and__sphere.Box.t) = object (self)

  method contains_box : Box_and__sphere.Box.t -> bool =
    fun b ->
      (Box_and__sphere.Box.contains_box obj b)

  method contains_point : Point3_d.t -> bool =
    fun point ->
      (Box_and__sphere.Box.contains_point obj point)

  method equal : Box_and__sphere.Box.t -> bool =
    fun b ->
      (Box_and__sphere.Box.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Box_and__sphere.Box.free obj)

  method get_depth : unit -> float =
    fun () ->
      (Box_and__sphere.Box.get_depth obj)

  method get_height : unit -> float =
    fun () ->
      (Box_and__sphere.Box.get_height obj)

  method get_width : unit -> float =
    fun () ->
      (Box_and__sphere.Box.get_width obj)

  method init : Point3_d.t option -> Point3_d.t option -> Box_and__sphere.Box.t =
    fun min max ->
      (Box_and__sphere.Box.init obj min max)

  method init_from_box : Box_and__sphere.Box.t -> Box_and__sphere.Box.t =
    fun src ->
      (Box_and__sphere.Box.init_from_box obj src)

  method init_from_points : int -> Point3_d.t array -> Box_and__sphere.Box.t =
    fun n_points points ->
      (Box_and__sphere.Box.init_from_points obj n_points points)

  method init_from_vec3 : Vec3_and__vec4.Vec3.t option -> Vec3_and__vec4.Vec3.t option -> Box_and__sphere.Box.t =
    fun min max ->
      (Box_and__sphere.Box.init_from_vec3 obj min max)

  method init_from_vectors : int -> Vec3_and__vec4.Vec3.t array -> Box_and__sphere.Box.t =
    fun n_vectors vectors ->
      (Box_and__sphere.Box.init_from_vectors obj n_vectors vectors)

    method as_box = obj
end

and sphere (obj : Box_and__sphere.Sphere.t) = object (self)

  method contains_point : Point3_d.t -> bool =
    fun point ->
      (Box_and__sphere.Sphere.contains_point obj point)

  method distance : Point3_d.t -> float =
    fun point ->
      (Box_and__sphere.Sphere.distance obj point)

  method equal : Box_and__sphere.Sphere.t -> bool =
    fun b ->
      (Box_and__sphere.Sphere.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Box_and__sphere.Sphere.free obj)

  method get_radius : unit -> float =
    fun () ->
      (Box_and__sphere.Sphere.get_radius obj)

  method init : Point3_d.t option -> float -> Box_and__sphere.Sphere.t =
    fun center radius ->
      (Box_and__sphere.Sphere.init obj center radius)

  method init_from_points : int -> Point3_d.t array -> Point3_d.t option -> Box_and__sphere.Sphere.t =
    fun n_points points center ->
      (Box_and__sphere.Sphere.init_from_points obj n_points points center)

  method init_from_vectors : int -> Vec3_and__vec4.Vec3.t array -> Point3_d.t option -> Box_and__sphere.Sphere.t =
    fun n_vectors vectors center ->
      (Box_and__sphere.Sphere.init_from_vectors obj n_vectors vectors center)

  method is_empty : unit -> bool =
    fun () ->
      (Box_and__sphere.Sphere.is_empty obj)

    method as_sphere = obj
end
