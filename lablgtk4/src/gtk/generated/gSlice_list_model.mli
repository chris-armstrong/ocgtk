class slice_list_model : Slice_list_model.t ->
  object
    method get_offset : unit -> int
    method get_size : unit -> int
    method set_offset : int -> unit
    method set_size : int -> unit
    method as_slice_list_model : Slice_list_model.t
  end

