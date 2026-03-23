class type menu_item_t = object
    method get_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option
    method set_detailed_action : string -> unit
    method set_label : string option -> unit
    method set_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method set_section : GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method set_submenu : GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method as_menu_item : Menu_item.t
end

(* High-level class for MenuItem *)
class menu_item (obj : Menu_item.t) : menu_item_t = object (self)

  method get_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option =
    fun link ->
      Option.map (fun ret -> new GMenu_link_iter_and__menu_model.menu_model ret) (Menu_item.get_link obj link)

  method set_detailed_action : string -> unit =
    fun detailed_action ->
      (Menu_item.set_detailed_action obj detailed_action)

  method set_label : string option -> unit =
    fun label ->
      (Menu_item.set_label obj label)

  method set_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option -> unit =
    fun link model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Menu_item.set_link obj link model)

  method set_section : GMenu_link_iter_and__menu_model.menu_model_t option -> unit =
    fun section ->
      let section = Option.map (fun (c) -> c#as_menu_model) section in
      (Menu_item.set_section obj section)

  method set_submenu : GMenu_link_iter_and__menu_model.menu_model_t option -> unit =
    fun submenu ->
      let submenu = Option.map (fun (c) -> c#as_menu_model) submenu in
      (Menu_item.set_submenu obj submenu)

    method as_menu_item = obj
end

let new_ (label : string option) (detailed_action : string option) : menu_item_t =
  new menu_item (Menu_item.new_ label detailed_action)

let new_from_model (model : GMenu_link_iter_and__menu_model.menu_model_t) (item_index : int) : menu_item_t =
  let model = model#as_menu_model in
  new menu_item (Menu_item.new_from_model model item_index)

let new_section (label : string option) (section : GMenu_link_iter_and__menu_model.menu_model_t) : menu_item_t =
  let section = section#as_menu_model in
  new menu_item (Menu_item.new_section label section)

let new_submenu (label : string option) (submenu : GMenu_link_iter_and__menu_model.menu_model_t) : menu_item_t =
  let submenu = submenu#as_menu_model in
  new menu_item (Menu_item.new_submenu label submenu)

