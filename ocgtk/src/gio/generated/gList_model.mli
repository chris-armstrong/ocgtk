class type list_model_t = object
  inherit Glist_model_signals.list_model_signals
  method get_item_type : unit -> int
  method get_n_items : unit -> int
  method get_object : int -> [ `object_ ] Gobject.obj option
  method items_changed : int -> int -> int -> unit
  method as_list_model : List_model.t
end

class list_model : List_model.t -> list_model_t
