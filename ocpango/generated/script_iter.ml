class type script_iter_t = object
  method next : unit -> bool
  (** Advances a [PangoScriptIter] to the next range.

      If [iter] is already at the end, it is left unchanged and [FALSE] is
      returned. *)

  method as_script_iter : Raw.Script_iter.t
end

(* High-level class for ScriptIter *)
class script_iter (obj : Raw.Script_iter.t) : script_iter_t =
  object (self)
    method next : unit -> bool = fun () -> Raw.Script_iter.next obj
    method as_script_iter = obj
  end

let new_ (text : string) (length : int) : script_iter_t =
  let obj_ = Raw.Script_iter.new_ text length in
  new script_iter obj_
