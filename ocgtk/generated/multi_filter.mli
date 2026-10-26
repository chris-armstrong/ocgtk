class type multi_filter_t = object
  inherit Filter.filter_t
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t
  method append : Filter.filter_t -> unit
  method remove : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_multi_filter : Raw.Multi_filter.t
end

class multi_filter : Raw.Multi_filter.t -> multi_filter_t
