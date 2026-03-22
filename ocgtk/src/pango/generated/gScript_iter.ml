class type script_iter_t = object
    method free : unit -> unit
    method next : unit -> bool
    method as_script_iter : Script_iter.t
end

(* High-level class for ScriptIter *)
class script_iter (obj : Script_iter.t) : script_iter_t = object (self)

  method free : unit -> unit =
    fun () ->
      (Script_iter.free obj)

  method next : unit -> bool =
    fun () ->
      (Script_iter.next obj)

    method as_script_iter = obj
end

let new_ (text : string) (length : int) : script_iter_t =
  new script_iter (Script_iter.new_ text length)

