class type menu_t = object
  inherit Menu_link_iter_and__menu_model.menu_model_t
  method append : string option -> string option -> unit
  method append_item : Menu_item.menu_item_t -> unit

  method append_section :
    string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit

  method append_submenu :
    string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit

  method freeze : unit -> unit
  method insert : int -> string option -> string option -> unit
  method insert_item : int -> Menu_item.menu_item_t -> unit

  method insert_section :
    int -> string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit

  method insert_submenu :
    int -> string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit

  method prepend : string option -> string option -> unit
  method prepend_item : Menu_item.menu_item_t -> unit

  method prepend_section :
    string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit

  method prepend_submenu :
    string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit

  method remove : int -> unit
  method remove_all : unit -> unit
  method as_menu : Raw.Menu.t
end

class menu : Raw.Menu.t -> menu_t

val new_ : unit -> menu_t
