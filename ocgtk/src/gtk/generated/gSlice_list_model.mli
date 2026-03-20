class type slice_list_model_t = object
    method get_model : unit -> Ocgtk_gio.Gio.list_model_t option
    method get_offset : unit -> int
    method get_size : unit -> int
    method set_model : Ocgtk_gio.Gio.list_model_t option -> unit
    method set_offset : int -> unit
    method set_size : int -> unit
    method n_items : int
    method as_slice_list_model : Slice_list_model.t
end

class slice_list_model : Slice_list_model.t -> slice_list_model_t

