(* High-level class for SelectionFilterModel *)
class selection_filter_model (obj : Selection_filter_model.t) = object (self)

  method get_model : unit -> GSelection_model.selection_model option =
    fun () ->
      Option.map (fun ret -> new GSelection_model.selection_model ret) (Selection_filter_model.get_model obj)

  method n_items = Selection_filter_model.get_n_items obj

    method as_selection_filter_model = obj
end

