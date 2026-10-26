(* GENERATED CODE - DO NOT EDIT *)
(* DBusSignalInfo: DBusSignalInfo *)

(** Information about a signal on a D-Bus interface. *)

type t = [ `d_bus_signal_info ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_signal_info_get_type"

(* Methods *)

external ref : t -> t = "ml_g_dbus_signal_info_ref"
(** If [info] is statically allocated does nothing. Otherwise increases the
    reference count. *)
