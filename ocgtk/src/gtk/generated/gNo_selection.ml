class type no_selection_t = object
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    inherit GSection_model.section_model_t
    inherit GSelection_model.selection_model_t
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method n_items : int
    method as_no_selection : No_selection.t
end

(* High-level class for NoSelection *)
class no_selection (obj : No_selection.t) : no_selection_t = object (self)
  inherit Ocgtk_gio.Gio.List_model.list_model (Ocgtk_gio.Gio.Wrappers.List_model.from_gobject obj)
  inherit GSection_model.section_model (Section_model.from_gobject obj)
  inherit GSelection_model.selection_model (Selection_model.from_gobject obj)

  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret) (No_selection.get_model obj)

  method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (No_selection.set_model obj model)

  method n_items = No_selection.get_n_items obj

    method as_no_selection = obj
end

let new_ (model : Ocgtk_gio.Gio.List_model.list_model_t option) : no_selection_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = No_selection.new_ model in
  new no_selection obj_

