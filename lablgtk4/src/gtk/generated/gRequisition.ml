(* High-level class for Requisition *)
class requisition (obj : Requisition.t) = object (self)

  method copy : unit -> Requisition.t =
    fun () ->
      (Requisition.copy obj)

  method free : unit -> unit =
    fun () ->
      (Requisition.free obj)

    method as_requisition = obj
end

