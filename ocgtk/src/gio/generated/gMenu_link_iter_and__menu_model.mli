
class menu_link_iter : Menu_link_iter_and__menu_model.Menu_link_iter.t ->
  object
    method get_name : unit -> string
    method get_value : unit -> menu_model
    method next : unit -> bool
    method as_menu_link_iter : Menu_link_iter_and__menu_model.Menu_link_iter.t
  end

and menu_model : Menu_link_iter_and__menu_model.Menu_model.t ->
  object
    inherit Gmenu_model_signals.menu_model_signals
    method get_item_link : int -> string -> menu_model option
    method get_n_items : unit -> int
    method is_mutable : unit -> bool
    method items_changed : int -> int -> int -> unit
    method iterate_item_attributes : int -> GMenu_attribute_iter.menu_attribute_iter
    method iterate_item_links : int -> menu_link_iter
    method as_menu_model : Menu_link_iter_and__menu_model.Menu_model.t
  end
