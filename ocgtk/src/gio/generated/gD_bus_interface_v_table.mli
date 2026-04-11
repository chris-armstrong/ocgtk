class type d_bus_interface_v_table_t = object
  method as_d_bus_interface_v_table : D_bus_interface_v_table.t
end

class d_bus_interface_v_table :
  D_bus_interface_v_table.t ->
  d_bus_interface_v_table_t
