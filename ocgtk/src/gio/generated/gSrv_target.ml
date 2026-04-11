class type srv_target_t = object
    method copy : unit -> Srv_target.t
    method free : unit -> unit
    method get_hostname : unit -> string
    method get_port : unit -> UInt16.t
    method get_priority : unit -> UInt16.t
    method get_weight : unit -> UInt16.t
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

  method get_port : unit -> UInt16.t =
    fun () ->
      (Srv_target.get_port obj)

  method get_priority : unit -> UInt16.t =
    fun () ->
      (Srv_target.get_priority obj)

  method get_weight : unit -> UInt16.t =
    fun () ->
      (Srv_target.get_weight obj)

    method as_srv_target = obj
end

let new_ (hostname : string) (port : UInt16.t) (priority : UInt16.t) (weight : UInt16.t) : srv_target_t =
  let obj_ = Srv_target.new_ hostname port priority weight in
  new srv_target obj_

