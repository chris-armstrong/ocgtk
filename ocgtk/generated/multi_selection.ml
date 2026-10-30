class type multi_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t

  (** {2:methods Methods} *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Returns the underlying model of [self]. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model that [self] should wrap.

      If [model] is [None], [self] will be empty. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_multi_selection : Raw.Multi_selection.t
end

(* High-level class for MultiSelection *)
class multi_selection (obj : Raw.Multi_selection.t) : multi_selection_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    inherit
      Selection_model.selection_model (Raw.Selection_model.from_gobject obj)

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Multi_selection.get_model obj)

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Multi_selection.set_model obj model

    method item_type = Raw.Multi_selection.get_item_type obj
    method n_items = Raw.Multi_selection.get_n_items obj
    method as_multi_selection = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option) : multi_selection_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = Raw.Multi_selection.new_ model in
  new multi_selection obj_
