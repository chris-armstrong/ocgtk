class type vec2_t = object
  method dot : Raw.Vec2.t -> float
  method equal : Raw.Vec2.t -> bool
  method get_x : unit -> float
  method get_y : unit -> float
  method init : float -> float -> Raw.Vec2.t
  method init_from_float : float array -> Raw.Vec2.t
  method init_from_vec2 : Raw.Vec2.t -> Raw.Vec2.t
  method length : unit -> float
  method near : Raw.Vec2.t -> float -> bool
  method as_vec2 : Raw.Vec2.t
end

(* High-level class for Vec2 *)
class vec2 (obj : Raw.Vec2.t) : vec2_t =
  object (self)
    method dot : Raw.Vec2.t -> float = fun b -> Raw.Vec2.dot obj b
    method equal : Raw.Vec2.t -> bool = fun v2 -> Raw.Vec2.equal obj v2
    method get_x : unit -> float = fun () -> Raw.Vec2.get_x obj
    method get_y : unit -> float = fun () -> Raw.Vec2.get_y obj

    method init : float -> float -> Raw.Vec2.t =
      fun x y -> Raw.Vec2.init obj x y

    method init_from_float : float array -> Raw.Vec2.t =
      fun src -> Raw.Vec2.init_from_float obj src

    method init_from_vec2 : Raw.Vec2.t -> Raw.Vec2.t =
      fun src -> Raw.Vec2.init_from_vec2 obj src

    method length : unit -> float = fun () -> Raw.Vec2.length obj

    method near : Raw.Vec2.t -> float -> bool =
      fun v2 epsilon -> Raw.Vec2.near obj v2 epsilon

    method as_vec2 = obj
  end

let alloc () : vec2_t = new vec2 (Raw.Vec2.alloc ())
