class type no_selection_t = object
    method get_model : unit -> Ocgtk_gio.Gio.list_model_t option
    method set_model : Ocgtk_gio.Gio.list_model_t option -> unit
    method n_items : int
    method as_no_selection : No_selection.t
end

class no_selection : No_selection.t -> no_selection_t

