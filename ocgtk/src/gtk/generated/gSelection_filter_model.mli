class type selection_filter_model_t = object
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    method get_model : unit -> GSelection_model.selection_model_t option
    method set_model : GSelection_model.selection_model_t option -> unit
    method item_type : int
    method n_items : int
    method as_selection_filter_model : Selection_filter_model.t
end

class selection_filter_model : Selection_filter_model.t -> selection_filter_model_t

val new_ : GSelection_model.selection_model_t option -> selection_filter_model_t
