class type menu_item_t = object
    method get_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option
    method set_detailed_action : string -> unit
    method set_label : string option -> unit
    method set_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method set_section : GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method set_submenu : GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method as_menu_item : Menu_item.t
end

class menu_item : Menu_item.t -> menu_item_t

