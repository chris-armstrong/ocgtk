class type d_bus_menu_model_t = object
    inherit GMenu_link_iter_and__menu_model.menu_model_t
    method as_d_bus_menu_model : D_bus_menu_model.t
end

class d_bus_menu_model : D_bus_menu_model.t -> d_bus_menu_model_t

