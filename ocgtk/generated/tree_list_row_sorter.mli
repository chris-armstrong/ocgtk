class type tree_list_row_sorter_t = object
  inherit Sorter.sorter_t
  method get_sorter : unit -> Sorter.sorter_t option
  method set_sorter : Sorter.sorter_t option -> unit
  method as_tree_list_row_sorter : Raw.Tree_list_row_sorter.t
end

class tree_list_row_sorter :
  Raw.Tree_list_row_sorter.t ->
  tree_list_row_sorter_t

val new_ : Sorter.sorter_t option -> tree_list_row_sorter_t
