class map_list_model : Map_list_model.t ->
  object
    method get_model : unit -> Ocgtk_gio.Gio.list_model option
    method has_map : unit -> bool
    method set_model : #Ocgtk_gio.Gio.list_model option -> unit
    method n_items : int
    method as_map_list_model : Map_list_model.t
  end

