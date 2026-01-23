(* High-level class for ListStore *)
class list_store (obj : List_store.t) = object (self)

  method clear : unit -> unit =
    fun () ->
      (List_store.clear obj)

  method iter_is_valid : Tree_iter.t -> bool =
    fun iter ->
      (List_store.iter_is_valid obj iter)

  method move_after : Tree_iter.t -> Tree_iter.t option -> unit =
    fun iter position ->
      (List_store.move_after obj iter position)

  method move_before : Tree_iter.t -> Tree_iter.t option -> unit =
    fun iter position ->
      (List_store.move_before obj iter position)

  method remove : Tree_iter.t -> bool =
    fun iter ->
      (List_store.remove obj iter)

  method reorder : int array -> unit =
    fun new_order ->
      (List_store.reorder obj new_order)

  method swap : Tree_iter.t -> Tree_iter.t -> unit =
    fun a b ->
      (List_store.swap obj a b)

    method as_list_store = obj
end

