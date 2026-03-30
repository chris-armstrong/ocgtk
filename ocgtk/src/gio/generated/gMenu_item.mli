class type menu_item_t = object
    method get_attribute_value : string -> Gvariant_type.t option -> Gvariant.t option
    method get_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option
    method set_action_and_target_value : string option -> Gvariant.t option -> unit
    method set_attribute_value : string -> Gvariant.t option -> unit
    method set_detailed_action : string -> unit
    method set_label : string option -> unit
    method set_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method set_section : GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method set_submenu : GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method as_menu_item : Menu_item.t
end

class menu_item : Menu_item.t -> menu_item_t

val new_ : string option -> string option -> menu_item_t
val new_from_model : GMenu_link_iter_and__menu_model.menu_model_t -> int -> menu_item_t
val new_section : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> menu_item_t
val new_submenu : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> menu_item_t
