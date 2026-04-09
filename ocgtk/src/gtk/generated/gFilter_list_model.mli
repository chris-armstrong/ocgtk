class type filter_list_model_t = object
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    inherit GSection_model.section_model_t
    method get_filter : unit -> GFilter.filter_t option
    method get_incremental : unit -> bool
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method get_pending : unit -> int
    method set_filter : GFilter.filter_t option -> unit
    method set_incremental : bool -> unit
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method n_items : int
    method as_filter_list_model : Filter_list_model.t
end

class filter_list_model : Filter_list_model.t -> filter_list_model_t

val new_ : Ocgtk_gio.Gio.List_model.list_model_t option -> GFilter.filter_t option -> filter_list_model_t
