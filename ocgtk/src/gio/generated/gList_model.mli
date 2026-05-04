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

class list_model : List_model.t -> list_model_t
