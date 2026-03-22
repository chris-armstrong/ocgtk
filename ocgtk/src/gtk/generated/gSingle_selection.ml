class type single_selection_t = object
    method get_autoselect : unit -> bool
    method get_can_unselect : unit -> bool
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method get_selected : unit -> int
    method set_autoselect : bool -> unit
    method set_can_unselect : bool -> unit
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method set_selected : int -> unit
    method n_items : int
    method as_single_selection : Single_selection.t
end

(* High-level class for SingleSelection *)
class single_selection (obj : Single_selection.t) : single_selection_t = object (self)

  method get_autoselect : unit -> bool =
    fun () ->
      (Single_selection.get_autoselect obj)

  method get_can_unselect : unit -> bool =
    fun () ->
      (Single_selection.get_can_unselect obj)

  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret) (Single_selection.get_model obj)

  method get_selected : unit -> int =
    fun () ->
      (Single_selection.get_selected obj)

  method set_autoselect : bool -> unit =
    fun autoselect ->
      (Single_selection.set_autoselect obj autoselect)

  method set_can_unselect : bool -> unit =
    fun can_unselect ->
      (Single_selection.set_can_unselect obj can_unselect)

  method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (Single_selection.set_model obj model)

  method set_selected : int -> unit =
    fun position ->
      (Single_selection.set_selected obj position)

  method n_items = Single_selection.get_n_items obj

    method as_single_selection = obj
end

let new_ (model : Ocgtk_gio.Gio.List_model.list_model_t option) : single_selection_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  new single_selection (Single_selection.new_ model)

