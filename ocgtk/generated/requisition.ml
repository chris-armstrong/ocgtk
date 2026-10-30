class type requisition_t = object
  (** {2:conversions Conversions} *)

  method as_requisition : Raw.Requisition.t
end

(* High-level class for Requisition *)
class requisition (obj : Raw.Requisition.t) : requisition_t =
  object (self)
    method as_requisition = obj
  end

let new_ () : requisition_t = new requisition (Raw.Requisition.new_ ())
