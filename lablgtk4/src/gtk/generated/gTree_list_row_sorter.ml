(* High-level class for TreeListRowSorter *)
class tree_list_row_sorter (obj : Tree_list_row_sorter.t) = object (self)

  method get_sorter : unit -> GSorter.sorter option =
    fun () ->
      Option.map (fun ret -> new GSorter.sorter ret) (Tree_list_row_sorter.get_sorter obj)

  method set_sorter : 'p1. (#GSorter.sorter as 'p1) option -> unit =
    fun sorter ->
      let sorter = Option.map (fun (c) -> c#as_sorter) sorter in
      (Tree_list_row_sorter.set_sorter obj sorter)

    method as_tree_list_row_sorter = obj
end

