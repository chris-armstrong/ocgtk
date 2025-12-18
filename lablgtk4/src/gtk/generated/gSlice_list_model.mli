class slice_list_model : Slice_list_model.t ->
  object
    method n_items : int
    method offset : int
    method set_offset : int -> unit
    method size : int
    method set_size : int -> unit
    method as_slice_list_model : Slice_list_model.t
  end

