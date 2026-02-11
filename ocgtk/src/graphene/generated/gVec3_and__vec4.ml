(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
class vec3 (obj : Vec3_and__vec4.Vec3.t) = object (self)

  method dot : Vec3_and__vec4.Vec3.t -> float =
    fun b ->
      (Vec3_and__vec4.Vec3.dot obj b)

  method equal : Vec3_and__vec4.Vec3.t -> bool =
    fun v2 ->
      (Vec3_and__vec4.Vec3.equal obj v2)

  method free : unit -> unit =
    fun () ->
      (Vec3_and__vec4.Vec3.free obj)

  method get_x : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec3.get_x obj)

  method get_y : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec3.get_y obj)

  method get_z : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec3.get_z obj)

  method init : float -> float -> float -> Vec3_and__vec4.Vec3.t =
    fun x y z ->
      (Vec3_and__vec4.Vec3.init obj x y z)

  method init_from_float : float array -> Vec3_and__vec4.Vec3.t =
    fun src ->
      (Vec3_and__vec4.Vec3.init_from_float obj src)

  method init_from_vec3 : Vec3_and__vec4.Vec3.t -> Vec3_and__vec4.Vec3.t =
    fun src ->
      (Vec3_and__vec4.Vec3.init_from_vec3 obj src)

  method length : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec3.length obj)

  method near : Vec3_and__vec4.Vec3.t -> float -> bool =
    fun v2 epsilon ->
      (Vec3_and__vec4.Vec3.near obj v2 epsilon)

    method as_vec3 = obj
end

and vec4 (obj : Vec3_and__vec4.Vec4.t) = object (self)

  method dot : Vec3_and__vec4.Vec4.t -> float =
    fun b ->
      (Vec3_and__vec4.Vec4.dot obj b)

  method equal : Vec3_and__vec4.Vec4.t -> bool =
    fun v2 ->
      (Vec3_and__vec4.Vec4.equal obj v2)

  method free : unit -> unit =
    fun () ->
      (Vec3_and__vec4.Vec4.free obj)

  method get_w : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec4.get_w obj)

  method get_x : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec4.get_x obj)

  method get_y : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec4.get_y obj)

  method get_z : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec4.get_z obj)

  method init : float -> float -> float -> float -> Vec3_and__vec4.Vec4.t =
    fun x y z w ->
      (Vec3_and__vec4.Vec4.init obj x y z w)

  method init_from_float : float array -> Vec3_and__vec4.Vec4.t =
    fun src ->
      (Vec3_and__vec4.Vec4.init_from_float obj src)

  method init_from_vec2 : Vec2.t -> float -> float -> Vec3_and__vec4.Vec4.t =
    fun src z w ->
      (Vec3_and__vec4.Vec4.init_from_vec2 obj src z w)

  method init_from_vec3 : Vec3_and__vec4.Vec3.t -> float -> Vec3_and__vec4.Vec4.t =
    fun src w ->
      (Vec3_and__vec4.Vec4.init_from_vec3 obj src w)

  method init_from_vec4 : Vec3_and__vec4.Vec4.t -> Vec3_and__vec4.Vec4.t =
    fun src ->
      (Vec3_and__vec4.Vec4.init_from_vec4 obj src)

  method length : unit -> float =
    fun () ->
      (Vec3_and__vec4.Vec4.length obj)

  method near : Vec3_and__vec4.Vec4.t -> float -> bool =
    fun v2 epsilon ->
      (Vec3_and__vec4.Vec4.near obj v2 epsilon)

    method as_vec4 = obj
end
