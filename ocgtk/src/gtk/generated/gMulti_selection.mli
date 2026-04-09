class type multi_selection_t = object
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    inherit GSection_model.section_model_t
    inherit GSelection_model.selection_model_t
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method n_items : int
    method as_multi_selection : Multi_selection.t
end

class multi_selection : Multi_selection.t -> multi_selection_t

val new_ : Ocgtk_gio.Gio.List_model.list_model_t option -> multi_selection_t
