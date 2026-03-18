(* High-level class for FlattenListModel *)
class flatten_list_model (obj : Flatten_list_model.t) = object (self)

  method get_model : unit -> Ocgtk_gio.Gio.list_model option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.list_model ret) (Flatten_list_model.get_model obj)

  method get_model_for_item : int -> Ocgtk_gio.Gio.list_model option =
    fun position ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.list_model ret) (Flatten_list_model.get_model_for_item obj position)

  method set_model : 'p1. (#Ocgtk_gio.Gio.list_model as 'p1) option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (Flatten_list_model.set_model obj model)

  method n_items = Flatten_list_model.get_n_items obj

    method as_flatten_list_model = obj
end

