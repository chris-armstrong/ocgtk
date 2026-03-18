class flatten_list_model : Flatten_list_model.t ->
  object
    method get_model : unit -> Ocgtk_gio.Gio.list_model option
    method get_model_for_item : int -> Ocgtk_gio.Gio.list_model option
    method set_model : #Ocgtk_gio.Gio.list_model option -> unit
    method n_items : int
    method as_flatten_list_model : Flatten_list_model.t
  end

