class type action_t = object
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
