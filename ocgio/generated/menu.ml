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

(* High-level class for Menu *)
class menu (obj : Raw.Menu.t) : menu_t =
  object (self)
    inherit Menu_link_iter_and__menu_model.menu_model (obj :> Raw.Menu_model.t)

    method append : string option -> string option -> unit =
      fun label detailed_action -> Raw.Menu.append obj label detailed_action

    method append_item : Menu_item.menu_item_t -> unit =
      fun item ->
        let item = item#as_menu_item in
        Raw.Menu.append_item obj item

    method append_section :
        string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit =
      fun label section ->
        let section = section#as_menu_model in
        Raw.Menu.append_section obj label section

    method append_submenu :
        string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit =
      fun label submenu ->
        let submenu = submenu#as_menu_model in
        Raw.Menu.append_submenu obj label submenu

    method freeze : unit -> unit = fun () -> Raw.Menu.freeze obj

    method insert : int -> string option -> string option -> unit =
      fun position label detailed_action ->
        Raw.Menu.insert obj position label detailed_action

    method insert_item : int -> Menu_item.menu_item_t -> unit =
      fun position item ->
        let item = item#as_menu_item in
        Raw.Menu.insert_item obj position item

    method insert_section :
        int ->
        string option ->
        Menu_link_iter_and__menu_model.menu_model_t ->
        unit =
      fun position label section ->
        let section = section#as_menu_model in
        Raw.Menu.insert_section obj position label section

    method insert_submenu :
        int ->
        string option ->
        Menu_link_iter_and__menu_model.menu_model_t ->
        unit =
      fun position label submenu ->
        let submenu = submenu#as_menu_model in
        Raw.Menu.insert_submenu obj position label submenu

    method prepend : string option -> string option -> unit =
      fun label detailed_action -> Raw.Menu.prepend obj label detailed_action

    method prepend_item : Menu_item.menu_item_t -> unit =
      fun item ->
        let item = item#as_menu_item in
        Raw.Menu.prepend_item obj item

    method prepend_section :
        string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit =
      fun label section ->
        let section = section#as_menu_model in
        Raw.Menu.prepend_section obj label section

    method prepend_submenu :
        string option -> Menu_link_iter_and__menu_model.menu_model_t -> unit =
      fun label submenu ->
        let submenu = submenu#as_menu_model in
        Raw.Menu.prepend_submenu obj label submenu

    method remove : int -> unit = fun position -> Raw.Menu.remove obj position
    method remove_all : unit -> unit = fun () -> Raw.Menu.remove_all obj
    method as_menu = obj
  end

let new_ () : menu_t = new menu (Raw.Menu.new_ ())
