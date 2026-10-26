class type single_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t
  method get_autoselect : unit -> bool
  method get_can_unselect : unit -> bool
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_selected : unit -> int
  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  method set_autoselect : bool -> unit
  method set_can_unselect : bool -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_selected : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_single_selection : Raw.Single_selection.t
end

class single_selection : Raw.Single_selection.t -> single_selection_t

val new_ : Ocgio.List_model.list_model_t option -> single_selection_t
