class tree_list_row_sorter : Tree_list_row_sorter.t ->
  object
    method get_sorter : unit -> GSorter.sorter option
    method set_sorter : #GSorter.sorter option -> unit
    method as_tree_list_row_sorter : Tree_list_row_sorter.t
  end

