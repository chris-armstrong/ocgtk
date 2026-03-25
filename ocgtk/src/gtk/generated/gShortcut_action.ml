class type shortcut_action_t = object
    method to_string : unit -> string
    method as_shortcut_action : Shortcut_action.t
end

(* High-level class for ShortcutAction *)
class shortcut_action (obj : Shortcut_action.t) : shortcut_action_t = object (self)

  method to_string : unit -> string =
    fun () ->
      (Shortcut_action.to_string obj)

    method as_shortcut_action = obj
end

let parse_string (string : string) : shortcut_action_t =
  let obj_ = Shortcut_action.parse_string string in
  new shortcut_action obj_

