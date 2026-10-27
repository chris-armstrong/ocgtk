(** [GMenuItem] is an opaque structure type. You must access it using the
    functions below.

    Its methods, signals and properties are on {!class-type-menu_item_t}. The
    functions it is built on are in {!Ocgio.Raw.Menu_item}. *)

(** The methods, signals and properties of a [GMenuItem]. *)
class type menu_item_t = object
  method get_attribute_value :
    string -> Gvariant_type.t option -> Gvariant.t option

  method get_link : string -> Menu_link_iter_and__menu_model.menu_model_t option

  method set_action_and_target_value :
    string option -> Gvariant.t option -> unit

  method set_attribute_value : string -> Gvariant.t option -> unit
  method set_detailed_action : string -> unit
  method set_icon : Icon.icon_t -> unit
  method set_label : string option -> unit

  method set_link :
    string -> Menu_link_iter_and__menu_model.menu_model_t option -> unit

  method set_section :
    Menu_link_iter_and__menu_model.menu_model_t option -> unit

  method set_submenu :
    Menu_link_iter_and__menu_model.menu_model_t option -> unit

  method as_menu_item : Raw.Menu_item.t
end

class menu_item : Raw.Menu_item.t -> menu_item_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Menu_item.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GMenuItem], give one already wrapped. *)

val new_ : string option -> string option -> menu_item_t

val new_from_model :
  Menu_link_iter_and__menu_model.menu_model_t -> int -> menu_item_t

val new_section :
  string option -> Menu_link_iter_and__menu_model.menu_model_t -> menu_item_t

val new_submenu :
  string option -> Menu_link_iter_and__menu_model.menu_model_t -> menu_item_t
