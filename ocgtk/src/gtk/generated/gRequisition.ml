class type requisition_t = object
  method get_width : int
  method set_width : int -> unit
  method get_height : int
  method set_height : int -> unit
  method as_requisition : Requisition.t
end

(* High-level class for Requisition *)
class requisition (obj : Requisition.t) : requisition_t =
  object (self)
    method get_width : int = Requisition.get_width obj
    method set_width : int -> unit = fun v -> Requisition.set_width obj v
    method get_height : int = Requisition.get_height obj
    method set_height : int -> unit = fun v -> Requisition.set_height obj v
    method as_requisition = obj
  end

let new_ () : requisition_t = new requisition (Requisition.new_ ())

let make (width : int) (height : int) : requisition_t =
  new requisition (Requisition.make width height)
