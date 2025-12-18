class directory_list : Directory_list.t ->
  object
    method attributes : string
    method set_attributes : string -> unit
    method io_priority : int
    method set_io_priority : int -> unit
    method loading : bool
    method monitored : bool
    method set_monitored : bool -> unit
    method n_items : int
    method is_loading : unit -> bool
    method as_directory_list : Directory_list.t
  end

