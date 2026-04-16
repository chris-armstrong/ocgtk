class type flatten_list_model_t = object
  inherit Ocgtk_gio.Gio.List_model.list_model_t
  inherit GSection_model.section_model_t
  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option

  method get_model_for_item :
    int -> Ocgtk_gio.Gio.List_model.list_model_t option

  method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
  method item_type : int
  method n_items : int
  method as_flatten_list_model : Flatten_list_model.t
end

(* High-level class for FlattenListModel *)
class flatten_list_model (obj : Flatten_list_model.t) : flatten_list_model_t =
  object (self)
    inherit
      Ocgtk_gio.Gio.List_model.list_model
        (Ocgtk_gio.Gio.Wrappers.List_model.from_gobject obj)

    inherit GSection_model.section_model (Section_model.from_gobject obj)

    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret)
          (Flatten_list_model.get_model obj)

    method get_model_for_item :
        int -> Ocgtk_gio.Gio.List_model.list_model_t option =
      fun position ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret)
          (Flatten_list_model.get_model_for_item obj position)

    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Flatten_list_model.set_model obj model

    method item_type = Flatten_list_model.get_item_type obj
    method n_items = Flatten_list_model.get_n_items obj
    method as_flatten_list_model = obj
  end

let new_ (model : Ocgtk_gio.Gio.List_model.list_model_t option) :
    flatten_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = Flatten_list_model.new_ model in
  new flatten_list_model obj_
