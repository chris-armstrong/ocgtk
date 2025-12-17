class border : Border.t ->
  object
    method copy : unit -> Border.t
    method free : unit -> unit
    method as_border : Border.t
  end

