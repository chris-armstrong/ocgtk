(* High-level class for SliceListModel *)
class slice_list_model (obj : Slice_list_model.t) = object (self)

  method get_offset : unit -> int = fun () -> (Slice_list_model.get_offset obj )

  method get_size : unit -> int = fun () -> (Slice_list_model.get_size obj )

  method set_offset : int -> unit = fun offset -> (Slice_list_model.set_offset obj offset)

  method set_size : int -> unit = fun size -> (Slice_list_model.set_size obj size)

    method as_slice_list_model = obj
end

