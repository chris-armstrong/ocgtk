(* High-level class for SelectionFilterModel *)
class selection_filter_model (obj : Selection_filter_model.t) = object (self)

  method get_model : unit -> GSelection_model.selection_model option = fun () -> Option.map (fun ret -> new GSelection_model.selection_model ret) (Selection_filter_model.get_model obj )

  method set_model : GSelection_model.selection_model option -> unit = fun model -> (Selection_filter_model.set_model obj ( model |> Option.map (fun x -> x#as_selection_model) ))

    method as_selection_filter_model = obj
end

