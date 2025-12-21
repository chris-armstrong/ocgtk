(* High-level class for Menu *)
class menu (obj : Menu.t) = object (self)

  method append : string option -> string option -> unit =
    fun label detailed_action ->
      (Menu.append obj label detailed_action)

  method append_item : 'p1. (#GMenu_item.menu_item as 'p1) -> unit =
    fun item ->
      let item = item#as_menu_item in
      (Menu.append_item obj item)

  method append_section : 'p1. string option -> (#GMenu_link_iter_and__menu_model.menu_model as 'p1) -> unit =
    fun label section ->
      let section = section#as_menu_model in
      (Menu.append_section obj label section)

  method append_submenu : 'p1. string option -> (#GMenu_link_iter_and__menu_model.menu_model as 'p1) -> unit =
    fun label submenu ->
      let submenu = submenu#as_menu_model in
      (Menu.append_submenu obj label submenu)

  method freeze : unit -> unit =
    fun () ->
      (Menu.freeze obj)

  method insert : int -> string option -> string option -> unit =
    fun position label detailed_action ->
      (Menu.insert obj position label detailed_action)

  method insert_item : 'p1. int -> (#GMenu_item.menu_item as 'p1) -> unit =
    fun position item ->
      let item = item#as_menu_item in
      (Menu.insert_item obj position item)

  method insert_section : 'p1. int -> string option -> (#GMenu_link_iter_and__menu_model.menu_model as 'p1) -> unit =
    fun position label section ->
      let section = section#as_menu_model in
      (Menu.insert_section obj position label section)

  method insert_submenu : 'p1. int -> string option -> (#GMenu_link_iter_and__menu_model.menu_model as 'p1) -> unit =
    fun position label submenu ->
      let submenu = submenu#as_menu_model in
      (Menu.insert_submenu obj position label submenu)

  method prepend : string option -> string option -> unit =
    fun label detailed_action ->
      (Menu.prepend obj label detailed_action)

  method prepend_item : 'p1. (#GMenu_item.menu_item as 'p1) -> unit =
    fun item ->
      let item = item#as_menu_item in
      (Menu.prepend_item obj item)

  method prepend_section : 'p1. string option -> (#GMenu_link_iter_and__menu_model.menu_model as 'p1) -> unit =
    fun label section ->
      let section = section#as_menu_model in
      (Menu.prepend_section obj label section)

  method prepend_submenu : 'p1. string option -> (#GMenu_link_iter_and__menu_model.menu_model as 'p1) -> unit =
    fun label submenu ->
      let submenu = submenu#as_menu_model in
      (Menu.prepend_submenu obj label submenu)

  method remove : int -> unit =
    fun position ->
      (Menu.remove obj position)

  method remove_all : unit -> unit =
    fun () ->
      (Menu.remove_all obj)

    method as_menu = obj
end

