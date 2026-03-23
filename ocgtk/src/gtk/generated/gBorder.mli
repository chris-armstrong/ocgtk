class type border_t = object
    method copy : unit -> Border.t
    method free : unit -> unit
    method as_border : Border.t
end

class border : Border.t -> border_t

val new_ : unit -> border_t
