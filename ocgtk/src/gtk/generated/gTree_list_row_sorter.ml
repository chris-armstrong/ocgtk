class type tree_list_row_sorter_t = object
    method get_sorter : unit -> GSorter.sorter_t option
    method set_sorter : GSorter.sorter_t option -> unit
    method as_tree_list_row_sorter : Tree_list_row_sorter.t
end

(* High-level class for TreeListRowSorter *)
class tree_list_row_sorter (obj : Tree_list_row_sorter.t) : tree_list_row_sorter_t = object (self)

  method get_sorter : unit -> GSorter.sorter_t option =
    fun () ->
      Option.map (fun ret -> new GSorter.sorter ret) (Tree_list_row_sorter.get_sorter obj)

  method set_sorter : GSorter.sorter_t option -> unit =
    fun sorter ->
      let sorter = Option.map (fun (c) -> c#as_sorter) sorter in
      (Tree_list_row_sorter.set_sorter obj sorter)

    method as_tree_list_row_sorter = obj
end

