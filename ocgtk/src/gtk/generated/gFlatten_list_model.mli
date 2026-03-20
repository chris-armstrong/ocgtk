class type flatten_list_model_t = object
    method get_model : unit -> Ocgtk_gio.Gio.list_model_t option
    method get_model_for_item : int -> Ocgtk_gio.Gio.list_model_t option
    method set_model : Ocgtk_gio.Gio.list_model_t option -> unit
    method n_items : int
    method as_flatten_list_model : Flatten_list_model.t
end

class flatten_list_model : Flatten_list_model.t -> flatten_list_model_t

