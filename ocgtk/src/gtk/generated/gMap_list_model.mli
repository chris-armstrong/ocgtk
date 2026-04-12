class type map_list_model_t = object
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    inherit GSection_model.section_model_t
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method has_map : unit -> bool
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method n_items : int
    method as_map_list_model : Map_list_model.t
end

class map_list_model : Map_list_model.t -> map_list_model_t

