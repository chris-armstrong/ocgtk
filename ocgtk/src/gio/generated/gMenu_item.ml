(* High-level class for MenuItem *)
class menu_item (obj : Menu_item.t) = object (self)

  method get_link : string -> GMenu_link_iter_and__menu_model.menu_model option =
    fun link ->
      Option.map (fun ret -> new GMenu_link_iter_and__menu_model.menu_model ret) (Menu_item.get_link obj link)

  method set_detailed_action : string -> unit =
    fun detailed_action ->
      (Menu_item.set_detailed_action obj detailed_action)

  method set_label : string option -> unit =
    fun label ->
      (Menu_item.set_label obj label)

  method set_link : 'p1. string -> (#GMenu_link_iter_and__menu_model.menu_model as 'p1) option -> unit =
    fun link model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Menu_item.set_link obj link model)

  method set_section : 'p1. (#GMenu_link_iter_and__menu_model.menu_model as 'p1) option -> unit =
    fun section ->
      let section = Option.map (fun (c) -> c#as_menu_model) section in
      (Menu_item.set_section obj section)

  method set_submenu : 'p1. (#GMenu_link_iter_and__menu_model.menu_model as 'p1) option -> unit =
    fun submenu ->
      let submenu = Option.map (fun (c) -> c#as_menu_model) submenu in
      (Menu_item.set_submenu obj submenu)

    method as_menu_item = obj
end

