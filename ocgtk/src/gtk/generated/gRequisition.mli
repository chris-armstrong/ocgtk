class requisition : Requisition.t ->
  object
    method copy : unit -> Requisition.t
    method free : unit -> unit
    method as_requisition : Requisition.t
  end

