class type action_t = object
  method activate : Gvariant.t option -> unit
  method change_state : Gvariant.t -> unit
  method get_enabled : unit -> bool
  method get_name : unit -> string
  method get_parameter_type : unit -> Gvariant_type.t option
  method get_state : unit -> Gvariant.t option
  method get_state_hint : unit -> Gvariant.t option
  method get_state_type : unit -> Gvariant_type.t option
  method as_action : Raw.Action.t
end

(* High-level class for Action *)
class action (obj : Raw.Action.t) : action_t =
  object (self)
    method activate : Gvariant.t option -> unit =
      fun parameter -> Raw.Action.activate obj parameter

    method change_state : Gvariant.t -> unit =
      fun value -> Raw.Action.change_state obj value

    method get_enabled : unit -> bool = fun () -> Raw.Action.get_enabled obj
    method get_name : unit -> string = fun () -> Raw.Action.get_name obj

    method get_parameter_type : unit -> Gvariant_type.t option =
      fun () -> Raw.Action.get_parameter_type obj

    method get_state : unit -> Gvariant.t option =
      fun () -> Raw.Action.get_state obj

    method get_state_hint : unit -> Gvariant.t option =
      fun () -> Raw.Action.get_state_hint obj

    method get_state_type : unit -> Gvariant_type.t option =
      fun () -> Raw.Action.get_state_type obj

    method as_action = obj
  end
