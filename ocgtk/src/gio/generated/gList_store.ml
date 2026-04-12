class type list_store_t = object
    inherit GList_model.list_model_t
    method append : [`object_] Gobject.obj -> unit
    method insert : int -> [`object_] Gobject.obj -> unit
    method remove : int -> unit
    method remove_all : unit -> unit
    method splice : int -> int -> [`object_] Gobject.obj array -> int -> unit
    method n_items : int
    method as_list_store : List_store.t
end

(* High-level class for ListStore *)
class list_store (obj : List_store.t) : list_store_t = object (self)
  inherit GList_model.list_model (List_model.from_gobject obj)

  method append : [`object_] Gobject.obj -> unit =
    fun item ->
      (List_store.append obj item)

  method insert : int -> [`object_] Gobject.obj -> unit =
    fun position item ->
      (List_store.insert obj position item)

  method remove : int -> unit =
    fun position ->
      (List_store.remove obj position)

  method remove_all : unit -> unit =
    fun () ->
      (List_store.remove_all obj)

  method splice : int -> int -> [`object_] Gobject.obj array -> int -> unit =
    fun position n_removals additions n_additions ->
      (List_store.splice obj position n_removals additions n_additions)

  method n_items = List_store.get_n_items obj

    method as_list_store = obj
end

