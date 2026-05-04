class type action_group_t = object
  method on_action_added :
    callback:(action_name:string -> unit) -> Gobject.Signal.handler_id

  method on_action_enabled_changed :
    callback:(action_name:string -> enabled:bool -> unit) ->
    Gobject.Signal.handler_id

  method on_action_removed :
    callback:(action_name:string -> unit) -> Gobject.Signal.handler_id

  method on_action_state_changed :
    callback:(action_name:string -> value:Gvariant.t -> unit) ->
    Gobject.Signal.handler_id

  method action_added : string -> unit
  method action_enabled_changed : string -> bool -> unit
  method action_removed : string -> unit
  method action_state_changed : string -> Gvariant.t -> unit
  method activate_action : string -> Gvariant.t option -> unit
  method change_action_state : string -> Gvariant.t -> unit
  method get_action_enabled : string -> bool
  method get_action_parameter_type : string -> Gvariant_type.t option
  method get_action_state : string -> Gvariant.t option
  method get_action_state_hint : string -> Gvariant.t option
  method get_action_state_type : string -> Gvariant_type.t option
  method has_action : string -> bool
  method list_actions : unit -> string array
  method as_action_group : Action_group.t
end

class action_group : Action_group.t -> action_group_t
