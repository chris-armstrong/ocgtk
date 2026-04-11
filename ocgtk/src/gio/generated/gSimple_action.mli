class type simple_action_t = object
  inherit GAction.action_t
  inherit Gsimple_action_signals.simple_action_signals
  method set_enabled : bool -> unit
  method set_state : Gvariant.t -> unit
  method set_state_hint : Gvariant.t option -> unit
  method name : string
  method parameter_type : Gvariant_type.t
  method state_type : Gvariant_type.t
  method as_simple_action : Simple_action.t
end

class simple_action : Simple_action.t -> simple_action_t

val new_ : string -> Gvariant_type.t option -> simple_action_t

val new_stateful :
  string -> Gvariant_type.t option -> Gvariant.t -> simple_action_t
