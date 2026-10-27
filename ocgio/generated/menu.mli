(** [GMenu] is a simple implementation of [Gio.MenuModel]. You populate a
    [GMenu] by adding [Gio.MenuItem] instances to it.

    There are some convenience functions to allow you to directly add items
    (avoiding [Gio.MenuItem]) for the common cases. To add a regular item, use
    [Gio.Menu.insert]. To add a section, use [Gio.Menu.insert_section]. To add a
    submenu, use [Gio.Menu.insert_submenu].

    Its methods, signals and properties are on {!class-type-menu_t}. The
    functions it is built on are in {!Ocgio.Raw.Menu}. *)

(** The methods, signals and properties of a [GMenu]. *)
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
(** Wraps a layer 1 handle, {!Ocgio.Raw.Menu.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GMenu], give one already wrapped. *)

val new_ : unit -> menu_t
