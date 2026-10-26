class type sort_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_incremental : unit -> bool
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_pending : unit -> int
  method get_section_sorter : unit -> Sorter.sorter_t option
  method get_sorter : unit -> Sorter.sorter_t option
  method set_incremental : bool -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_section_sorter : Sorter.sorter_t option -> unit
  method set_sorter : Sorter.sorter_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_sort_list_model : Raw.Sort_list_model.t
end

class sort_list_model : Raw.Sort_list_model.t -> sort_list_model_t

val new_ :
  Ocgio.List_model.list_model_t option ->
  Sorter.sorter_t option ->
  sort_list_model_t
