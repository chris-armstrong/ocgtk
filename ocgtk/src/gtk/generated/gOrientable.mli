class type orientable_t = object
  method get_orientation : unit -> Gtk_enums.orientation
  method set_orientation : Gtk_enums.orientation -> unit
  method as_orientable : Orientable.t
end

class orientable : Orientable.t -> orientable_t
