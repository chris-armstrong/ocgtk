class type filter_list_model_t = object
    method get_filter : unit -> GFilter.filter_t option
    method get_incremental : unit -> bool
    method get_model : unit -> Ocgtk_gio.Gio.list_model_t option
    method get_pending : unit -> int
    method set_filter : GFilter.filter_t option -> unit
    method set_incremental : bool -> unit
    method set_model : Ocgtk_gio.Gio.list_model_t option -> unit
    method n_items : int
    method as_filter_list_model : Filter_list_model.t
end

class filter_list_model : Filter_list_model.t -> filter_list_model_t

