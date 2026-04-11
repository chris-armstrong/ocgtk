class type menu_item_t = object
    method get_attribute_value : string -> Gvariant_type.t option -> Gvariant.t option
    method get_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option
    method set_action_and_target_value : string option -> Gvariant.t option -> unit
    method set_attribute_value : string -> Gvariant.t option -> unit
    method set_detailed_action : string -> unit
    method set_icon : GIcon.icon_t -> unit
    method set_label : string option -> unit
    method set_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method set_section : GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method set_submenu : GMenu_link_iter_and__menu_model.menu_model_t option -> unit
    method as_menu_item : Menu_item.t
end

(* High-level class for MenuItem *)
class menu_item (obj : Menu_item.t) : menu_item_t = object (self)

  method get_attribute_value : string -> Gvariant_type.t option -> Gvariant.t option =
    fun attribute expected_type ->
      (Menu_item.get_attribute_value obj attribute expected_type)

  method get_link : string -> GMenu_link_iter_and__menu_model.menu_model_t option =
    fun link ->
      Option.map (fun ret -> new GMenu_link_iter_and__menu_model.menu_model ret) (Menu_item.get_link obj link)

  method set_action_and_target_value : string option -> Gvariant.t option -> unit =
    fun action target_value ->
      (Menu_item.set_action_and_target_value obj action target_value)

  method set_attribute_value : string -> Gvariant.t option -> unit =
    fun attribute value ->
      (Menu_item.set_attribute_value obj attribute value)

  method set_detailed_action : string -> unit =
    fun detailed_action ->
      (Menu_item.set_detailed_action obj detailed_action)

  method set_icon : GIcon.icon_t -> unit =
    fun icon ->
      let icon = icon#as_icon in
      (Menu_item.set_icon obj icon)

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
  let obj_ = Menu_item.new_ label detailed_action in
  new menu_item obj_

let new_from_model (model : GMenu_link_iter_and__menu_model.menu_model_t) (item_index : int) : menu_item_t =
  let model = model#as_menu_model in
  let obj_ = Menu_item.new_from_model model item_index in
  new menu_item obj_

let new_section (label : string option) (section : GMenu_link_iter_and__menu_model.menu_model_t) : menu_item_t =
  let section = section#as_menu_model in
  let obj_ = Menu_item.new_section label section in
  new menu_item obj_

let new_submenu (label : string option) (submenu : GMenu_link_iter_and__menu_model.menu_model_t) : menu_item_t =
  let submenu = submenu#as_menu_model in
  let obj_ = Menu_item.new_submenu label submenu in
  new menu_item obj_

