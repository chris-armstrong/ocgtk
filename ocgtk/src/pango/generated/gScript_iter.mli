class type script_iter_t = object
    method free : unit -> unit
    method next : unit -> bool
    method as_script_iter : Script_iter.t
end

class script_iter : Script_iter.t -> script_iter_t

val new_ : string -> int -> script_iter_t
