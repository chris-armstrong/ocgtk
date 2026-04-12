(* Signal class defined in gsimple_action_signals.ml *)

class type simple_action_t = object
    inherit GAction.action_t
    inherit Gsimple_action_signals.simple_action_signals
    method set_enabled : bool -> unit
    method name : string
    method as_simple_action : Simple_action.t
end

(* High-level class for SimpleAction *)
class simple_action (obj : Simple_action.t) : simple_action_t = object (self)
  inherit GAction.action (Action.from_gobject obj)
  inherit Gsimple_action_signals.simple_action_signals obj

  method set_enabled : bool -> unit =
    fun enabled ->
      (Simple_action.set_enabled obj enabled)

  method name = Simple_action.get_name obj

    method as_simple_action = obj
end

