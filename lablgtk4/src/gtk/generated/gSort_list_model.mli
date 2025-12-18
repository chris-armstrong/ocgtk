class sort_list_model : Sort_list_model.t ->
  object
    method incremental : bool
    method set_incremental : bool -> unit
    method n_items : int
    method pending : int
    method get_section_sorter : unit -> GSorter.sorter option
    method get_sorter : unit -> GSorter.sorter option
    method set_section_sorter : #GSorter.sorter option -> unit
    method set_sorter : #GSorter.sorter option -> unit
    method as_sort_list_model : Sort_list_model.t
  end

