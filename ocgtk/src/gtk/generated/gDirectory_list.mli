class directory_list : Directory_list.t ->
  object
    method get_attributes : unit -> string option
    method get_io_priority : unit -> int
    method get_monitored : unit -> bool
    method is_loading : unit -> bool
    method set_attributes : string option -> unit
    method set_io_priority : int -> unit
    method set_monitored : bool -> unit
    method loading : bool
    method n_items : int
    method as_directory_list : Directory_list.t
  end

