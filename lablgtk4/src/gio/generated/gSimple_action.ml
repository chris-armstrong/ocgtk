(* Signal class defined in gsimple_action_signals.ml *)

(* High-level class for SimpleAction *)
class simple_action (obj : Simple_action.t) = object (self)
  inherit Gsimple_action_signals.simple_action_signals obj

  method set_enabled : bool -> unit =
    fun enabled ->
      (Simple_action.set_enabled obj enabled)

  method name = Simple_action.get_name obj

    method as_simple_action = obj
end

