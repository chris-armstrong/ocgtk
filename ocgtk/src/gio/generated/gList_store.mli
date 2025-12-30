class list_store : List_store.t ->
  object
    method remove : int -> unit
    method remove_all : unit -> unit
    method n_items : int
    method as_list_store : List_store.t
  end

