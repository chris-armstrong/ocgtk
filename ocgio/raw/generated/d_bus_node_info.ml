(* GENERATED CODE - DO NOT EDIT *)
(* DBusNodeInfo: DBusNodeInfo *)

(** Information about nodes in a remote object hierarchy.

    The class built on this module is in {!Ocgio.D_bus_node_info}. *)

type t = [ `d_bus_node_info ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_node_info_get_type"

external new_for_xml : string -> (t, GError.t) result
  = "ml_g_dbus_node_info_new_for_xml"
(** Parses [xml_data] and returns a
    {{!Ocgio.Raw.D_bus_node_info}[GDBusNodeInfo]} representing the data.

    The introspection XML must contain exactly one top-level [<node>] element.

    Note that this routine is using a GMarkup-based parser that only accepts a
    subset of valid XML documents. *)

(* Methods *)

external ref : t -> t = "ml_g_dbus_node_info_ref"
(** If [info] is statically allocated does nothing. Otherwise increases the
    reference count. *)

external lookup_interface : t -> string -> D_bus_interface_info.t option
  = "ml_g_dbus_node_info_lookup_interface"
(** Looks up information about an interface.

    The cost of this function is O(n) in number of interfaces. *)
