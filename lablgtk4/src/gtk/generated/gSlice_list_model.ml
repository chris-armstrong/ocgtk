(* High-level class for SliceListModel *)
class slice_list_model (obj : Slice_list_model.t) = object (self)

  method n_items = Slice_list_model.get_n_items obj

  method offset = Slice_list_model.get_offset obj
  method set_offset v = Slice_list_model.set_offset obj v

  method size = Slice_list_model.get_size obj
  method set_size v = Slice_list_model.set_size obj v

    method as_slice_list_model = obj
end

