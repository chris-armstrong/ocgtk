class single_selection : Single_selection.t ->
  object
    method get_autoselect : unit -> bool
    method get_can_unselect : unit -> bool
    method get_selected : unit -> int
    method set_autoselect : bool -> unit
    method set_can_unselect : bool -> unit
    method set_selected : int -> unit
    method as_single_selection : Single_selection.t
  end

