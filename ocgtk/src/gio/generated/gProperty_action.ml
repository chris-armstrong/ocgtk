class type property_action_t = object
    method enabled : bool
    method invert_boolean : bool
    method name : string
    method object_ : [`object_] Gobject.obj
    method property_name : string
    method as_property_action : Property_action.t
end

(* High-level class for PropertyAction *)
class property_action (obj : Property_action.t) : property_action_t = object (self)

  method enabled = Property_action.get_enabled obj

  method invert_boolean = Property_action.get_invert_boolean obj

  method name = Property_action.get_name obj

  method object_ = Property_action.get_object obj

  method property_name = Property_action.get_property_name obj

    method as_property_action = obj
end

let new_ (name : string) (object_ : [`object_] Gobject.obj) (property_name : string) : property_action_t =
  new property_action (Property_action.new_ name object_ property_name)

