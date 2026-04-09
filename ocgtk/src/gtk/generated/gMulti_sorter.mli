class type multi_sorter_t = object
    inherit GSorter.sorter_t
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    inherit GBuildable.buildable_t
    method append : GSorter.sorter_t -> unit
    method remove : int -> unit
    method n_items : int
    method as_multi_sorter : Multi_sorter.t
end

class multi_sorter : Multi_sorter.t -> multi_sorter_t

val new_ : unit -> multi_sorter_t
