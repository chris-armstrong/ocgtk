class type selection_model_t = object
  method on_selection_changed :
    callback:(position:int -> n_items:int -> unit) -> Gobject.Signal.handler_id

  method get_selection : unit -> Bitset.t
  method get_selection_in_range : int -> int -> Bitset.t
  method is_selected : int -> bool
  method select_all : unit -> bool
  method select_item : int -> bool -> bool
  method select_range : int -> int -> bool -> bool
  method selection_changed : int -> int -> unit
  method set_selection : Bitset.t -> Bitset.t -> bool
  method unselect_all : unit -> bool
  method unselect_item : int -> bool
  method unselect_range : int -> int -> bool
  method as_selection_model : Selection_model.t
end

(* High-level class for SelectionModel *)
class selection_model (obj : Selection_model.t) : selection_model_t =
  object (self)
    method on_selection_changed ~callback =
      Selection_model.on_selection_changed self#as_selection_model ~callback

    method get_selection : unit -> Bitset.t =
      fun () -> Selection_model.get_selection obj

    method get_selection_in_range : int -> int -> Bitset.t =
      fun position n_items ->
        Selection_model.get_selection_in_range obj position n_items

    method is_selected : int -> bool =
      fun position -> Selection_model.is_selected obj position

    method select_all : unit -> bool = fun () -> Selection_model.select_all obj

    method select_item : int -> bool -> bool =
      fun position unselect_rest ->
        Selection_model.select_item obj position unselect_rest

    method select_range : int -> int -> bool -> bool =
      fun position n_items unselect_rest ->
        Selection_model.select_range obj position n_items unselect_rest

    method selection_changed : int -> int -> unit =
      fun position n_items ->
        Selection_model.selection_changed obj position n_items

    method set_selection : Bitset.t -> Bitset.t -> bool =
      fun selected mask -> Selection_model.set_selection obj selected mask

    method unselect_all : unit -> bool =
      fun () -> Selection_model.unselect_all obj

    method unselect_item : int -> bool =
      fun position -> Selection_model.unselect_item obj position

    method unselect_range : int -> int -> bool =
      fun position n_items ->
        Selection_model.unselect_range obj position n_items

    method as_selection_model = obj
  end
