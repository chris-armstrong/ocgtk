class type simple_action_t = object
  inherit Action.action_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool ->
    callback:(parameter:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Indicates that the action was just activated.

      [parameter] will always be of the expected type, i.e. the parameter type
      specified when the action was created. If an incorrect type is given when
      activating the action, this signal is not emitted.

      Since GLib 2.40, if no handler is connected to this signal then the
      default behaviour for boolean-stated actions with a [None] parameter type
      is to toggle them via the [GSimpleAction::change]-state signal. For
      stateful actions where the state type is equal to the parameter type, the
      default is to forward them directly to [GSimpleAction::change]-state. This
      should allow almost all users of [GSimpleAction] to connect only one
      handler or the other. *)

  method on_change_state :
    ?after:bool ->
    callback:(value:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Indicates that the action just received a request to change its state.

      [value] will always be of the correct state type, i.e. the type of the
      initial state passed to g_simple_action_new_stateful(). If an incorrect
      type is given when requesting to change the state, this signal is not
      emitted.

      If no handler is connected to this signal then the default behaviour is to
      call g_simple_action_set_state() to set the state to the requested value.
      If you connect a signal handler then no default action is taken. If the
      state should change then you must call g_simple_action_set_state() from
      the handler.

      An example of a 'change-state' handler:

      {[
      static void
      change_volume_state (GSimpleAction *action,
                           GVariant      *value,
                           gpointer       user_data)
      {
        gint requested;

        requested = g_variant_get_int32 (value);

        // Volume only goes from 0 to 10
        if (0 <= requested && requested <= 10)
          g_simple_action_set_state (action, value);
      }
      ]}

      The handler need not set the state to the requested value. It could set it
      to any value at all, or take some other action. *)

  (** {2:methods Methods} *)

  method set_enabled : bool -> unit
  (** Sets the action as enabled or not.

      An action must be enabled in order to be activated or in order to have its
      state changed from outside callers.

      This should only be called by the implementor of the action. Users of the
      action should not attempt to modify its enabled flag. *)

  method set_state : Gvariant.t -> unit
  (** Sets the state of the action.

      This directly updates the 'state' property to the given value.

      This should only be called by the implementor of the action. Users of the
      action should not attempt to directly modify the 'state' property.
      Instead, they should call g_action_change_state() to request the change.

      If the [value] GVariant is floating, it is consumed. *)

  method set_state_hint : Gvariant.t option -> unit
  (** Sets the state hint for the action.

      See g_action_get_state_hint() for more information about action state
      hints. *)

  (** {2:properties Properties} *)

  method name : string
  (** The name of the action. This is mostly meaningful for identifying the
      action once it has been added to a [GSimpleActionGroup]. *)

  method parameter_type : Gvariant_type.t
  (** The type of the parameter that must be given when activating the action.
  *)

  method state_type : Gvariant_type.t
  (** The [GVariantType] of the state that the action has, or [None] if the
      action is stateless. *)

  (** {2:conversions Conversions} *)

  method as_simple_action : Raw.Simple_action.t
end

(* High-level class for SimpleAction *)
class simple_action (obj : Raw.Simple_action.t) : simple_action_t =
  object (self)
    inherit Action.action (Raw.Action.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Simple_action.on_activate ~after self#as_simple_action ~callback

    method on_change_state ?(after = false) ~callback () =
      Raw.Simple_action.on_change_state ~after self#as_simple_action ~callback

    method set_enabled : bool -> unit =
      fun enabled -> Raw.Simple_action.set_enabled obj enabled

    method set_state : Gvariant.t -> unit =
      fun value -> Raw.Simple_action.set_state obj value

    method set_state_hint : Gvariant.t option -> unit =
      fun state_hint -> Raw.Simple_action.set_state_hint obj state_hint

    method name = Raw.Simple_action.get_name obj
    method parameter_type = Raw.Simple_action.get_parameter_type obj
    method state_type = Raw.Simple_action.get_state_type obj
    method as_simple_action = obj
  end

let new_ (name : string) (parameter_type : Gvariant_type.t option) :
    simple_action_t =
  let obj_ = Raw.Simple_action.new_ name parameter_type in
  new simple_action obj_

let new_stateful (name : string) (parameter_type : Gvariant_type.t option)
    (state : Gvariant.t) : simple_action_t =
  let obj_ = Raw.Simple_action.new_stateful name parameter_type state in
  new simple_action obj_
