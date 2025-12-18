(* High-level class for DirectoryList *)
class directory_list (obj : Directory_list.t) = object (self)

  method get_attributes : unit -> string option = fun () -> (Directory_list.get_attributes obj )

  method get_io_priority : unit -> int = fun () -> (Directory_list.get_io_priority obj )

  method get_monitored : unit -> bool = fun () -> (Directory_list.get_monitored obj )

  method is_loading : unit -> bool = fun () -> (Directory_list.is_loading obj )

  method set_attributes : string option -> unit = fun attributes -> (Directory_list.set_attributes obj attributes)

  method set_io_priority : int -> unit = fun io_priority -> (Directory_list.set_io_priority obj io_priority)

  method set_monitored : bool -> unit = fun monitored -> (Directory_list.set_monitored obj monitored)

    method as_directory_list = obj
end

