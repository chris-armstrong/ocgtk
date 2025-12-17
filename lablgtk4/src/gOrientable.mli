class orientable : Orientable.t ->
  object
    method get_orientation : unit -> Gtk_enums.orientation
    method set_orientation : Gtk_enums.orientation -> unit
    method as_orientable : Orientable.t
  end

