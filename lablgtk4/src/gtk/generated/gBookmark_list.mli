class bookmark_list : Bookmark_list.t ->
  object
    method get_attributes : unit -> string option
    method get_filename : unit -> string
    method get_io_priority : unit -> int
    method is_loading : unit -> bool
    method set_attributes : string option -> unit
    method set_io_priority : int -> unit
    method as_bookmark_list : Bookmark_list.t
  end

