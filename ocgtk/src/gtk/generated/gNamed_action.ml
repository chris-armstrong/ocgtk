class type named_action_t = object
    inherit GShortcut_action.shortcut_action_t
    method get_action_name : unit -> string
    method as_named_action : Named_action.t
end

(* High-level class for NamedAction *)
class named_action (obj : Named_action.t) : named_action_t = object (self)
  inherit GShortcut_action.shortcut_action (obj :> Shortcut_action.t)

  method get_action_name : unit -> string =
    fun () ->
      (Named_action.get_action_name obj)

    method as_named_action = obj
end

let new_ (name : string) : named_action_t =
  let obj_ = Named_action.new_ name in
  new named_action obj_

