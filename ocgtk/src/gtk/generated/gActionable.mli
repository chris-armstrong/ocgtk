class type actionable_t = object
    method get_action_name : unit -> string option
    method get_action_target_value : unit -> Gvariant.t option
    method set_action_name : string option -> unit
    method set_action_target_value : Gvariant.t option -> unit
    method set_detailed_action_name : string -> unit
    method as_actionable : Actionable.t
end

class actionable : Actionable.t -> actionable_t

