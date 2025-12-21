(* High-level class for SrvTarget *)
class srv_target (obj : Srv_target.t) = object (self)

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

