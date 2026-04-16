class type border_t = object
  method copy : unit -> Border.t
  method free : unit -> unit
  method as_border : Border.t
end

(* High-level class for Border *)
class border (obj : Border.t) : border_t =
  object (self)
    method copy : unit -> Border.t = fun () -> Border.copy obj
    method free : unit -> unit = fun () -> Border.free obj
    method as_border = obj
  end

let new_ () : border_t = new border (Border.new_ ())
