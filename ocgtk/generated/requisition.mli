class type requisition_t = object
  method as_requisition : Raw.Requisition.t
end

class requisition : Raw.Requisition.t -> requisition_t

val new_ : unit -> requisition_t
