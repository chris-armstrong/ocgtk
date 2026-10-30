(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type box_t = object
  (** {2:methods Methods} *)

  method contains_box : Raw.Box.t -> bool
  (** Checks whether the #graphene_box_t [a] contains the given #graphene_box_t
      [b]. *)

  method contains_point : Raw.Point3_d.t -> bool
  (** Checks whether [box] contains the given [point]. *)

  method equal : Raw.Box.t -> bool
  (** Checks whether the two given boxes are equal. *)

  method get_depth : unit -> float
  (** Retrieves the size of the [box] on the Z axis. *)

  method get_height : unit -> float
  (** Retrieves the size of the [box] on the Y axis. *)

  method get_width : unit -> float
  (** Retrieves the size of the [box] on the X axis. *)

  method init : Raw.Point3_d.t option -> Raw.Point3_d.t option -> Raw.Box.t
  (** Initializes the given #graphene_box_t with two vertices. *)

  method init_from_box : Raw.Box.t -> Raw.Box.t
  (** Initializes the given #graphene_box_t with the vertices of another
      #graphene_box_t. *)

  method init_from_points : int -> Raw.Point3_d.t array -> Raw.Box.t
  (** Initializes the given #graphene_box_t with the given array of vertices.

      If [n_points] is 0, the returned box is initialized with
      [graphene_box_empty ()]. *)

  method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Box.t
  (** Initializes the given #graphene_box_t with two vertices stored inside
      #graphene_vec3_t. *)

  method init_from_vectors : int -> Raw.Vec3.t array -> Raw.Box.t
  (** Initializes the given #graphene_box_t with the given array of vertices.

      If [n_vectors] is 0, the returned box is initialized with
      [graphene_box_empty ()]. *)

  (** {2:conversions Conversions} *)

  method as_box : Raw.Box.t
end

and sphere_t = object
  (** {2:methods Methods} *)

  method contains_point : Raw.Point3_d.t -> bool
  (** Checks whether the given [point] is contained in the volume of a
      #graphene_sphere_t. *)

  method distance : Raw.Point3_d.t -> float
  (** Computes the distance of the given [point] from the surface of a
      #graphene_sphere_t. *)

  method equal : Raw.Sphere.t -> bool
  (** Checks whether two #graphene_sphere_t are equal. *)

  method get_radius : unit -> float
  (** Retrieves the radius of a #graphene_sphere_t. *)

  method init : Raw.Point3_d.t option -> float -> Raw.Sphere.t
  (** Initializes the given #graphene_sphere_t with the given [center] and
      [radius]. *)

  method init_from_points :
    int -> Raw.Point3_d.t array -> Raw.Point3_d.t option -> Raw.Sphere.t
  (** Initializes the given #graphene_sphere_t using the given array of 3D
      coordinates so that the sphere includes them.

      The center of the sphere can either be specified, or will be center of the
      3D volume that encompasses all [points]. *)

  method init_from_vectors :
    int -> Raw.Vec3.t array -> Raw.Point3_d.t option -> Raw.Sphere.t
  (** Initializes the given #graphene_sphere_t using the given array of 3D
      coordinates so that the sphere includes them.

      The center of the sphere can either be specified, or will be center of the
      3D volume that encompasses all [vectors]. *)

  method is_empty : unit -> bool
  (** Checks whether the sphere has a zero radius. *)

  (** {2:conversions Conversions} *)

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
