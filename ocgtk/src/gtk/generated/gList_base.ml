class type list_base_t = object
    method orientation : Gtk_enums.orientation
    method set_orientation : Gtk_enums.orientation -> unit
    method as_list_base : List_base.t
end

(* High-level class for ListBase *)
class list_base (obj : List_base.t) : list_base_t = object (self)

  method orientation = List_base.get_orientation obj
  method set_orientation v =  List_base.set_orientation obj v

    method as_list_base = obj
end

