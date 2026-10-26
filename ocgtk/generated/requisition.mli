class type requisition_t = object
  method as_requisition : Requisition.t
end

class requisition : Requisition.t -> requisition_t

val new_ : unit -> requisition_t
