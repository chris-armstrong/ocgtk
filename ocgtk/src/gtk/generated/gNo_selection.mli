class type no_selection_t = object
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    inherit GSection_model.section_model_t
    inherit GSelection_model.selection_model_t
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method item_type : int
    method n_items : int
    method as_no_selection : No_selection.t
end

class no_selection : No_selection.t -> no_selection_t

val new_ : Ocgtk_gio.Gio.List_model.list_model_t option -> no_selection_t
