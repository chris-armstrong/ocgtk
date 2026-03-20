class type property_action_t = object
    method enabled : bool
    method invert_boolean : bool
    method name : string
    method property_name : string
    method as_property_action : Property_action.t
end

(* High-level class for PropertyAction *)
class property_action (obj : Property_action.t) : property_action_t = object (self)

  method enabled = Property_action.get_enabled obj

  method invert_boolean = Property_action.get_invert_boolean obj

  method name = Property_action.get_name obj

  method property_name = Property_action.get_property_name obj

    method as_property_action = obj
end

