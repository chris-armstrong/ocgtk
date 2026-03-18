(* High-level class for MapListModel *)
class map_list_model (obj : Map_list_model.t) = object (self)

  method get_model : unit -> Ocgtk_gio.Gio.list_model option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.list_model ret) (Map_list_model.get_model obj)

  method has_map : unit -> bool =
    fun () ->
      (Map_list_model.has_map obj)

  method set_model : 'p1. (#Ocgtk_gio.Gio.list_model as 'p1) option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (Map_list_model.set_model obj model)

  method n_items = Map_list_model.get_n_items obj

    method as_map_list_model = obj
end

