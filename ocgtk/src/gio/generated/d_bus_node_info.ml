(* GENERATED CODE - DO NOT EDIT *)
(* DBusNodeInfo: DBusNodeInfo *)

type t = [ `d_bus_node_info ] Gobject.obj
(** Information about nodes in a remote object hierarchy. *)

external new_for_xml : string -> (t, GError.t) result
  = "ml_g_dbus_node_info_new_for_xml"
(** Create a new DBusNodeInfo *)

(* Methods *)

external ref : t -> t = "ml_g_dbus_node_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)

external lookup_interface : t -> string -> D_bus_interface_info.t option
  = "ml_g_dbus_node_info_lookup_interface"
(** Looks up information about an interface.

    The cost of this function is O(n) in number of interfaces. *)

(* Record field accessors *)

(* Getters *)
external get_ref_count : t -> int = "ml_g_d_bus_node_info_get_ref_count"
external get_path : t -> string = "ml_g_d_bus_node_info_get_path"

(* Setters *)
external set_ref_count : t -> int -> unit = "ml_g_d_bus_node_info_set_ref_count"
external set_path : t -> string -> unit = "ml_g_d_bus_node_info_set_path"
external make : int -> string -> t = "ml_g_d_bus_node_info_make"
external get_type : unit -> Gobject.Type.t = "ml_gio_d_bus_node_info_get_type"
