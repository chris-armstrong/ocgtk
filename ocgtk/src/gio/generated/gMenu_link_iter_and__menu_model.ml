(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
class menu_link_iter (obj : Menu_link_iter_and__menu_model.Menu_link_iter.t) = object (self)

  method get_name : unit -> string =
    fun () ->
      (Menu_link_iter_and__menu_model.Menu_link_iter.get_name obj)

  method get_value : unit -> menu_model =
    fun () ->
      new  menu_model(Menu_link_iter_and__menu_model.Menu_link_iter.get_value obj)

  method next : unit -> bool =
    fun () ->
      (Menu_link_iter_and__menu_model.Menu_link_iter.next obj)

    method as_menu_link_iter = obj
end
(* Signal class defined in gmenu_model_signals.ml *)


and menu_model (obj : Menu_link_iter_and__menu_model.Menu_model.t) = object (self)
  inherit Gmenu_model_signals.menu_model_signals obj

  method get_item_link : int -> string -> menu_model option =
    fun item_index link ->
      Option.map (fun ret -> new menu_model ret) (Menu_link_iter_and__menu_model.Menu_model.get_item_link obj item_index link)

  method get_n_items : unit -> int =
    fun () ->
      (Menu_link_iter_and__menu_model.Menu_model.get_n_items obj)

  method is_mutable : unit -> bool =
    fun () ->
      (Menu_link_iter_and__menu_model.Menu_model.is_mutable obj)

  method items_changed : int -> int -> int -> unit =
    fun position removed added ->
      (Menu_link_iter_and__menu_model.Menu_model.items_changed obj position removed added)

  method iterate_item_attributes : int -> GMenu_attribute_iter.menu_attribute_iter =
    fun item_index ->
      new  GMenu_attribute_iter.menu_attribute_iter(Menu_link_iter_and__menu_model.Menu_model.iterate_item_attributes obj item_index)

  method iterate_item_links : int -> menu_link_iter =
    fun item_index ->
      new  menu_link_iter(Menu_link_iter_and__menu_model.Menu_model.iterate_item_links obj item_index)

    method as_menu_model = obj
end
