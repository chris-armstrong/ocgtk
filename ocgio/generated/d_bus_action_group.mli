(** [GDBusActionGroup] is an implementation of the [Gio.ActionGroup] interface.

    Its methods, signals and properties are on
    {!class-type-d_bus_action_group_t}. Its full description is under
    {!section-description}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_action_group}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusActionGroup].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.Action_group.class-type-action_group_t}Ocgio.Action_group}
    - {{!Ocgio.Remote_action_group.class-type-remote_action_group_t}Ocgio.Remote_action_group}

    [GDBusActionGroup] is an implementation of the [Gio.ActionGroup] interface.

    [GDBusActionGroup] can be used as a proxy for an action group that is
    exported over D-Bus with [Gio.DBusConnection.export_action_group]. *)
class type d_bus_action_group_t = object
  inherit Action_group.action_group_t
  inherit Remote_action_group.remote_action_group_t

  (** {2:conversions Conversions} *)

  method as_d_bus_action_group : Raw.D_bus_action_group.t
end

class d_bus_action_group : Raw.D_bus_action_group.t -> d_bus_action_group_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_action_group.t}. *)

(** {1:description Description}

    [GDBusActionGroup] is an implementation of the [Gio.ActionGroup] interface.

    [GDBusActionGroup] can be used as a proxy for an action group that is
    exported over D-Bus with [Gio.DBusConnection.export_action_group]. *)
