class type action_group_t = object
  method on_action_added :
    ?after:bool ->
    callback:(action_name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Signals that a new action was just added to the group.

      This signal is emitted after the action has been added and is now visible.
  *)

  method on_action_enabled_changed :
    ?after:bool ->
    callback:(action_name:string -> enabled:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Signals that the enabled status of the named action has changed. *)

  method on_action_removed :
    ?after:bool ->
    callback:(action_name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Signals that an action is just about to be removed from the group.

      This signal is emitted before the action is removed, so the action is
      still visible and can be queried from the signal handler. *)

  method on_action_state_changed :
    ?after:bool ->
    callback:(action_name:string -> value:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Signals that the state of the named action has changed. *)

  method action_added : string -> unit
  (** Emits the [Gio.ActionGroup::action-added] signal on [action_group].

      This function should only be called by [Gio.ActionGroup] implementations.
  *)

  method action_enabled_changed : string -> bool -> unit
  (** Emits the [Gio.ActionGroup::action-enabled-changed] signal on
      [action_group].

      This function should only be called by [Gio.ActionGroup] implementations.
  *)

  method action_removed : string -> unit
  (** Emits the [Gio.ActionGroup::action-removed] signal on [action_group].

      This function should only be called by [Gio.ActionGroup] implementations.
  *)

  method action_state_changed : string -> Gvariant.t -> unit
  (** Emits the [Gio.ActionGroup::action-state-changed] signal on
      [action_group].

      This function should only be called by [Gio.ActionGroup] implementations.
  *)

  method activate_action : string -> Gvariant.t option -> unit
  [@@ocaml.doc
    "Activate the named action within [action_group].\n\n\
     If the action is expecting a parameter, then the correct type of\n\
     parameter must be given as [parameter].  If the action is expecting no\n\
     parameters then [parameter] must be [NULL].  See\n\
     [Gio.ActionGroup.get_action_parameter_type].\n\n\
     If the [Gio.ActionGroup] implementation supports asynchronous remote\n\
     activation over D-Bus, this call may return before the relevant\n\
     D-Bus traffic has been sent, or any replies have been received. In\n\
     order to block on such asynchronous activation calls,\n\
     [Gio.DBusConnection.flush] should be called prior to the code, which\n\
     depends on the result of the action activation. Without flushing\n\
     the D-Bus connection, there is no guarantee that the action would\n\
     have been activated.\n\n\
     The following code which runs in a remote app instance, shows an\n\
     example of a ‘quit’ action being activated on the primary app\n\
     instance over D-Bus. Here [Gio.DBusConnection.flush] is called\n\
     before [exit()]. Without [g_dbus_connection_flush()], the ‘quit’ action\n\
     may fail to be activated on the primary instance.\n\n\
     {[\n\
     // call ‘quit’ action on primary instance\n\
     g_action_group_activate_action (G_ACTION_GROUP (app), \"quit\", NULL);\n\n\
     // make sure the action is activated now\n\
     g_dbus_connection_flush (…);\n\n\
     g_debug (\"Application has been terminated. Exiting.\");\n\n\
     exit (0);\n\
     ]}"]

  method change_action_state : string -> Gvariant.t -> unit
  (** Request for the state of the named action within [action_group] to be
      changed to [value].

      The action must be stateful and [value] must be of the correct type. See
      [Gio.ActionGroup.get_action_state_type].

      This call merely requests a change. The action may refuse to change its
      state or may change its state to something other than [value]. See
      [Gio.ActionGroup.get_action_state_hint].

      If the [value] GVariant is floating, it is consumed. *)

  method get_action_enabled : string -> bool
  (** Checks if the named action within [action_group] is currently enabled.

      An action must be enabled in order to be activated or in order to have its
      state changed from outside callers. *)

  method get_action_parameter_type : string -> Gvariant_type.t option
  (** Queries the type of the parameter that must be given when activating the
      named action within [action_group].

      When activating the action using [Gio.ActionGroup.activate_action], the
      [GLib.Variant] given to that function must be of the type returned by this
      function.

      In the case that this function returns [NULL], you must not give any
      [GLib.Variant], but [NULL] instead.

      The parameter type of a particular action will never change but it is
      possible for an action to be removed and for a new action to be added with
      the same name but a different parameter type. *)

  method get_action_state : string -> Gvariant.t option
  (** Queries the current state of the named action within [action_group].

      If the action is not stateful then [NULL] will be returned. If the action
      is stateful then the type of the return value is the type given by
      [Gio.ActionGroup.get_action_state_type].

      The return value (if non-[NULL]) should be freed with [GLib.Variant.unref]
      when it is no longer required. *)

  method get_action_state_hint : string -> Gvariant.t option
  (** Requests a hint about the valid range of values for the state of the named
      action within [action_group].

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

  method get_action_state_type : string -> Gvariant_type.t option
  (** Queries the type of the state of the named action within [action_group].

      If the action is stateful then this function returns the
      [GLib.VariantType] of the state. All calls to
      [Gio.ActionGroup.change_action_state] must give a [GLib.Variant] of this
      type and [Gio.ActionGroup.get_action_state] will return a [GLib.Variant]
      of the same type.

      If the action is not stateful then this function will return [NULL]. In
      that case, [Gio.ActionGroup.get_action_state] will return [NULL] and you
      must not call [Gio.ActionGroup.change_action_state].

      The state type of a particular action will never change but it is possible
      for an action to be removed and for a new action to be added with the same
      name but a different state type. *)

  method has_action : string -> bool
  (** Checks if the named action exists within [action_group]. *)

  method list_actions : unit -> string array
  (** Lists the actions contained within [action_group].

      The caller is responsible for freeing the list with [GLib.strfreev] when
      it is no longer required. *)

  method as_action_group : Raw.Action_group.t
end

(* High-level class for ActionGroup *)
class action_group (obj : Raw.Action_group.t) : action_group_t =
  object (self)
    method on_action_added ?(after = false) ~callback () =
      Raw.Action_group.on_action_added ~after self#as_action_group ~callback

    method on_action_enabled_changed ?(after = false) ~callback () =
      Raw.Action_group.on_action_enabled_changed ~after self#as_action_group
        ~callback

    method on_action_removed ?(after = false) ~callback () =
      Raw.Action_group.on_action_removed ~after self#as_action_group ~callback

    method on_action_state_changed ?(after = false) ~callback () =
      Raw.Action_group.on_action_state_changed ~after self#as_action_group
        ~callback

    method action_added : string -> unit =
      fun action_name -> Raw.Action_group.action_added obj action_name

    method action_enabled_changed : string -> bool -> unit =
      fun action_name enabled ->
        Raw.Action_group.action_enabled_changed obj action_name enabled

    method action_removed : string -> unit =
      fun action_name -> Raw.Action_group.action_removed obj action_name

    method action_state_changed : string -> Gvariant.t -> unit =
      fun action_name state ->
        Raw.Action_group.action_state_changed obj action_name state

    method activate_action : string -> Gvariant.t option -> unit =
      fun action_name parameter ->
        Raw.Action_group.activate_action obj action_name parameter

    method change_action_state : string -> Gvariant.t -> unit =
      fun action_name value ->
        Raw.Action_group.change_action_state obj action_name value

    method get_action_enabled : string -> bool =
      fun action_name -> Raw.Action_group.get_action_enabled obj action_name

    method get_action_parameter_type : string -> Gvariant_type.t option =
      fun action_name ->
        Raw.Action_group.get_action_parameter_type obj action_name

    method get_action_state : string -> Gvariant.t option =
      fun action_name -> Raw.Action_group.get_action_state obj action_name

    method get_action_state_hint : string -> Gvariant.t option =
      fun action_name -> Raw.Action_group.get_action_state_hint obj action_name

    method get_action_state_type : string -> Gvariant_type.t option =
      fun action_name -> Raw.Action_group.get_action_state_type obj action_name

    method has_action : string -> bool =
      fun action_name -> Raw.Action_group.has_action obj action_name

    method list_actions : unit -> string array =
      fun () -> Raw.Action_group.list_actions obj

    method as_action_group = obj
  end
