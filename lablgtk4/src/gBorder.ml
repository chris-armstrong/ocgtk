(* High-level class for Border *)
class border (obj : Border.t) = object (self)

  method copy : unit -> Border.t = fun () -> (Border.copy obj )

  method free : unit -> unit = fun () -> (Border.free obj )

    method as_border = obj
end

