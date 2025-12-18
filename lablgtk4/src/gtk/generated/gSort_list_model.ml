(* High-level class for SortListModel *)
class sort_list_model (obj : Sort_list_model.t) = object (self)

  method incremental = Sort_list_model.get_incremental obj
  method set_incremental v = Sort_list_model.set_incremental obj v

  method n_items = Sort_list_model.get_n_items obj

  method pending = Sort_list_model.get_pending obj

  method get_section_sorter : unit -> GSorter.sorter option = fun () -> Option.map (fun ret -> new GSorter.sorter ret) (Sort_list_model.get_section_sorter obj )

  method get_sorter : unit -> GSorter.sorter option = fun () -> Option.map (fun ret -> new GSorter.sorter ret) (Sort_list_model.get_sorter obj )

  method set_section_sorter : 'p1. (#GSorter.sorter as 'p1) option -> unit = fun sorter -> (Sort_list_model.set_section_sorter obj ( sorter |> Option.map (fun x -> x#as_sorter) ))

  method set_sorter : 'p1. (#GSorter.sorter as 'p1) option -> unit = fun sorter -> (Sort_list_model.set_sorter obj ( sorter |> Option.map (fun x -> x#as_sorter) ))

    method as_sort_list_model = obj
end

