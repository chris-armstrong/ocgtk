(* High-level class for ListStore *)
class list_store (obj : List_store.t) = object (self)

  method remove : int -> unit =
    fun position ->
      (List_store.remove obj position)

  method remove_all : unit -> unit =
    fun () ->
      (List_store.remove_all obj)

  method n_items = List_store.get_n_items obj

    method as_list_store = obj
end

