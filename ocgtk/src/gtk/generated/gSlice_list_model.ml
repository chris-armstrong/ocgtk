(* High-level class for SliceListModel *)
class slice_list_model (obj : Slice_list_model.t) = object (self)

  method get_model : unit -> Ocgtk_gio.Gio.list_model option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.list_model ret) (Slice_list_model.get_model obj)

  method get_offset : unit -> int =
    fun () ->
      (Slice_list_model.get_offset obj)

  method get_size : unit -> int =
    fun () ->
      (Slice_list_model.get_size obj)

  method set_model : 'p1. (#Ocgtk_gio.Gio.list_model as 'p1) option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (Slice_list_model.set_model obj model)

  method set_offset : int -> unit =
    fun offset ->
      (Slice_list_model.set_offset obj offset)

  method set_size : int -> unit =
    fun size ->
      (Slice_list_model.set_size obj size)

  method n_items = Slice_list_model.get_n_items obj

    method as_slice_list_model = obj
end

