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

(* High-level class for ActionGroup *)
class action_group (obj : Action_group.t) : action_group_t =
  object (self)
    method on_action_added ~callback =
      Action_group.on_action_added self#as_action_group ~callback

    method on_action_enabled_changed ~callback =
      Action_group.on_action_enabled_changed self#as_action_group ~callback

    method on_action_removed ~callback =
      Action_group.on_action_removed self#as_action_group ~callback

    method on_action_state_changed ~callback =
      Action_group.on_action_state_changed self#as_action_group ~callback

    method action_added : string -> unit =
      fun action_name -> Action_group.action_added obj action_name

    method action_enabled_changed : string -> bool -> unit =
      fun action_name enabled ->
        Action_group.action_enabled_changed obj action_name enabled

    method action_removed : string -> unit =
      fun action_name -> Action_group.action_removed obj action_name

    method action_state_changed : string -> Gvariant.t -> unit =
      fun action_name state ->
        Action_group.action_state_changed obj action_name state

    method activate_action : string -> Gvariant.t option -> unit =
      fun action_name parameter ->
        Action_group.activate_action obj action_name parameter

    method change_action_state : string -> Gvariant.t -> unit =
      fun action_name value ->
        Action_group.change_action_state obj action_name value

    method get_action_enabled : string -> bool =
      fun action_name -> Action_group.get_action_enabled obj action_name

    method get_action_parameter_type : string -> Gvariant_type.t option =
      fun action_name -> Action_group.get_action_parameter_type obj action_name

    method get_action_state : string -> Gvariant.t option =
      fun action_name -> Action_group.get_action_state obj action_name

    method get_action_state_hint : string -> Gvariant.t option =
      fun action_name -> Action_group.get_action_state_hint obj action_name

    method get_action_state_type : string -> Gvariant_type.t option =
      fun action_name -> Action_group.get_action_state_type obj action_name

    method has_action : string -> bool =
      fun action_name -> Action_group.has_action obj action_name

    method list_actions : unit -> string array =
      fun () -> Action_group.list_actions obj

    method as_action_group = obj
  end
