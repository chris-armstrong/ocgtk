class type multi_selection_t = object
    method get_model : unit -> Ocgtk_gio.Gio.list_model_t option
    method set_model : Ocgtk_gio.Gio.list_model_t option -> unit
    method n_items : int
    method as_multi_selection : Multi_selection.t
end

(* High-level class for MultiSelection *)
class multi_selection (obj : Multi_selection.t) : multi_selection_t = object (self)

  method get_model : unit -> Ocgtk_gio.Gio.list_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.list_model ret) (Multi_selection.get_model obj)

  method set_model : Ocgtk_gio.Gio.list_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (Multi_selection.set_model obj model)

  method n_items = Multi_selection.get_n_items obj

    method as_multi_selection = obj
end

