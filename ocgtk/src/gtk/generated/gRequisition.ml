class type requisition_t = object
    method copy : unit -> Requisition.t
    method free : unit -> unit
    method as_requisition : Requisition.t
end

(* High-level class for Requisition *)
class requisition (obj : Requisition.t) : requisition_t = object (self)

  method copy : unit -> Requisition.t =
    fun () ->
      (Requisition.copy obj)

  method free : unit -> unit =
    fun () ->
      (Requisition.free obj)

    method as_requisition = obj
end

let new_ () : requisition_t =
  new requisition (Requisition.new_ ())

