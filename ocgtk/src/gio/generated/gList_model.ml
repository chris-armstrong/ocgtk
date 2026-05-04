class type list_model_t = object
  method on_items_changed :
    callback:(position:int -> removed:int -> added:int -> unit) ->
    Gobject.Signal.handler_id

  method get_item_type : unit -> int
  method get_n_items : unit -> int
  method get_object : int -> [ `object_ ] Gobject.obj option
  method items_changed : int -> int -> int -> unit
  method as_list_model : List_model.t
end

(* High-level class for ListModel *)
class list_model (obj : List_model.t) : list_model_t =
  object (self)
    method on_items_changed ~callback =
      List_model.on_items_changed self#as_list_model ~callback

    method get_item_type : unit -> int = fun () -> List_model.get_item_type obj
    method get_n_items : unit -> int = fun () -> List_model.get_n_items obj

    method get_object : int -> [ `object_ ] Gobject.obj option =
      fun position -> List_model.get_object obj position

    method items_changed : int -> int -> int -> unit =
      fun position removed added ->
        List_model.items_changed obj position removed added

    method as_list_model = obj
  end
