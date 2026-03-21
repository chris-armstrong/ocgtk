class type menu_t = object
    method append : string option -> string option -> unit
    method append_item : GMenu_item.menu_item_t -> unit
    method append_section : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit
    method append_submenu : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit
    method freeze : unit -> unit
    method insert : int -> string option -> string option -> unit
    method insert_item : int -> GMenu_item.menu_item_t -> unit
    method insert_section : int -> string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit
    method insert_submenu : int -> string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit
    method prepend : string option -> string option -> unit
    method prepend_item : GMenu_item.menu_item_t -> unit
    method prepend_section : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit
    method prepend_submenu : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit
    method remove : int -> unit
    method remove_all : unit -> unit
    method as_menu : Menu.t
end

class menu : Menu.t -> menu_t

