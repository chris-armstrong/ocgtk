class type selection_filter_model_t = object
  inherit Ocgio.List_model.list_model_t

  (** {2:methods Methods} *)

  method get_model : unit -> Selection_model.selection_model_t option
  (** Gets the model currently filtered or [None] if none. *)

  method set_model : Selection_model.selection_model_t option -> unit
  (** Sets the model to be filtered.

      Note that GTK makes no effort to ensure that [model] conforms to the item
      type of [self]. It assumes that the caller knows what they are doing and
      have set up an appropriate filter to ensure that item types match. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_selection_filter_model : Raw.Selection_filter_model.t
end

(* High-level class for SelectionFilterModel *)
class selection_filter_model (obj : Raw.Selection_filter_model.t) :
  selection_filter_model_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method get_model : unit -> Selection_model.selection_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Selection_model.selection_model ret)
          (Raw.Selection_filter_model.get_model obj)

    method set_model : Selection_model.selection_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_selection_model) model in
        Raw.Selection_filter_model.set_model obj model

    method item_type = Raw.Selection_filter_model.get_item_type obj
    method n_items = Raw.Selection_filter_model.get_n_items obj
    method as_selection_filter_model = obj
  end

let new_ (model : Selection_model.selection_model_t option) :
    selection_filter_model_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let obj_ = Raw.Selection_filter_model.new_ model in
  new selection_filter_model obj_
