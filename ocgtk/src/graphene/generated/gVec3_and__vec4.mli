
class type vec3_t = object
    method dot : Vec3_and__vec4.Vec3.t -> float
    method equal : Vec3_and__vec4.Vec3.t -> bool
    method free : unit -> unit
    method get_x : unit -> float
    method get_y : unit -> float
    method get_z : unit -> float
    method init : float -> float -> float -> Vec3_and__vec4.Vec3.t
    method init_from_float : float array -> Vec3_and__vec4.Vec3.t
    method init_from_vec3 : Vec3_and__vec4.Vec3.t -> Vec3_and__vec4.Vec3.t
    method length : unit -> float
    method near : Vec3_and__vec4.Vec3.t -> float -> bool
    method as_vec3 : Vec3_and__vec4.Vec3.t
end

and vec4_t = object
    method dot : Vec3_and__vec4.Vec4.t -> float
    method equal : Vec3_and__vec4.Vec4.t -> bool
    method free : unit -> unit
    method get_w : unit -> float
    method get_x : unit -> float
    method get_y : unit -> float
    method get_z : unit -> float
    method init : float -> float -> float -> float -> Vec3_and__vec4.Vec4.t
    method init_from_float : float array -> Vec3_and__vec4.Vec4.t
    method init_from_vec2 : Vec2.t -> float -> float -> Vec3_and__vec4.Vec4.t
    method init_from_vec3 : Vec3_and__vec4.Vec3.t -> float -> Vec3_and__vec4.Vec4.t
    method init_from_vec4 : Vec3_and__vec4.Vec4.t -> Vec3_and__vec4.Vec4.t
    method length : unit -> float
    method near : Vec3_and__vec4.Vec4.t -> float -> bool
    method as_vec4 : Vec3_and__vec4.Vec4.t
end


class vec3 : Vec3_and__vec4.Vec3.t -> vec3_t

and vec4 : Vec3_and__vec4.Vec4.t -> vec4_t
