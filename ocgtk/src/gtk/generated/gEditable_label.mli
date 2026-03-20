class type editable_label_t = object
    method get_editing : unit -> bool
    method start_editing : unit -> unit
    method stop_editing : bool -> unit
    method as_editable_label : Editable_label.t
end

class editable_label : Editable_label.t -> editable_label_t

