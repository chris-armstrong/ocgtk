(* High-level class for Point3D *)
class point3_d (obj : Point3_d.t) = object (self)

  method dot : Point3_d.t -> float =
    fun b ->
      (Point3_d.dot obj b)

  method equal : Point3_d.t -> bool =
    fun b ->
      (Point3_d.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Point3_d.free obj)

  method init : float -> float -> float -> Point3_d.t =
    fun x y z ->
      (Point3_d.init obj x y z)

  method init_from_point : Point3_d.t -> Point3_d.t =
    fun src ->
      (Point3_d.init_from_point obj src)

  method init_from_vec3 : Vec3_and__vec4.Vec3.t -> Point3_d.t =
    fun v ->
      (Point3_d.init_from_vec3 obj v)

  method length : unit -> float =
    fun () ->
      (Point3_d.length obj)

  method near : Point3_d.t -> float -> bool =
    fun b epsilon ->
      (Point3_d.near obj b epsilon)

    method as_point3_d = obj
end

