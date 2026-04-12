class type property_action_t = object
    inherit GAction.action_t
    method enabled : bool
    method invert_boolean : bool
    method name : string
    method as_property_action : Property_action.t
end

class property_action : Property_action.t -> property_action_t

val new_ : string -> [`object_] Gobject.obj -> string -> property_action_t
