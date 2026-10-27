(** [GSimpleActionGroup] is a hash table filled with [Gio.Action] objects,
    implementing the [Gio.ActionGroup] and [Gio.ActionMap] interfaces.

    Its methods, signals and properties are on
    {!class-type-simple_action_group_t}. The functions it is built on are in
    {!Ocgio.Raw.Simple_action_group}. *)

(** The methods, signals and properties of a [GSimpleActionGroup]. *)
class type simple_action_group_t = object
  inherit Action_group.action_group_t
  inherit Action_map.action_map_t

  method insert : Action.action_t -> unit
  (** Adds an action to the action group.

      If the action group already contains an action with the same name as
      [action] then the old action is dropped from the group.

      The action group takes its own reference on [action]. *)

  method lookup : string -> Action.action_t
  (** Looks up the action with the name [action_name] in the group.

      If no such action exists, returns [NULL]. *)

  method remove : string -> unit
  (** Removes the named action from the action group.

      If no action of this name is in the group then nothing happens. *)

  method as_simple_action_group : Raw.Simple_action_group.t
end

class simple_action_group : Raw.Simple_action_group.t -> simple_action_group_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Simple_action_group.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GSimpleActionGroup], give one already wrapped. *)

val new_ : unit -> simple_action_group_t
