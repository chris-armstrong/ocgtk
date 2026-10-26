class type property_action_t = object
  inherit GAction.action_t
  method enabled : bool
  method invert_boolean : bool
  method name : string
  method parameter_type : Gvariant_type.t
  method state : Gvariant.t
  method state_type : Gvariant_type.t
  method as_property_action : Property_action.t
end

(* High-level class for PropertyAction *)
class property_action (obj : Property_action.t) : property_action_t =
  object (self)
    inherit GAction.action (Action.from_gobject obj)
    method enabled = Property_action.get_enabled obj
    method invert_boolean = Property_action.get_invert_boolean obj
    method name = Property_action.get_name obj
    method parameter_type = Property_action.get_parameter_type obj
    method state = Property_action.get_state obj
    method state_type = Property_action.get_state_type obj
    method as_property_action = obj
  end

let new_ (name : string) (object_ : [ `object_ ] Gobject.obj)
    (property_name : string) : property_action_t =
  let obj_ = Property_action.new_ name object_ property_name in
  new property_action obj_
