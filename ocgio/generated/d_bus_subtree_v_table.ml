class type d_bus_subtree_v_table_t = object
  method as_d_bus_subtree_v_table : D_bus_subtree_v_table.t
end

(* High-level class for DBusSubtreeVTable *)
class d_bus_subtree_v_table (obj : D_bus_subtree_v_table.t) :
  d_bus_subtree_v_table_t =
  object (self)
    method as_d_bus_subtree_v_table = obj
  end
