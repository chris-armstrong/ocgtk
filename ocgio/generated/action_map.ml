class type action_map_t = object
  (** {2:methods Methods} *)

  method add_action : Action.action_t -> unit
  (** Adds an action to the [action_map].

      If the action map already contains an action with the same name as
      [action] then the old action is dropped from the action map.

      The action map takes its own reference on [action]. *)

  method lookup_action : string -> Action.action_t option
  (** Looks up the action with the name [action_name] in [action_map].

      If no such action exists, returns [NULL]. *)

  method remove_action : string -> unit
  (** Removes the named action from the action map.

      If no action of this name is in the map then nothing happens. *)

  method remove_action_entries : Raw.Action_entry.t array -> int -> unit
  [@@ocaml.doc
    "Remove actions from a [Gio.ActionMap]. This is meant as the reverse of\n\
     [Gio.ActionMap.add_action_entries].\n\n\
     {[\n\
     static const GActionEntry entries[] = {\n\
    \    { \"quit\",         activate_quit              },\n\
    \    { \"print-string\", activate_print_string, \"s\" }\n\
     };\n\n\
     void\n\
     add_actions (GActionMap *map)\n\
     {\n\
    \  g_action_map_add_action_entries (map, entries, G_N_ELEMENTS (entries), \
     NULL);\n\
     }\n\n\
     void\n\
     remove_actions (GActionMap *map)\n\
     {\n\
    \  g_action_map_remove_action_entries (map, entries, G_N_ELEMENTS \
     (entries));\n\
     }\n\
     ]}"]

  (** {2:conversions Conversions} *)

  method as_action_map : Raw.Action_map.t
end

(* High-level class for ActionMap *)
class action_map (obj : Raw.Action_map.t) : action_map_t =
  object (self)
    method add_action : Action.action_t -> unit =
      fun action ->
        let action = action#as_action in
        Raw.Action_map.add_action obj action

    method lookup_action : string -> Action.action_t option =
      fun action_name ->
        Option.map
          (fun ret -> new Action.action ret)
          (Raw.Action_map.lookup_action obj action_name)

    method remove_action : string -> unit =
      fun action_name -> Raw.Action_map.remove_action obj action_name

    method remove_action_entries : Raw.Action_entry.t array -> int -> unit =
      fun entries n_entries ->
        Raw.Action_map.remove_action_entries obj entries n_entries

    method as_action_map = obj
  end
