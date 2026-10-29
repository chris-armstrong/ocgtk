class type no_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t

  (** {2:methods Methods} *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that [self] is wrapping. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model that [self] should wrap.

      If [model] is [NULL], this model will be empty. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_no_selection : Raw.No_selection.t
end

(* High-level class for NoSelection *)
class no_selection (obj : Raw.No_selection.t) : no_selection_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    inherit
      Selection_model.selection_model (Raw.Selection_model.from_gobject obj)

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.No_selection.get_model obj)

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.No_selection.set_model obj model

    method item_type = Raw.No_selection.get_item_type obj
    method n_items = Raw.No_selection.get_n_items obj
    method as_no_selection = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option) : no_selection_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = Raw.No_selection.new_ model in
  new no_selection obj_
