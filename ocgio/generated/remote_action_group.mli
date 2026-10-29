(** The [GRemoteActionGroup] interface is implemented by [Gio.ActionGroup]
    instances that either transmit action invocations to other processes or
    receive action invocations in the local process from other processes.

    Its methods, signals and properties are on
    {!class-type-remote_action_group_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Remote_action_group}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [RemoteActionGroup].}

    Requires:
    - {{!Ocgio.Action_group.class-type-action_group_t}Ocgio.Action_group}

    The [GRemoteActionGroup] interface is implemented by [Gio.ActionGroup]
    instances that either transmit action invocations to other processes or
    receive action invocations in the local process from other processes.

    The interface has [_full] variants of the two methods on [Gio.ActionGroup]
    used to activate actions: [Gio.ActionGroup.activate_action] and
    [Gio.ActionGroup.change_action_state]. These variants allow a ‘platform
    data’ [GLib.Variant] to be specified: a dictionary providing context for the
    action invocation (for example: timestamps, startup notification IDs, etc).

    [Gio.DBusActionGroup] implements [GRemoteActionGroup]. This provides a
    mechanism to send platform data for action invocations over D-Bus.

    Additionally, [Gio.DBusConnection.export_action_group] will check if the
    exported [Gio.ActionGroup] implements [GRemoteActionGroup] and use the
    [_full] variants of the calls if available. This provides a mechanism by
    which to receive platform data for action invocations that arrive by way of
    D-Bus. *)
class type remote_action_group_t = object
  (** {2:methods Methods} *)

  method activate_action_full :
    string -> Gvariant.t option -> Gvariant.t -> unit
  [@@ocaml.doc
    "Activates the remote action.\n\n\
     This is the same as g_action_group_activate_action() except that it\n\
     allows for provision of \"platform data\" to be sent along with the\n\
     activation request.  This typically contains details such as the user\n\
     interaction timestamp or startup notification information.\n\n\
     [platform_data] must be non-[None] and must have the type\n\
     [G_VARIANT_TYPE_VARDICT].  If it is floating, it will be consumed."]

  method change_action_state_full : string -> Gvariant.t -> Gvariant.t -> unit
  [@@ocaml.doc
    "Changes the state of a remote action.\n\n\
     This is the same as g_action_group_change_action_state() except that\n\
     it allows for provision of \"platform data\" to be sent along with the\n\
     state change request.  This typically contains details such as the\n\
     user interaction timestamp or startup notification information.\n\n\
     [platform_data] must be non-[None] and must have the type\n\
     [G_VARIANT_TYPE_VARDICT].  If it is floating, it will be consumed."]

  (** {2:conversions Conversions} *)

  method as_remote_action_group : Raw.Remote_action_group.t
end

class remote_action_group : Raw.Remote_action_group.t -> remote_action_group_t
(** Wraps a raw handle of {!Ocgio.Raw.Remote_action_group.t}. *)

(** {1:description Description}

    The [GRemoteActionGroup] interface is implemented by [Gio.ActionGroup]
    instances that either transmit action invocations to other processes or
    receive action invocations in the local process from other processes.

    The interface has [_full] variants of the two methods on [Gio.ActionGroup]
    used to activate actions: [Gio.ActionGroup.activate_action] and
    [Gio.ActionGroup.change_action_state]. These variants allow a ‘platform
    data’ [GLib.Variant] to be specified: a dictionary providing context for the
    action invocation (for example: timestamps, startup notification IDs, etc).

    [Gio.DBusActionGroup] implements [GRemoteActionGroup]. This provides a
    mechanism to send platform data for action invocations over D-Bus.

    Additionally, [Gio.DBusConnection.export_action_group] will check if the
    exported [Gio.ActionGroup] implements [GRemoteActionGroup] and use the
    [_full] variants of the calls if available. This provides a mechanism by
    which to receive platform data for action invocations that arrive by way of
    D-Bus. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
