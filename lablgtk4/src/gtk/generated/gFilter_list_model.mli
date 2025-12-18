class filter_list_model : Filter_list_model.t ->
  object
    method incremental : bool
    method set_incremental : bool -> unit
    method n_items : int
    method pending : int
    method get_filter : unit -> GFilter.filter option
    method set_filter : #GFilter.filter option -> unit
    method as_filter_list_model : Filter_list_model.t
  end

