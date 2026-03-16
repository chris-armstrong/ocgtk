class script_iter : Script_iter.t ->
  object
    method free : unit -> unit
    method next : unit -> bool
    method as_script_iter : Script_iter.t
  end

