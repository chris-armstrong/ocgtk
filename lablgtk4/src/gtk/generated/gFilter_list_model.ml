(* High-level class for FilterListModel *)
class filter_list_model (obj : Filter_list_model.t) = object (self)

  method incremental = Filter_list_model.get_incremental obj
  method set_incremental v = Filter_list_model.set_incremental obj v

  method n_items = Filter_list_model.get_n_items obj

  method pending = Filter_list_model.get_pending obj

  method get_filter : unit -> GFilter.filter option = fun () -> Option.map (fun ret -> new GFilter.filter ret) (Filter_list_model.get_filter obj )

  method set_filter : 'p1. (#GFilter.filter as 'p1) option -> unit = fun filter -> (Filter_list_model.set_filter obj ( filter |> Option.map (fun x -> x#as_filter) ))

    method as_filter_list_model = obj
end

