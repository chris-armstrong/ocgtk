class type requisition_t = object
  method as_requisition : Requisition.t
end

(* High-level class for Requisition *)
class requisition (obj : Requisition.t) : requisition_t =
  object (self)
    method as_requisition = obj
  end

let new_ () : requisition_t = new requisition (Requisition.new_ ())
