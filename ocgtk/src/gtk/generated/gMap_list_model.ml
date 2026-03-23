class type map_list_model_t = object
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method has_map : unit -> bool
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method n_items : int
    method as_map_list_model : Map_list_model.t
end

(* High-level class for MapListModel *)
class map_list_model (obj : Map_list_model.t) : map_list_model_t = object (self)

  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret) (Map_list_model.get_model obj)

  method has_map : unit -> bool =
    fun () ->
      (Map_list_model.has_map obj)

  method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (Map_list_model.set_model obj model)

  method n_items = Map_list_model.get_n_items obj

    method as_map_list_model = obj
end

