class type flatten_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t

  (** {2:methods Methods} *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model set via [gtk_flatten_list_model_set_model ()]. *)

  method get_model_for_item : int -> Ocgio.List_model.list_model_t option
  (** Returns the model containing the item at the given position. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets a new model to be flattened. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_flatten_list_model : Raw.Flatten_list_model.t
end

(* High-level class for FlattenListModel *)
class flatten_list_model (obj : Raw.Flatten_list_model.t) : flatten_list_model_t
  =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Flatten_list_model.get_model obj)

    method get_model_for_item : int -> Ocgio.List_model.list_model_t option =
      fun position ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Flatten_list_model.get_model_for_item obj position)

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Flatten_list_model.set_model obj model

    method item_type = Raw.Flatten_list_model.get_item_type obj
    method n_items = Raw.Flatten_list_model.get_n_items obj
    method as_flatten_list_model = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option) : flatten_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = Raw.Flatten_list_model.new_ model in
  new flatten_list_model obj_
