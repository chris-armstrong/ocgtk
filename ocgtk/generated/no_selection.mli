class type no_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_no_selection : Raw.No_selection.t
end

class no_selection : Raw.No_selection.t -> no_selection_t

val new_ : Ocgio.List_model.list_model_t option -> no_selection_t
