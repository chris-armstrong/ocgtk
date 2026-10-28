(** A [GSimpleAction] is the obvious simple implementation of the [Gio.Action]
    interface. This is the easiest way to create an action for purposes of
    adding it to a [Gio.SimpleActionGroup].

    Its methods, signals and properties are on {!class-type-simple_action_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.Simple_action}. *)

(** The methods, signals and properties of a [SimpleAction]. *)
class type simple_action_t = object
  inherit Action.action_t

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
      default behaviour for boolean-stated actions with a [NULL] parameter type
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

  method name : string
  method parameter_type : Gvariant_type.t
  method state_type : Gvariant_type.t
  method as_simple_action : Raw.Simple_action.t
end

class simple_action : Raw.Simple_action.t -> simple_action_t
(** Wraps a raw handle of {!Ocgio.Raw.Simple_action.t}. *)

(** {2:constructors Constructors} *)

val new_ : string -> Gvariant_type.t option -> simple_action_t
(** Creates a new action.

    The created action is stateless. See g_simple_action_new_stateful() to
    create an action that has state. *)

val new_stateful :
  string -> Gvariant_type.t option -> Gvariant.t -> simple_action_t
(** Creates a new stateful action.

    All future state values must have the same [GVariantType] as the initial
    [state].

    If the [state] [GVariant] is floating, it is consumed. *)
