class type list_store_t = object
    method append : [`object_] Gobject.obj -> unit
    method insert : int -> [`object_] Gobject.obj -> unit
    method remove : int -> unit
    method remove_all : unit -> unit
    method splice : int -> int -> [`object_] Gobject.obj array -> int -> unit
    method n_items : int
    method as_list_store : List_store.t
end

class list_store : List_store.t -> list_store_t

