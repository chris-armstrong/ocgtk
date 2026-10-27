(** The classes of {!Ocgio.Menu_link_iter}, {!Ocgio.Menu_model}, defined
    together because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GMenuLinkIter]. *)
class type menu_link_iter_t = object
  method get_name : unit -> string
  method get_value : unit -> menu_model_t
  method next : unit -> bool
  method as_menu_link_iter : Raw.Menu_link_iter.t
end

(** The methods, signals and properties of a [GMenuModel]. *)
and menu_model_t = object
  method on_items_changed :
    ?after:bool ->
    callback:(position:int -> removed:int -> added:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_item_attribute_value :
    int -> string -> Gvariant_type.t option -> Gvariant.t option

  method get_item_link : int -> string -> menu_model_t option
  method get_n_items : unit -> int
  method is_mutable : unit -> bool
  method items_changed : int -> int -> int -> unit

  method iterate_item_attributes :
    int -> Menu_attribute_iter.menu_attribute_iter_t

  method iterate_item_links : int -> menu_link_iter_t
  method as_menu_model : Raw.Menu_model.t
end

(** Wraps a layer 1 handle, {!Ocgio.Raw.Menu_link_iter.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GMenuLinkIter], give one already wrapped. *)
class menu_link_iter : Raw.Menu_link_iter.t -> menu_link_iter_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Menu_model.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GMenuModel], give one already wrapped. *)

and menu_model : Raw.Menu_model.t -> menu_model_t
