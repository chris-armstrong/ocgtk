(* High-level class for SingleSelection *)
class single_selection (obj : Single_selection.t) = object (self)

  method get_autoselect : unit -> bool =
    fun () ->
      (Single_selection.get_autoselect obj)

  method get_can_unselect : unit -> bool =
    fun () ->
      (Single_selection.get_can_unselect obj)

  method get_selected : unit -> int =
    fun () ->
      (Single_selection.get_selected obj)

  method set_autoselect : bool -> unit =
    fun autoselect ->
      (Single_selection.set_autoselect obj autoselect)

  method set_can_unselect : bool -> unit =
    fun can_unselect ->
      (Single_selection.set_can_unselect obj can_unselect)

  method set_selected : int -> unit =
    fun position ->
      (Single_selection.set_selected obj position)

  method n_items = Single_selection.get_n_items obj

    method as_single_selection = obj
end

