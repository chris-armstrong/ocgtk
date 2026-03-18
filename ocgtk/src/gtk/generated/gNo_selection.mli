class no_selection : No_selection.t ->
  object
    method get_model : unit -> Ocgtk_gio.Gio.list_model option
    method set_model : #Ocgtk_gio.Gio.list_model option -> unit
    method n_items : int
    method as_no_selection : No_selection.t
  end

