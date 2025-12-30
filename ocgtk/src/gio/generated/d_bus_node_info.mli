(* GENERATED CODE - DO NOT EDIT *)
(* DBusNodeInfo: DBusNodeInfo *)

(** Information about nodes in a remote object hierarchy. *)
type t = [`d_bus_node_info] Gobject.obj

(* Methods *)
(** If @info is statically allocated, does nothing. Otherwise decreases
the reference count of @info. When its reference count drops to 0,
the memory used is freed. *)
external unref : t -> unit = "ml_g_dbus_node_info_unref"

(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)
external ref : t -> t = "ml_g_dbus_node_info_ref"

(** Looks up information about an interface.

The cost of this function is O(n) in number of interfaces. *)
external lookup_interface : t -> string -> D_bus_interface_info.t option = "ml_g_dbus_node_info_lookup_interface"

