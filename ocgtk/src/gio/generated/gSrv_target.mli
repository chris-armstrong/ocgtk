class type srv_target_t = object
  method get_hostname : unit -> string
  method get_port : unit -> UInt16.t
  method get_priority : unit -> UInt16.t
  method get_weight : unit -> UInt16.t
  method as_srv_target : Srv_target.t
end

class srv_target : Srv_target.t -> srv_target_t

val new_ : string -> UInt16.t -> UInt16.t -> UInt16.t -> srv_target_t
