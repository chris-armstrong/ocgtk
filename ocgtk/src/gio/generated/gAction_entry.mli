class type action_entry_t = object
  method get_name : string
  method set_name : string -> unit
  method get_parameter_type : string
  method set_parameter_type : string -> unit
  method get_state : string
  method set_state : string -> unit
  method as_action_entry : Action_entry.t
end

class action_entry : Action_entry.t -> action_entry_t

val make : string -> string -> string -> action_entry_t
