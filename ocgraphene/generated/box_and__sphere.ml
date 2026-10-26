(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type box_t = object
  method contains_box : Raw.Box.t -> bool
  method contains_point : Raw.Point3_d.t -> bool
  method equal : Raw.Box.t -> bool
  method get_depth : unit -> float
  method get_height : unit -> float
  method get_width : unit -> float
  method init : Raw.Point3_d.t option -> Raw.Point3_d.t option -> Raw.Box.t
  method init_from_box : Raw.Box.t -> Raw.Box.t
  method init_from_points : int -> Raw.Point3_d.t array -> Raw.Box.t
  method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Box.t
  method init_from_vectors : int -> Raw.Vec3.t array -> Raw.Box.t
  method as_box : Raw.Box.t
end

and sphere_t = object
  method contains_point : Raw.Point3_d.t -> bool
  method distance : Raw.Point3_d.t -> float
  method equal : Raw.Sphere.t -> bool
  method get_radius : unit -> float
  method init : Raw.Point3_d.t option -> float -> Raw.Sphere.t

  method init_from_points :
    int -> Raw.Point3_d.t array -> Raw.Point3_d.t option -> Raw.Sphere.t

  method init_from_vectors :
    int -> Raw.Vec3.t array -> Raw.Point3_d.t option -> Raw.Sphere.t

  method is_empty : unit -> bool
  method as_sphere : Raw.Sphere.t
end

class box (obj : Raw.Box.t) : box_t =
  object (self)
    method contains_box : Raw.Box.t -> bool =
      fun b -> Raw.Box.contains_box obj b

    method contains_point : Raw.Point3_d.t -> bool =
      fun point -> Raw.Box.contains_point obj point

    method equal : Raw.Box.t -> bool = fun b -> Raw.Box.equal obj b
    method get_depth : unit -> float = fun () -> Raw.Box.get_depth obj
    method get_height : unit -> float = fun () -> Raw.Box.get_height obj
    method get_width : unit -> float = fun () -> Raw.Box.get_width obj

    method init : Raw.Point3_d.t option -> Raw.Point3_d.t option -> Raw.Box.t =
      fun min max -> Raw.Box.init obj min max

    method init_from_box : Raw.Box.t -> Raw.Box.t =
      fun src -> Raw.Box.init_from_box obj src

    method init_from_points : int -> Raw.Point3_d.t array -> Raw.Box.t =
      fun n_points points -> Raw.Box.init_from_points obj n_points points

    method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Box.t
        =
      fun min max -> Raw.Box.init_from_vec3 obj min max

    method init_from_vectors : int -> Raw.Vec3.t array -> Raw.Box.t =
      fun n_vectors vectors -> Raw.Box.init_from_vectors obj n_vectors vectors

    method as_box = obj
  end

and sphere (obj : Raw.Sphere.t) : sphere_t =
  object (self)
    method contains_point : Raw.Point3_d.t -> bool =
      fun point -> Raw.Sphere.contains_point obj point

    method distance : Raw.Point3_d.t -> float =
      fun point -> Raw.Sphere.distance obj point

    method equal : Raw.Sphere.t -> bool = fun b -> Raw.Sphere.equal obj b
    method get_radius : unit -> float = fun () -> Raw.Sphere.get_radius obj

    method init : Raw.Point3_d.t option -> float -> Raw.Sphere.t =
      fun center radius -> Raw.Sphere.init obj center radius

    method init_from_points :
        int -> Raw.Point3_d.t array -> Raw.Point3_d.t option -> Raw.Sphere.t =
      fun n_points points center ->
        Raw.Sphere.init_from_points obj n_points points center

    method init_from_vectors :
        int -> Raw.Vec3.t array -> Raw.Point3_d.t option -> Raw.Sphere.t =
      fun n_vectors vectors center ->
        Raw.Sphere.init_from_vectors obj n_vectors vectors center

    method is_empty : unit -> bool = fun () -> Raw.Sphere.is_empty obj
    method as_sphere = obj
  end

let alloc () : box_t = new box (Raw.Box.alloc ())
let alloc () : sphere_t = new sphere (Raw.Sphere.alloc ())
