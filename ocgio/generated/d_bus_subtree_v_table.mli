(** Virtual table for handling subtrees registered with
    g_dbus_connection_register_subtree().

    Its methods, signals and properties are on
    {!class-type-d_bus_subtree_v_table_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_subtree_v_table}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusSubtreeVTable].}

    Virtual table for handling subtrees registered with
    g_dbus_connection_register_subtree(). *)
class type d_bus_subtree_v_table_t = object
  (** {2:conversions Conversions} *)

  method as_d_bus_subtree_v_table : Raw.D_bus_subtree_v_table.t
end

class d_bus_subtree_v_table :
  Raw.D_bus_subtree_v_table.t ->
  d_bus_subtree_v_table_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_subtree_v_table.t}. *)
