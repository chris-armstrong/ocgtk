class type srv_target_t = object
    method copy : unit -> Srv_target.t
    method free : unit -> unit
    method get_hostname : unit -> string
    method as_srv_target : Srv_target.t
end

(* High-level class for SrvTarget *)
class srv_target (obj : Srv_target.t) : srv_target_t = object (self)

  method copy : unit -> Srv_target.t =
    fun () ->
      (Srv_target.copy obj)

  method free : unit -> unit =
    fun () ->
      (Srv_target.free obj)

  method get_hostname : unit -> string =
    fun () ->
      (Srv_target.get_hostname obj)

    method as_srv_target = obj
end

