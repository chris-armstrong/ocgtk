(* High-level class for FilterListModel *)
class filter_list_model (obj : Filter_list_model.t) = object (self)

  method get_filter : unit -> GFilter.filter option = fun () -> Option.map (fun ret -> new GFilter.filter ret) (Filter_list_model.get_filter obj )

  method get_incremental : unit -> bool = fun () -> (Filter_list_model.get_incremental obj )

  method get_pending : unit -> int = fun () -> (Filter_list_model.get_pending obj )

  method set_filter : 'p1. (#GFilter.filter as 'p1) option -> unit = fun filter -> (Filter_list_model.set_filter obj ( filter |> Option.map (fun x -> x#as_filter) ))

  method set_incremental : bool -> unit = fun incremental -> (Filter_list_model.set_incremental obj incremental)

    method as_filter_list_model = obj
end

