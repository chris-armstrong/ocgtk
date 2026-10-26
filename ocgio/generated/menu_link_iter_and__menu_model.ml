(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type menu_link_iter_t = object
  method get_name : unit -> string
  method get_value : unit -> menu_model_t
  method next : unit -> bool
  method as_menu_link_iter : Raw.Menu_link_iter.t
end

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

class menu_link_iter (obj : Raw.Menu_link_iter.t) : menu_link_iter_t =
  object (self)
    method get_name : unit -> string = fun () -> Raw.Menu_link_iter.get_name obj

    method get_value : unit -> menu_model_t =
      fun () -> new menu_model (Raw.Menu_link_iter.get_value obj)

    method next : unit -> bool = fun () -> Raw.Menu_link_iter.next obj
    method as_menu_link_iter = obj
  end

and menu_model (obj : Raw.Menu_model.t) : menu_model_t =
  object (self)
    method on_items_changed ?(after = false) ~callback () =
      Raw.Menu_model.on_items_changed ~after self#as_menu_model ~callback

    method get_item_attribute_value :
        int -> string -> Gvariant_type.t option -> Gvariant.t option =
      fun item_index attribute expected_type ->
        Raw.Menu_model.get_item_attribute_value obj item_index attribute
          expected_type

    method get_item_link : int -> string -> menu_model_t option =
      fun item_index link ->
        Option.map
          (fun ret -> new menu_model ret)
          (Raw.Menu_model.get_item_link obj item_index link)

    method get_n_items : unit -> int = fun () -> Raw.Menu_model.get_n_items obj
    method is_mutable : unit -> bool = fun () -> Raw.Menu_model.is_mutable obj

    method items_changed : int -> int -> int -> unit =
      fun position removed added ->
        Raw.Menu_model.items_changed obj position removed added

    method iterate_item_attributes :
        int -> Menu_attribute_iter.menu_attribute_iter_t =
      fun item_index ->
        new Menu_attribute_iter.menu_attribute_iter
          (Raw.Menu_model.iterate_item_attributes obj item_index)

    method iterate_item_links : int -> menu_link_iter_t =
      fun item_index ->
        new menu_link_iter (Raw.Menu_model.iterate_item_links obj item_index)

    method as_menu_model = obj
  end
