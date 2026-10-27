(** The [GRemoteActionGroup] interface is implemented by [Gio.ActionGroup]
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
    D-Bus.

    Its methods, signals and properties are on
    {!class-type-remote_action_group_t}. The functions it is built on are in
    {!Ocgio.Raw.Remote_action_group}. *)

(** The methods, signals and properties of a [GRemoteActionGroup]. *)
class type remote_action_group_t = object
  method activate_action_full :
    string -> Gvariant.t option -> Gvariant.t -> unit
  [@@ocaml.doc
    "Activates the remote action.\n\n\
     This is the same as g_action_group_activate_action() except that it\n\
     allows for provision of \"platform data\" to be sent along with the\n\
     activation request.  This typically contains details such as the user\n\
     interaction timestamp or startup notification information.\n\n\
     [platform_data] must be non-[NULL] and must have the type\n\
     [G_VARIANT_TYPE_VARDICT].  If it is floating, it will be consumed."]

  method change_action_state_full : string -> Gvariant.t -> Gvariant.t -> unit
  [@@ocaml.doc
    "Changes the state of a remote action.\n\n\
     This is the same as g_action_group_change_action_state() except that\n\
     it allows for provision of \"platform data\" to be sent along with the\n\
     state change request.  This typically contains details such as the\n\
     user interaction timestamp or startup notification information.\n\n\
     [platform_data] must be non-[NULL] and must have the type\n\
     [G_VARIANT_TYPE_VARDICT].  If it is floating, it will be consumed."]

  method as_remote_action_group : Raw.Remote_action_group.t
end

class remote_action_group : Raw.Remote_action_group.t -> remote_action_group_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Remote_action_group.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GRemoteActionGroup], give one already wrapped. *)
