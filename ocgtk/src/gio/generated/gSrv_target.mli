class type srv_target_t = object
    method copy : unit -> Srv_target.t
    method free : unit -> unit
    method get_hostname : unit -> string
    method get_port : unit -> int
    method get_priority : unit -> int
    method get_weight : unit -> int
    method as_srv_target : Srv_target.t
end

class srv_target : Srv_target.t -> srv_target_t

val new_ : string -> int -> int -> int -> srv_target_t
