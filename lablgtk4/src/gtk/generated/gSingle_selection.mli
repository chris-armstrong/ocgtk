class single_selection : Single_selection.t ->
  object
    method autoselect : bool
    method set_autoselect : bool -> unit
    method can_unselect : bool
    method set_can_unselect : bool -> unit
    method n_items : int
    method selected : int
    method set_selected : int -> unit
    method as_single_selection : Single_selection.t
  end

