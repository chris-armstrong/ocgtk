class property_action : Property_action.t ->
  object
    method enabled : bool
    method invert_boolean : bool
    method name : string
    method property_name : string
    method as_property_action : Property_action.t
  end

