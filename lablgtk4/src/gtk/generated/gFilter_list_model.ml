(* High-level class for FilterListModel *)
class filter_list_model (obj : Filter_list_model.t) = object (self)

  method get_filter : unit -> GFilter.filter option =
    fun () ->
      Option.map (fun ret -> new GFilter.filter ret) (Filter_list_model.get_filter obj)

  method get_incremental : unit -> bool =
    fun () ->
      (Filter_list_model.get_incremental obj)

  method get_pending : unit -> int =
    fun () ->
      (Filter_list_model.get_pending obj)

  method set_filter : 'p1. (#GFilter.filter as 'p1) option -> unit =
    fun filter ->
      let filter = Option.map (fun (c) -> c#as_filter) filter in
      (Filter_list_model.set_filter obj filter)

  method set_incremental : bool -> unit =
    fun incremental ->
      (Filter_list_model.set_incremental obj incremental)

  method n_items = Filter_list_model.get_n_items obj

    method as_filter_list_model = obj
end

