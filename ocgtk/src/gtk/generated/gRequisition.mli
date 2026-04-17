class type requisition_t = object
  method copy : unit -> Requisition.t
  method free : unit -> unit
  method as_requisition : Requisition.t
end

class requisition : Requisition.t -> requisition_t

val new_ : unit -> requisition_t
