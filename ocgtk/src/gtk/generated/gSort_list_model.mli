class type sort_list_model_t = object
    method get_incremental : unit -> bool
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method get_pending : unit -> int
    method get_section_sorter : unit -> GSorter.sorter_t option
    method get_sorter : unit -> GSorter.sorter_t option
    method set_incremental : bool -> unit
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method set_section_sorter : GSorter.sorter_t option -> unit
    method set_sorter : GSorter.sorter_t option -> unit
    method item_type : int
    method n_items : int
    method as_sort_list_model : Sort_list_model.t
end

class sort_list_model : Sort_list_model.t -> sort_list_model_t

val new_ : Ocgtk_gio.Gio.List_model.list_model_t option -> GSorter.sorter_t option -> sort_list_model_t
