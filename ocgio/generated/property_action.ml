class type property_action_t = object
  inherit Action.action_t

  method enabled : bool
  (** If [action] is currently enabled.

      If the action is disabled then calls to g_action_activate() and
      g_action_change_state() have no effect. *)

  method invert_boolean : bool
  (** If [TRUE], the state of the action will be the negation of the property
      value, provided the property is boolean. *)

  method name : string
  (** The name of the action. This is mostly meaningful for identifying the
      action once it has been added to a [GActionMap]. *)

  method parameter_type : Gvariant_type.t
  (** The type of the parameter that must be given when activating the action.
  *)

  method state : Gvariant.t
  (** The state of the action, or [NULL] if the action is stateless. *)

  method state_type : Gvariant_type.t
  (** The [GVariantType] of the state that the action has, or [NULL] if the
      action is stateless. *)

  method as_property_action : Raw.Property_action.t
end

(* High-level class for PropertyAction *)
class property_action (obj : Raw.Property_action.t) : property_action_t =
  object (self)
    inherit Action.action (Raw.Action.from_gobject obj)
    method enabled = Raw.Property_action.get_enabled obj
    method invert_boolean = Raw.Property_action.get_invert_boolean obj
    method name = Raw.Property_action.get_name obj
    method parameter_type = Raw.Property_action.get_parameter_type obj
    method state = Raw.Property_action.get_state obj
    method state_type = Raw.Property_action.get_state_type obj
    method as_property_action = obj
  end

let new_ (name : string) (object_ : [ `object_ ] Gobject.obj)
    (property_name : string) : property_action_t =
  let obj_ = Raw.Property_action.new_ name object_ property_name in
  new property_action obj_
