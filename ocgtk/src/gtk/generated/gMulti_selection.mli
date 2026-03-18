class multi_selection : Multi_selection.t ->
  object
    method get_model : unit -> Ocgtk_gio.Gio.list_model option
    method set_model : #Ocgtk_gio.Gio.list_model option -> unit
    method n_items : int
    method as_multi_selection : Multi_selection.t
  end

