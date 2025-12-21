class list_model : List_model.t ->
  object
    inherit Glist_model_signals.list_model_signals
    method get_n_items : unit -> int
    method items_changed : int -> int -> int -> unit
    method as_list_model : List_model.t
  end

