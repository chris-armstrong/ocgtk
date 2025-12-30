class selection_model : Selection_model.t ->
  object
    inherit Gselection_model_signals.selection_model_signals
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

