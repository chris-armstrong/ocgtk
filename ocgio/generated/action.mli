(** [GAction] represents a single named action.

    Its methods, signals and properties are on {!class-type-action_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Action}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Action].}

    [GAction] represents a single named action.

    The main interface to an action is that it can be activated with
    [Gio.Action.activate]. This results in the 'activate' signal being emitted.
    An activation has a [GVariant] parameter (which may be [NULL]). The correct
    type for the parameter is determined by a static parameter type (which is
    given at construction time).

    An action may optionally have a state, in which case the state may be set
    with [Gio.Action.change_state]. This call takes a [GLib.Variant]. The
    correct type for the state is determined by a static state type (which is
    given at construction time).

    The state may have a hint associated with it, specifying its valid range.

    [GAction] is merely the interface to the concept of an action, as described
    above. Various implementations of actions exist, including
    [Gio.SimpleAction].

    In all cases, the implementing class is responsible for storing the name of
    the action, the parameter type, the enabled state, the optional state type
    and the state and emitting the appropriate signals when these change. The
    implementor is responsible for filtering calls to [Gio.Action.activate] and
    [Gio.Action.change_state] for type safety and for the state being enabled.

    Probably the only useful thing to do with a [GAction] is to put it inside of
    a [Gio.SimpleActionGroup]. *)
class type action_t = object
  (** {2:methods Methods} *)

  method activate : Gvariant.t option -> unit
  (** Activates the action.

      [parameter] must be the correct type of parameter for the action (ie: the
      parameter type given at construction time). If the parameter type was
      [NULL] then [parameter] must also be [NULL].

      If the [parameter] [GLib.Variant] is floating, it is consumed. *)

  method change_state : Gvariant.t -> unit
  (** Request for the state of [action] to be changed to [value].

      The action must be stateful and [value] must be of the correct type. See
      [Gio.Action.get_state_type].

      This call merely requests a change. The action may refuse to change its
      state or may change its state to something other than [value]. See
      [Gio.Action.get_state_hint].

      If the [value] [GLib.Variant] is floating, it is consumed. *)

  method get_enabled : unit -> bool
  (** Checks if [action] is currently enabled.

      An action must be enabled in order to be activated or in order to have its
      state changed from outside callers. *)

  method get_name : unit -> string
  (** Queries the name of [action]. *)

  method get_parameter_type : unit -> Gvariant_type.t option
  (** Queries the type of the parameter that must be given when activating
      [action].

      When activating the action using [Gio.Action.activate], the [GLib.Variant]
      given to that function must be of the type returned by this function.

      In the case that this function returns [NULL], you must not give any
      [GLib.Variant], but [NULL] instead. *)

  method get_state : unit -> Gvariant.t option
  (** Queries the current state of [action].

      If the action is not stateful then [NULL] will be returned. If the action
      is stateful then the type of the return value is the type given by
      [Gio.Action.get_state_type].

      The return value (if non-[NULL]) should be freed with [GLib.Variant.unref]
      when it is no longer required. *)

  method get_state_hint : unit -> Gvariant.t option
  (** Requests a hint about the valid range of values for the state of [action].

      If [NULL] is returned it either means that the action is not stateful or
      that there is no hint about the valid range of values for the state of the
      action.

      If a [GLib.Variant] array is returned then each item in the array is a
      possible value for the state. If a [GLib.Variant] pair (ie: two-tuple) is
      returned then the tuple specifies the inclusive lower and upper bound of
      valid values for the state.

      In any case, the information is merely a hint. It may be possible to have
      a state value outside of the hinted range and setting a value within the
      range may fail.

      The return value (if non-[NULL]) should be freed with [GLib.Variant.unref]
      when it is no longer required. *)

  method get_state_type : unit -> Gvariant_type.t option
  (** Queries the type of the state of [action].

      If the action is stateful (e.g. created with
      [Gio.SimpleAction.new_stateful]) then this function returns the
      [GLib.VariantType] of the state. This is the type of the initial value
      given as the state. All calls to [Gio.Action.change_state] must give a
      [GLib.Variant] of this type and [Gio.Action.get_state] will return a
      [GLib.Variant] of the same type.

      If the action is not stateful (e.g. created with [Gio.SimpleAction.new])
      then this function will return [NULL]. In that case,
      [Gio.Action.get_state] will return [NULL] and you must not call
      [Gio.Action.change_state]. *)

  (** {2:conversions Conversions} *)

  method as_action : Raw.Action.t
end

class action : Raw.Action.t -> action_t
(** Wraps a raw handle of {!Ocgio.Raw.Action.t}. *)

(** {1:description Description}

    [GAction] represents a single named action.

    The main interface to an action is that it can be activated with
    [Gio.Action.activate]. This results in the 'activate' signal being emitted.
    An activation has a [GVariant] parameter (which may be [NULL]). The correct
    type for the parameter is determined by a static parameter type (which is
    given at construction time).

    An action may optionally have a state, in which case the state may be set
    with [Gio.Action.change_state]. This call takes a [GLib.Variant]. The
    correct type for the state is determined by a static state type (which is
    given at construction time).

    The state may have a hint associated with it, specifying its valid range.

    [GAction] is merely the interface to the concept of an action, as described
    above. Various implementations of actions exist, including
    [Gio.SimpleAction].

    In all cases, the implementing class is responsible for storing the name of
    the action, the parameter type, the enabled state, the optional state type
    and the state and emitting the appropriate signals when these change. The
    implementor is responsible for filtering calls to [Gio.Action.activate] and
    [Gio.Action.change_state] for type safety and for the state being enabled.

    Probably the only useful thing to do with a [GAction] is to put it inside of
    a [Gio.SimpleActionGroup]. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
