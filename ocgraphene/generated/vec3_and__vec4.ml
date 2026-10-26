(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type vec3_t = object
  method dot : Raw.Vec3.t -> float
  method equal : Raw.Vec3.t -> bool
  method get_x : unit -> float
  method get_y : unit -> float
  method get_z : unit -> float
  method init : float -> float -> float -> Raw.Vec3.t
  method init_from_float : float array -> Raw.Vec3.t
  method init_from_vec3 : Raw.Vec3.t -> Raw.Vec3.t
  method length : unit -> float
  method near : Raw.Vec3.t -> float -> bool
  method as_vec3 : Raw.Vec3.t
end

and vec4_t = object
  method dot : Raw.Vec4.t -> float
  method equal : Raw.Vec4.t -> bool
  method get_w : unit -> float
  method get_x : unit -> float
  method get_y : unit -> float
  method get_z : unit -> float
  method init : float -> float -> float -> float -> Raw.Vec4.t
  method init_from_float : float array -> Raw.Vec4.t
  method init_from_vec2 : Raw.Vec2.t -> float -> float -> Raw.Vec4.t
  method init_from_vec3 : Raw.Vec3.t -> float -> Raw.Vec4.t
  method init_from_vec4 : Raw.Vec4.t -> Raw.Vec4.t
  method length : unit -> float
  method near : Raw.Vec4.t -> float -> bool
  method as_vec4 : Raw.Vec4.t
end

class vec3 (obj : Raw.Vec3.t) : vec3_t =
  object (self)
    method dot : Raw.Vec3.t -> float = fun b -> Raw.Vec3.dot obj b
    method equal : Raw.Vec3.t -> bool = fun v2 -> Raw.Vec3.equal obj v2
    method get_x : unit -> float = fun () -> Raw.Vec3.get_x obj
    method get_y : unit -> float = fun () -> Raw.Vec3.get_y obj
    method get_z : unit -> float = fun () -> Raw.Vec3.get_z obj

    method init : float -> float -> float -> Raw.Vec3.t =
      fun x y z -> Raw.Vec3.init obj x y z

    method init_from_float : float array -> Raw.Vec3.t =
      fun src -> Raw.Vec3.init_from_float obj src

    method init_from_vec3 : Raw.Vec3.t -> Raw.Vec3.t =
      fun src -> Raw.Vec3.init_from_vec3 obj src

    method length : unit -> float = fun () -> Raw.Vec3.length obj

    method near : Raw.Vec3.t -> float -> bool =
      fun v2 epsilon -> Raw.Vec3.near obj v2 epsilon

    method as_vec3 = obj
  end

and vec4 (obj : Raw.Vec4.t) : vec4_t =
  object (self)
    method dot : Raw.Vec4.t -> float = fun b -> Raw.Vec4.dot obj b
    method equal : Raw.Vec4.t -> bool = fun v2 -> Raw.Vec4.equal obj v2
    method get_w : unit -> float = fun () -> Raw.Vec4.get_w obj
    method get_x : unit -> float = fun () -> Raw.Vec4.get_x obj
    method get_y : unit -> float = fun () -> Raw.Vec4.get_y obj
    method get_z : unit -> float = fun () -> Raw.Vec4.get_z obj

    method init : float -> float -> float -> float -> Raw.Vec4.t =
      fun x y z w -> Raw.Vec4.init obj x y z w

    method init_from_float : float array -> Raw.Vec4.t =
      fun src -> Raw.Vec4.init_from_float obj src

    method init_from_vec2 : Raw.Vec2.t -> float -> float -> Raw.Vec4.t =
      fun src z w -> Raw.Vec4.init_from_vec2 obj src z w

    method init_from_vec3 : Raw.Vec3.t -> float -> Raw.Vec4.t =
      fun src w -> Raw.Vec4.init_from_vec3 obj src w

    method init_from_vec4 : Raw.Vec4.t -> Raw.Vec4.t =
      fun src -> Raw.Vec4.init_from_vec4 obj src

    method length : unit -> float = fun () -> Raw.Vec4.length obj

    method near : Raw.Vec4.t -> float -> bool =
      fun v2 epsilon -> Raw.Vec4.near obj v2 epsilon

    method as_vec4 = obj
  end

let alloc () : vec3_t = new vec3 (Raw.Vec3.alloc ())
let alloc () : vec4_t = new vec4 (Raw.Vec4.alloc ())
