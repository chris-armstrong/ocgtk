(* Signal class defined in gselection_model_signals.ml *)

(* High-level class for SelectionModel *)
class selection_model (obj : Selection_model.t) = object (self)
  inherit Gselection_model_signals.selection_model_signals obj

  method get_selection : unit -> Bitset.t =
    fun () ->
      (Selection_model.get_selection obj)

  method get_selection_in_range : int -> int -> Bitset.t =
    fun position n_items ->
      (Selection_model.get_selection_in_range obj position n_items)

  method is_selected : int -> bool =
    fun position ->
      (Selection_model.is_selected obj position)

  method select_all : unit -> bool =
    fun () ->
      (Selection_model.select_all obj)

  method select_item : int -> bool -> bool =
    fun position unselect_rest ->
      (Selection_model.select_item obj position unselect_rest)

  method select_range : int -> int -> bool -> bool =
    fun position n_items unselect_rest ->
      (Selection_model.select_range obj position n_items unselect_rest)

  method selection_changed : int -> int -> unit =
    fun position n_items ->
      (Selection_model.selection_changed obj position n_items)

  method set_selection : Bitset.t -> Bitset.t -> bool =
    fun selected mask ->
      (Selection_model.set_selection obj selected mask)

  method unselect_all : unit -> bool =
    fun () ->
      (Selection_model.unselect_all obj)

  method unselect_item : int -> bool =
    fun position ->
      (Selection_model.unselect_item obj position)

  method unselect_range : int -> int -> bool =
    fun position n_items ->
      (Selection_model.unselect_range obj position n_items)

    method as_selection_model = obj
end

