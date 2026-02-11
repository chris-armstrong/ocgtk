(* High-level class for ScriptIter *)
class script_iter (obj : Script_iter.t) = object (self)

  method free : unit -> unit =
    fun () ->
      (Script_iter.free obj)

  method next : unit -> bool =
    fun () ->
      (Script_iter.next obj)

    method as_script_iter = obj
end

