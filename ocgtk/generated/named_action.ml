class type named_action_t = object
  inherit Shortcut_action.shortcut_action_t

  method get_action_name : unit -> string
  (** Returns the name of the action that will be activated. *)

  method as_named_action : Raw.Named_action.t
end

(* High-level class for NamedAction *)
class named_action (obj : Raw.Named_action.t) : named_action_t =
  object (self)
    inherit Shortcut_action.shortcut_action (obj :> Raw.Shortcut_action.t)

    method get_action_name : unit -> string =
      fun () -> Raw.Named_action.get_action_name obj

    method as_named_action = obj
  end

let new_ (name : string) : named_action_t =
  let obj_ = Raw.Named_action.new_ name in
  new named_action obj_
