(* GENERATED CODE - DO NOT EDIT *)
(* DBusActionGroup: DBusActionGroup *)

(** [GDBusActionGroup] is an implementation of the
    {{!Ocgio.Raw.Action_group}[Gio.ActionGroup]} interface.

    [GDBusActionGroup] can be used as a proxy for an action group that is
    exported over D-Bus with
    {{!Ocgio.Raw.D_bus_connection.val-export_action_group}[Gio.DBusConnection.export_action_group]}.

    The class built on this module is in {!Ocgio.D_bus_action_group}. *)

type t = [ `d_bus_action_group | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_action_group_get_type"

(* Methods *)
