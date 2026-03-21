class type list_base_t = object
    method orientation : Gtk_enums.orientation
    method set_orientation : Gtk_enums.orientation -> unit
    method as_list_base : List_base.t
end

class list_base : List_base.t -> list_base_t

