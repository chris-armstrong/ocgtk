(* High-level class for NoSelection *)
class no_selection (obj : No_selection.t) = object (self)

  method get_model : unit -> Ocgtk_gio.Gio.list_model option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.list_model ret) (No_selection.get_model obj)

  method set_model : 'p1. (#Ocgtk_gio.Gio.list_model as 'p1) option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (No_selection.set_model obj model)

  method n_items = No_selection.get_n_items obj

    method as_no_selection = obj
end

