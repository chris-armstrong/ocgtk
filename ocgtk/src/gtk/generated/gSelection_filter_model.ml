class type selection_filter_model_t = object
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    method get_model : unit -> GSelection_model.selection_model_t option
    method item_type : int
    method n_items : int
    method as_selection_filter_model : Selection_filter_model.t
end

(* High-level class for SelectionFilterModel *)
class selection_filter_model (obj : Selection_filter_model.t) : selection_filter_model_t = object (self)
  inherit Ocgtk_gio.Gio.List_model.list_model (Ocgtk_gio.Gio.Wrappers.List_model.from_gobject obj)

  method get_model : unit -> GSelection_model.selection_model_t option =
    fun () ->
      Option.map (fun ret -> new GSelection_model.selection_model ret) (Selection_filter_model.get_model obj)

  method item_type = Selection_filter_model.get_item_type obj

  method n_items = Selection_filter_model.get_n_items obj

    method as_selection_filter_model = obj
end

let new_ (model : GSelection_model.selection_model_t option) : selection_filter_model_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let obj_ = Selection_filter_model.new_ model in
  new selection_filter_model obj_

