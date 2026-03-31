class type slice_list_model_t = object
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method get_offset : unit -> int
    method get_size : unit -> int
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method set_offset : int -> unit
    method set_size : int -> unit
    method n_items : int
    method as_slice_list_model : Slice_list_model.t
end

(* High-level class for SliceListModel *)
class slice_list_model (obj : Slice_list_model.t) : slice_list_model_t = object (self)

  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret) (Slice_list_model.get_model obj)

  method get_offset : unit -> int =
    fun () ->
      (Slice_list_model.get_offset obj)

  method get_size : unit -> int =
    fun () ->
      (Slice_list_model.get_size obj)

  method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit =
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

let new_ (model : Ocgtk_gio.Gio.List_model.list_model_t option) (offset : int) (size : int) : slice_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = Slice_list_model.new_ model offset size in
  new slice_list_model obj_

