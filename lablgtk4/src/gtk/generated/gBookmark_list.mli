class bookmark_list : Bookmark_list.t ->
  object
    method attributes : string
    method set_attributes : string -> unit
    method filename : string
    method io_priority : int
    method set_io_priority : int -> unit
    method loading : bool
    method n_items : int
    method is_loading : unit -> bool
    method as_bookmark_list : Bookmark_list.t
  end

