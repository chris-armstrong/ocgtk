class type d_bus_menu_model_t = object
    method as_d_bus_menu_model : D_bus_menu_model.t
end

(* High-level class for DBusMenuModel *)
class d_bus_menu_model (obj : D_bus_menu_model.t) : d_bus_menu_model_t = object (self)

    method as_d_bus_menu_model = obj
end

