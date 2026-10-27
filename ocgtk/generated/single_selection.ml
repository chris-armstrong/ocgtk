class type single_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t
  method get_autoselect : unit -> bool
  method get_can_unselect : unit -> bool
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_selected : unit -> int
  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  method set_autoselect : bool -> unit
  method set_can_unselect : bool -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_selected : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_single_selection : Raw.Single_selection.t
end

(* High-level class for SingleSelection *)
class single_selection (obj : Raw.Single_selection.t) : single_selection_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    inherit
      Selection_model.selection_model (Raw.Selection_model.from_gobject obj)

    method get_autoselect : unit -> bool =
      fun () -> Raw.Single_selection.get_autoselect obj

    method get_can_unselect : unit -> bool =
      fun () -> Raw.Single_selection.get_can_unselect obj

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Single_selection.get_model obj)

    method get_selected : unit -> int =
      fun () -> Raw.Single_selection.get_selected obj

    method get_selected_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Single_selection.get_selected_item obj

    method set_autoselect : bool -> unit =
      fun autoselect -> Raw.Single_selection.set_autoselect obj autoselect

    method set_can_unselect : bool -> unit =
      fun can_unselect -> Raw.Single_selection.set_can_unselect obj can_unselect

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Single_selection.set_model obj model

    method set_selected : int -> unit =
      fun position -> Raw.Single_selection.set_selected obj position

    method item_type = Raw.Single_selection.get_item_type obj
    method n_items = Raw.Single_selection.get_n_items obj
    method as_single_selection = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option) : single_selection_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = Raw.Single_selection.new_ model in
  new single_selection obj_
