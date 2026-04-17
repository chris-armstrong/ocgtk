class type menu_t = object
    inherit GMenu_link_iter_and__menu_model.menu_model_t
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

(* High-level class for Menu *)
class menu (obj : Menu.t) : menu_t = object (self)
  inherit GMenu_link_iter_and__menu_model.menu_model (obj :> Menu_link_iter_and__menu_model.Menu_model.t)

  method append : string option -> string option -> unit =
    fun label detailed_action ->
      (Menu.append obj label detailed_action)

  method append_item : GMenu_item.menu_item_t -> unit =
    fun item ->
      let item = item#as_menu_item in
      (Menu.append_item obj item)

  method append_section : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit =
    fun label section ->
      let section = section#as_menu_model in
      (Menu.append_section obj label section)

  method append_submenu : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit =
    fun label submenu ->
      let submenu = submenu#as_menu_model in
      (Menu.append_submenu obj label submenu)

  method freeze : unit -> unit =
    fun () ->
      (Menu.freeze obj)

  method insert : int -> string option -> string option -> unit =
    fun position label detailed_action ->
      (Menu.insert obj position label detailed_action)

  method insert_item : int -> GMenu_item.menu_item_t -> unit =
    fun position item ->
      let item = item#as_menu_item in
      (Menu.insert_item obj position item)

  method insert_section : int -> string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit =
    fun position label section ->
      let section = section#as_menu_model in
      (Menu.insert_section obj position label section)

  method insert_submenu : int -> string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit =
    fun position label submenu ->
      let submenu = submenu#as_menu_model in
      (Menu.insert_submenu obj position label submenu)

  method prepend : string option -> string option -> unit =
    fun label detailed_action ->
      (Menu.prepend obj label detailed_action)

  method prepend_item : GMenu_item.menu_item_t -> unit =
    fun item ->
      let item = item#as_menu_item in
      (Menu.prepend_item obj item)

  method prepend_section : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit =
    fun label section ->
      let section = section#as_menu_model in
      (Menu.prepend_section obj label section)

  method prepend_submenu : string option -> GMenu_link_iter_and__menu_model.menu_model_t -> unit =
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

let new_ () : menu_t =
  new menu (Menu.new_ ())

