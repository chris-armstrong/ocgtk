class type multi_sorter_t = object
  inherit Sorter.sorter_t
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t
  method append : Sorter.sorter_t -> unit
  method remove : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_multi_sorter : Raw.Multi_sorter.t
end

class multi_sorter : Raw.Multi_sorter.t -> multi_sorter_t

val new_ : unit -> multi_sorter_t
