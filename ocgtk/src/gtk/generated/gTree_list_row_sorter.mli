class type tree_list_row_sorter_t = object
  inherit GSorter.sorter_t
  method get_sorter : unit -> GSorter.sorter_t option
  method set_sorter : GSorter.sorter_t option -> unit
  method as_tree_list_row_sorter : Tree_list_row_sorter.t
end

class tree_list_row_sorter : Tree_list_row_sorter.t -> tree_list_row_sorter_t

val new_ : GSorter.sorter_t option -> tree_list_row_sorter_t
