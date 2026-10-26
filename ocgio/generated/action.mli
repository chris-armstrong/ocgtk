class type action_t = object
  method activate : Gvariant.t option -> unit
  method change_state : Gvariant.t -> unit
  method get_enabled : unit -> bool
  method get_name : unit -> string
  method get_parameter_type : unit -> Gvariant_type.t option
  method get_state : unit -> Gvariant.t option
  method get_state_hint : unit -> Gvariant.t option
  method get_state_type : unit -> Gvariant_type.t option
  method as_action : Action.t
end

class action : Action.t -> action_t
