class type action_entry_t = object
  method get_name : string
  method set_name : string -> unit
  method get_parameter_type : string
  method set_parameter_type : string -> unit
  method get_state : string
  method set_state : string -> unit
  method as_action_entry : Action_entry.t
end

(* High-level class for ActionEntry *)
class action_entry (obj : Action_entry.t) : action_entry_t =
  object (self)
    method get_name : string = Action_entry.get_name obj
    method set_name : string -> unit = fun v -> Action_entry.set_name obj v
    method get_parameter_type : string = Action_entry.get_parameter_type obj

    method set_parameter_type : string -> unit =
      fun v -> Action_entry.set_parameter_type obj v

    method get_state : string = Action_entry.get_state obj
    method set_state : string -> unit = fun v -> Action_entry.set_state obj v
    method as_action_entry = obj
  end

let make (name : string) (parameter_type : string) (state : string) :
    action_entry_t =
  new action_entry (Action_entry.make name parameter_type state)
