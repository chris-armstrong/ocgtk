class type point3_d_t = object
  method dot : Point3_d.t -> float
  method equal : Point3_d.t -> bool
  method init : float -> float -> float -> Point3_d.t
  method init_from_point : Point3_d.t -> Point3_d.t
  method init_from_vec3 : Vec3_and__vec4.Vec3.t -> Point3_d.t
  method length : unit -> float
  method near : Point3_d.t -> float -> bool
  method get_x : float
  method set_x : float -> unit
  method get_y : float
  method set_y : float -> unit
  method get_z : float
  method set_z : float -> unit
  method as_point3_d : Point3_d.t
end

(* High-level class for Point3D *)
class point3_d (obj : Point3_d.t) : point3_d_t =
  object (self)
    method dot : Point3_d.t -> float = fun b -> Point3_d.dot obj b
    method equal : Point3_d.t -> bool = fun b -> Point3_d.equal obj b

    method init : float -> float -> float -> Point3_d.t =
      fun x y z -> Point3_d.init obj x y z

    method init_from_point : Point3_d.t -> Point3_d.t =
      fun src -> Point3_d.init_from_point obj src

    method init_from_vec3 : Vec3_and__vec4.Vec3.t -> Point3_d.t =
      fun v -> Point3_d.init_from_vec3 obj v

    method length : unit -> float = fun () -> Point3_d.length obj

    method near : Point3_d.t -> float -> bool =
      fun b epsilon -> Point3_d.near obj b epsilon

    method get_x : float = Point3_d.get_x obj
    method set_x : float -> unit = fun v -> Point3_d.set_x obj v
    method get_y : float = Point3_d.get_y obj
    method set_y : float -> unit = fun v -> Point3_d.set_y obj v
    method get_z : float = Point3_d.get_z obj
    method set_z : float -> unit = fun v -> Point3_d.set_z obj v
    method as_point3_d = obj
  end

let alloc () : point3_d_t = new point3_d (Point3_d.alloc ())

let make (x : float) (y : float) (z : float) : point3_d_t =
  new point3_d (Point3_d.make x y z)
