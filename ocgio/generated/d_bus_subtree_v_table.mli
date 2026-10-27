(** Virtual table for handling subtrees registered with
    g_dbus_connection_register_subtree().

    Its methods, signals and properties are on
    {!class-type-d_bus_subtree_v_table_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_subtree_v_table}. *)

(** The methods, signals and properties of a [GDBusSubtreeVTable]. *)
class type d_bus_subtree_v_table_t = object
  method as_d_bus_subtree_v_table : Raw.D_bus_subtree_v_table.t
end

class d_bus_subtree_v_table :
  Raw.D_bus_subtree_v_table.t ->
  d_bus_subtree_v_table_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_subtree_v_table.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDBusSubtreeVTable], give one already wrapped. *)
