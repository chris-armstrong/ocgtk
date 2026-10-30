class type simple_action_group_t = object
  inherit Action_group.action_group_t
  inherit Action_map.action_map_t

  (** {2:methods Methods} *)

  method insert : Action.action_t -> unit
  (** Adds an action to the action group.

      If the action group already contains an action with the same name as
      [action] then the old action is dropped from the group.

      The action group takes its own reference on [action]. *)

  method lookup : string -> Action.action_t
  (** Looks up the action with the name [action_name] in the group.

      If no such action exists, returns [None]. *)

  method remove : string -> unit
  (** Removes the named action from the action group.

      If no action of this name is in the group then nothing happens. *)

  (** {2:conversions Conversions} *)

  method as_simple_action_group : Raw.Simple_action_group.t
end

(* High-level class for SimpleActionGroup *)
class simple_action_group (obj : Raw.Simple_action_group.t) :
  simple_action_group_t =
  object (self)
    inherit Action_group.action_group (Raw.Action_group.from_gobject obj)
    inherit Action_map.action_map (Raw.Action_map.from_gobject obj)

    method insert : Action.action_t -> unit =
      fun action ->
        let action = action#as_action in
        Raw.Simple_action_group.insert obj action

    method lookup : string -> Action.action_t =
      fun action_name ->
        new Action.action (Raw.Simple_action_group.lookup obj action_name)

    method remove : string -> unit =
      fun action_name -> Raw.Simple_action_group.remove obj action_name

    method as_simple_action_group = obj
  end

let new_ () : simple_action_group_t =
  new simple_action_group (Raw.Simple_action_group.new_ ())
