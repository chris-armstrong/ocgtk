(* High-level class for DirectoryList *)
class directory_list (obj : Directory_list.t) = object (self)

  method attributes = Directory_list.get_attributes obj
  method set_attributes v = Directory_list.set_attributes obj v

  method io_priority = Directory_list.get_io_priority obj
  method set_io_priority v = Directory_list.set_io_priority obj v

  method loading = Directory_list.get_loading obj

  method monitored = Directory_list.get_monitored obj
  method set_monitored v = Directory_list.set_monitored obj v

  method n_items = Directory_list.get_n_items obj

  method is_loading : unit -> bool = fun () -> (Directory_list.is_loading obj )

    method as_directory_list = obj
end

