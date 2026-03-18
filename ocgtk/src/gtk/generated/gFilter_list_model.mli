class filter_list_model : Filter_list_model.t ->
  object
    method get_filter : unit -> GFilter.filter option
    method get_incremental : unit -> bool
    method get_model : unit -> Ocgtk_gio.Gio.list_model option
    method get_pending : unit -> int
    method set_filter : #GFilter.filter option -> unit
    method set_incremental : bool -> unit
    method set_model : #Ocgtk_gio.Gio.list_model option -> unit
    method n_items : int
    method as_filter_list_model : Filter_list_model.t
  end

