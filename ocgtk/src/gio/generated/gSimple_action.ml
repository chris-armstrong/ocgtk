(* Signal class defined in gsimple_action_signals.ml *)

class type simple_action_t = object
    inherit Gsimple_action_signals.simple_action_signals
    method set_enabled : bool -> unit
    method set_state : Gvariant.t -> unit
    method set_state_hint : Gvariant.t option -> unit
    method name : string
    method parameter_type : Gvariant_type.t
    method state_type : Gvariant_type.t
    method as_simple_action : Simple_action.t
end

(* High-level class for SimpleAction *)
class simple_action (obj : Simple_action.t) : simple_action_t = object (self)
  inherit Gsimple_action_signals.simple_action_signals obj

  method set_enabled : bool -> unit =
    fun enabled ->
      (Simple_action.set_enabled obj enabled)

  method set_state : Gvariant.t -> unit =
    fun value ->
      (Simple_action.set_state obj value)

  method set_state_hint : Gvariant.t option -> unit =
    fun state_hint ->
      (Simple_action.set_state_hint obj state_hint)

  method name = Simple_action.get_name obj

  method parameter_type = Simple_action.get_parameter_type obj

  method state_type = Simple_action.get_state_type obj

    method as_simple_action = obj
end

let new_ (name : string) (parameter_type : Gvariant_type.t option) : simple_action_t =
  let obj_ = Simple_action.new_ name parameter_type in
  new simple_action obj_

let new_stateful (name : string) (parameter_type : Gvariant_type.t option) (state : Gvariant.t) : simple_action_t =
  let obj_ = Simple_action.new_stateful name parameter_type state in
  new simple_action obj_

