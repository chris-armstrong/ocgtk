class type requisition_t = object
  method get_width : int
  method set_width : int -> unit
  method get_height : int
  method set_height : int -> unit
  method as_requisition : Requisition.t
end

class requisition : Requisition.t -> requisition_t

val new_ : unit -> requisition_t
val make : int -> int -> requisition_t
