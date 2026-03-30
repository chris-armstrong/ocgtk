
class type menu_link_iter_t = object
    method get_name : unit -> string
    method get_value : unit -> menu_model_t
    method next : unit -> bool
    method as_menu_link_iter : Menu_link_iter_and__menu_model.Menu_link_iter.t
end

and menu_model_t = object
    inherit Gmenu_model_signals.menu_model_signals
    method get_item_attribute_value : int -> string -> Gvariant_type.t option -> Gvariant.t option
    method get_item_link : int -> string -> menu_model_t option
    method get_n_items : unit -> int
    method is_mutable : unit -> bool
    method items_changed : int -> int -> int -> unit
    method iterate_item_attributes : int -> GMenu_attribute_iter.menu_attribute_iter_t
    method iterate_item_links : int -> menu_link_iter_t
    method as_menu_model : Menu_link_iter_and__menu_model.Menu_model.t
end


class menu_link_iter : Menu_link_iter_and__menu_model.Menu_link_iter.t -> menu_link_iter_t

and menu_model : Menu_link_iter_and__menu_model.Menu_model.t -> menu_model_t
