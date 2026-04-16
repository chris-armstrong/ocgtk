class type vec2_t = object
  method dot : Vec2.t -> float
  method equal : Vec2.t -> bool
  method free : unit -> unit
  method get_x : unit -> float
  method get_y : unit -> float
  method init : float -> float -> Vec2.t
  method init_from_float : float array -> Vec2.t
  method init_from_vec2 : Vec2.t -> Vec2.t
  method length : unit -> float
  method near : Vec2.t -> float -> bool
  method as_vec2 : Vec2.t
end

(* High-level class for Vec2 *)
class vec2 (obj : Vec2.t) : vec2_t =
  object (self)
    method dot : Vec2.t -> float = fun b -> Vec2.dot obj b
    method equal : Vec2.t -> bool = fun v2 -> Vec2.equal obj v2
    method free : unit -> unit = fun () -> Vec2.free obj
    method get_x : unit -> float = fun () -> Vec2.get_x obj
    method get_y : unit -> float = fun () -> Vec2.get_y obj
    method init : float -> float -> Vec2.t = fun x y -> Vec2.init obj x y

    method init_from_float : float array -> Vec2.t =
      fun src -> Vec2.init_from_float obj src

    method init_from_vec2 : Vec2.t -> Vec2.t =
      fun src -> Vec2.init_from_vec2 obj src

    method length : unit -> float = fun () -> Vec2.length obj

    method near : Vec2.t -> float -> bool =
      fun v2 epsilon -> Vec2.near obj v2 epsilon

    method as_vec2 = obj
  end

let alloc () : vec2_t = new vec2 (Vec2.alloc ())
